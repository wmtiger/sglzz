package editor.utils
{
	import flash.display.BitmapData;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class FileUtil
	{
		public static const FILE_TYPE_ROOT:int = 0;
		public static const FILE_TYPE_CSV:int = 1;
		public static const FILE_TYPE_BIN:int = 2;// 还没写
		public static const FILE_TYPE_JSON:int = 3;// 还没写
		
		public static const CSV:String = "csv";
		public static const ROOT:String = "root";
		public static const BIN:String = "bin";
		public static const JSON:String = "json";
		public static const ASSETS_ROOT:String = "assetsRoot";
		
		public static const FILE_SUFFIXS:Array = ["", ".csv", ".temp", ".json"];
		
		public function FileUtil()
		{
		}
		
		public static function getASDir():File
		{
			var f:File = File.applicationStorageDirectory;
			if (f.exists)
			{
				return f;
			}
			return null;
		}
		/**
		 * 保存设置的文件
		 * @param data
		 */		
		public static function saveSettingFileObj(data:Object):void
		{
			var f:File = getASDir();
			var db:File;
			if (f != null)
			{
				db = f.resolvePath("setting/pathcfg.set");
				var fs:FileStream = new FileStream();
				fs.open(db, FileMode.WRITE);
				fs.writeObject(data);
				fs.close();
				trace("当前路径设置保存完毕");
			}
		}
		/**
		 * 判断是否有设置文件
		 * @return 
		 */		
		public static function hasSettingFileObj():Boolean
		{
			var f:File = getASDir();
			var db:File;
			if (f != null)
			{
				db = f.resolvePath("setting/pathcfg.set");
				if(!db.exists){
					return false;
				}else{
					return true;
				}
			}
			return false;
		}
		/**
		 * 获取设置的文件
		 * @return 
		 */		
		public static function getSettingFileObj():Object
		{
			var f:File = getASDir();
			var db:File;
			if (f != null)
			{
				db = f.resolvePath("setting/pathcfg.set");
				if(!db.exists){
					return null;
				}
				var fs:FileStream = new FileStream();
				fs.open(db, FileMode.READ);
				var obj:Object = fs.readObject();
				fs.close();
				return obj;
			}
			return null;
		}
		/**
		 * 获取设置中的当前的所需路径
		 * @param fileType	存储的文件类型，如果是json的，就是存成的json的目录，bin则是存储的二进制的目录
		 * @return 
		 */		
		public static function getSettingRootPath(fileType:int = FILE_TYPE_CSV):String
		{
			var path:String = "";
			var setObj:Object = getSettingFileObj();
			if(setObj){
				if(fileType == FILE_TYPE_JSON){
					path = setObj[JSON];
				}else if(fileType == FILE_TYPE_BIN){
					path = setObj[BIN];
				}else if(fileType == FILE_TYPE_ROOT){
					path = setObj[ROOT];
				}else if(fileType == FILE_TYPE_CSV){
					path = setObj[CSV];
				}
			}
			return path;
		}
		/**
		 * 获取某个本地模板数据文件中的数据
		 * @param dbName
		 * @param fileType
		 * @return 
		 * 
		 */		
		public static function getDBFileData(dbName:String, fileType:int = FILE_TYPE_CSV):String
		{
			var suffix:String = FILE_SUFFIXS[fileType];
			var str:String = "";
			var rootPath:String = getSettingRootPath(fileType);
			if(rootPath != ""){
				var f:File = new File(rootPath);
				var db:File;
				if (f != null)
				{
					db = f.resolvePath(dbName + suffix);
					if(db.exists){
						var fs:FileStream = new FileStream();
						fs.open(db, FileMode.READ);
						str = fs.readUTFBytes(fs.bytesAvailable);
						fs.close();
					}
				}
			}
			return str;
		}
		/**
		 * 存储本地模板数据
		 * @param dbName
		 * @param data
		 * @param fileType
		 */		
		public static function saveDBFile(dbName:String, data:String, fileType:int = FILE_TYPE_CSV):void
		{
			var suffix:String = FILE_SUFFIXS[fileType];
			var rootPath:String = getSettingRootPath(fileType);
			if(rootPath != ""){
				var f:File = new File(rootPath);
				var db:File;
				if (f != null)
				{
					db = f.resolvePath(dbName + suffix);
					var fs:FileStream = new FileStream();
					fs.open(db, FileMode.WRITE);
					fs.writeUTFBytes(data);
					fs.close();
					trace("save " + dbName + suffix + " over!");
				}
			}
		}
		/**
		 * 获取编辑器的武将头像目录
		 * @return 
		 */		
		public static function getHeroHeadImgPath(imgUri:String):String
		{
			var path:String = "assets/herohead/" + imgUri;
			return path;
		}
		/**
		 * 获取编辑器的技能图像目录
		 * @return 
		 */		
		public static function getSkillHeadImgPath(imgUri:String):String
		{
			var path:String = "assets/skillhead/" + imgUri;
			return path;
		}
		/**
		 * 获取编辑器的武将头像图像数据【弃用】
		 * @return 
		 */		
		/*public static function getHeroHeadImgData(imgUri:String):BitmapData
		{
			var path:String = "";
			var setObj:Object = getSettingFileObj();
			if(setObj){
				path = setObj[ASSETS_ROOT] + "/herohead/" + imgUri;
			}
			var f:File = new File(path);
			if (f != null && f.exists)
			{
				var bys:ByteArray = new ByteArray();
				var fs:FileStream = new FileStream();
				fs.open(f, FileMode.READ);
				fs.readBytes(bys);
				fs.close();
				bys.position = 0;
				var bmd:BitmapData = new BitmapData(240,240);
				bmd.setPixels(bmd.rect, bys);// 此处报错，原因大概是数组中的数据每次读取的是图片源数据，而jpg中编码里有其他的数据，不止IDAT数据
				return bmd;
			}
			return null;
		}*/
		/**
		 * 获取读取的文件是什么格式
		 * @param fileData
		 * @return 
		 * 
		 */		
		public static function getImgFileType(fileData : ByteArray) : String {
			var b0 : uint = fileData.readUnsignedByte();
			var b1 : uint = fileData.readUnsignedByte();
			fileData.position = 0;
			var fileType : String = "unknown";
			if(b0 == 66 && b1 == 77) {
				fileType = "BMP";
			}else if(b0 == 255 && b1 == 216) {
				fileType = "JPG";
			}else if(b0 == 137 && b1 == 80) {
				fileType = "PNG";
			}else if(b0 == 71 && b1 == 73) {
				fileType = "GIF";
			}
			return fileType;
		}
	}
}