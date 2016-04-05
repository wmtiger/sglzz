package com.gamedata.template
{
	import com.gamedata.template.base.Template;
	
	public class SkillTemplate extends Template
	{
		// 基础值
		public static const KEY_TEMPLATE_ID:String = "templateId";
		public static const KEY_NAME:String = "name";
		public static const KEY_HEAD_IMG:String = "headImg";
		
		
		public static const KEY:String = "skill";
		
		public static const CSV_HEAD:Array = [KEY_TEMPLATE_ID, KEY_NAME, KEY_HEAD_IMG];
		
		public function SkillTemplate()
		{
			super();
		}
	}
}