package editor.utils
{
	public class TemplateUtil
	{
		public function TemplateUtil()
		{
		}
		/**
		 * 从obj中获取对应的key的value值
		 * @param obj
		 * @param key
		 * @return 
		 */		
		public static function getDataByObjKey(obj:Object, key:String):String
		{
			return obj[key] ? obj[key] + "" : "";
		}
	}
}