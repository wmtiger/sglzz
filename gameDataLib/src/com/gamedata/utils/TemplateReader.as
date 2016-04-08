package com.gamedata.utils
{
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;

	public class TemplateReader
	{
		public function TemplateReader()
		{
		}
		
		/**
		 * 将bin的模板文件读出来
		 * @param file
		 * @return 
		 */		
		public static function readObject(file:File):*
		{
			if(file!=null && file.exists) {
				var fileStream:FileStream = new FileStream();
				fileStream.open(file,FileMode.READ);
				var data:* = fileStream.readObject();
				fileStream.close();
				return data;
			}
			return null;
		}
		
		/**
		 * 将csv的模板文件读出来
		 * @param file
		 * @return 
		 */		
		public static function readUtfStr(file:File):String
		{
			if(file!=null && file.exists) {
				var fileStream:FileStream = new FileStream();
				fileStream.open(file,FileMode.READ);
				var data:String = fileStream.readUTFBytes(fileStream.bytesAvailable);
				fileStream.close();
				trace("read " + file.name + " success!");
				return data;
			}
			return "";
		}
	}
}