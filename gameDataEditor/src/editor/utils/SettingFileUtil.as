package editor.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class SettingFileUtil
	{
		public static const FILE_TYPE_CSV:int = 1;
		public static const FILE_TYPE_BIN:int = 2;// 还没写
		
		public static const CSV:String = "csv";
		public static const BIN:String = "bin";
		
		public static const FILE_SUFFIXS:Array = ["", ".csv", ".bin"];
		
		public function SettingFileUtil()
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
				if(fileType == FILE_TYPE_BIN){
					path = setObj[BIN];
				}else if(fileType == FILE_TYPE_CSV){
					path = setObj[CSV];
				}
			}
			return path;
		}
	}
}