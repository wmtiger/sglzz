package com.gamedata.utils
{
	import com.gamedata.template.base.Template;
	
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;

	public class TemplateWriter
	{
		public function TemplateWriter()
		{
		}
		
		public static function writeToCsv(file:File, data:String):void
		{
			if(file!=null && file.exists) {
				var fileStream:FileStream = new FileStream();
				fileStream.open(file,FileMode.WRITE);
				fileStream.writeUTFBytes(data);
				fileStream.close();
				trace("save " + file.name + " over!");
			}
		}
		
		public static function writeToBin(file:File, data:*):void
		{
			if(file!=null && file.exists) {
				var fileStream:FileStream = new FileStream();
				fileStream.open(file,FileMode.WRITE);
				fileStream.writeObject(data);
				fileStream.close();
				trace("save " + file.name + " over!");
			}
		}
		
	}
}