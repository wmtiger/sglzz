package cfg
{
	import flash.display.Stage;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.core.FlexGlobals;

	public class AppCfg
	{
		public function AppCfg()
		{
		}
		
		public static function getStage():Stage{
			return FlexGlobals.topLevelApplication.stage;
		}
		
		/**
		 * 获取指定的库文件
		 * @param dbName
		 * @return 
		 */		
		public static function getAsdDBFile(dbName:String, suffix:String = ".db"):File{
			var f:File = getDBDir();
			if(f != null){
				var db:File = f.resolvePath(dbName+suffix);
				if(db.exists){
					return db;
				}
			}
			return null;
		}
		
		public static function getASDir():File{
			var f:File = File.applicationStorageDirectory;
			if(f.exists){
				return f;
			}
			return null;
		}
		
		public static function getDBDir():File{
			var f:File = getASDir();
			var db:File;
			if(f != null){
				db = f.resolvePath("dbs");
				if(db.exists){
					return db;
				}
			}
			return null;
		}
		
		public static function saveDBFile(dbName:String, data:String, suffix:String = ".db"):void{
			var f:File = getASDir();
			var db:File;
			if(f != null){
				db = f.resolvePath("dbs"+"/"+dbName+suffix);
				var fs:FileStream = new FileStream();
				fs.open(db,FileMode.WRITE);
				fs.writeUTFBytes(data);
				fs.close();
				trace("save "+dbName+suffix + " over!");
			}
		}
	}
}