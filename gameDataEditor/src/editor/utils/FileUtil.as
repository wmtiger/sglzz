package editor.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class FileUtil
	{
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
		
		public static function getDBFileData(dbName:String, suffix:String = ".csv"):String
		{
			var f:File = getASDir();
			var db:File;
			var str:String = "";
			if (f != null)
			{
				db = f.resolvePath("dbs/" + dbName + suffix);
				if(!db.exists){
					return null;
				}
				var fs:FileStream = new FileStream();
				fs.open(db, FileMode.READ);
				str = fs.readUTFBytes(fs.bytesAvailable);
				fs.close();
			}
			return str;
		}
		
		public static function saveDBFile(dbName:String, data:String, suffix:String = ".csv"):void
		{
			var f:File = getASDir();
			var db:File;
			if (f != null)
			{
				db = f.resolvePath("dbs/" + dbName + suffix);
				var fs:FileStream = new FileStream();
				fs.open(db, FileMode.WRITE);
				fs.writeUTFBytes(data);
				fs.close();
				trace("save " + dbName + suffix + " over!");
			}
		}
	}
}