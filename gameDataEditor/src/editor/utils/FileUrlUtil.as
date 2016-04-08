package editor.utils
{
	public class FileUrlUtil
	{
		public function FileUrlUtil()
		{
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
		 * 获取读取的文件是什么格式
		 * @param fileData
		 * @return 
		 */		
		/*public static function getImgFileType(fileData : ByteArray) : String {
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
		}*/
	}
}