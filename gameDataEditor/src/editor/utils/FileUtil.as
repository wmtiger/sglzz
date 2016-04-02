package editor.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class FileUtil
	{
		public static const FILE_TYPE_ROOT:int = 0;
		public static const FILE_TYPE_CSV:int = 1;
		public static const FILE_TYPE_BIN:int = 2;
		public static const FILE_TYPE_JSON:int = 3;
		
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
		 * 
		 */		
		public static function getSettingRootPath(fileType:int = FILE_TYPE_CSV):String
		{
			var path:String = "";
			var setObj:Object = getSettingFileObj();
			if(setObj){
				if(fileType == FILE_TYPE_JSON){
					path = setObj.json;
				}else if(fileType == FILE_TYPE_BIN){
					path = setObj.bin;
				}else if(fileType == FILE_TYPE_ROOT){
					path = setObj.root;
				}else if(fileType == FILE_TYPE_CSV){
					path = setObj.csv;
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
		 * 
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
	}
}