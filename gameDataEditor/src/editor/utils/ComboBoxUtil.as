package editor.utils
{
	public class ComboBoxUtil
	{
		public function ComboBoxUtil()
		{
		}
		
		/**
		 * combobox的第一项显示方法
		 * @param item
		 * @return 
		 */		
		public static function getBoxFullValue(item:Object):String
		{
			return item["value"] + ": " + item["name"];
		}
	}
}