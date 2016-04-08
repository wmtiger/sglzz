package com.gamedata.template
{
	import com.gamedata.template.base.Template;
	
	public class SkillTemplate extends Template
	{
		// 基础值
		public static const KEY_TEMPLATE_ID:String = "templateId";
		public static const KEY_NAME:String = "name";
		public static const KEY_HEAD_IMG:String = "headImg";
		
		
		public static const TYPE:String = "skill";
		
		public static const CSV_HEAD:Array = [KEY_TEMPLATE_ID, KEY_NAME, KEY_HEAD_IMG];
		
		public function SkillTemplate()
		{
			super();
		}
		
		
		public static function getTemplate(templateId:Number):SkillTemplate {
			if(!hasData(TYPE)) Template.register(TYPE, SkillTemplate);
			return Template.get(templateId, TYPE) as SkillTemplate;
		}
		
		public static function get allTemplates():Array {
			if(!hasData(TYPE)) Template.register(TYPE, SkillTemplate);
			return Template.getAll(TYPE);
		}
		
		
		
		public function get name():String
		{
			return _data[KEY_NAME] +"";
		}
		
		public function get headImg():String
		{
			return _data[KEY_HEAD_IMG] +"";
		}
		
		
	}
}