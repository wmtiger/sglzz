package com.gamedata.template
{
	import com.gamedata.template.base.Template;
	
	public class HeroTemplate extends Template
	{
		// 基础值
		public static const KEY_TEMPLATE_ID:String = "templateId";
		public static const KEY_NAME:String = "name";
		public static const KEY_INIT_LEVEL:String = "initLevel";
		public static const KEY_MAX_LEVEL:String = "maxLevel";
		public static const KEY_INTRO:String = "intro";
		public static const KEY_KISS_ASS:String = "kissAss";
		public static const KEY_ATK_SE:String = "atkSe";
		public static const KEY_DEAD_SE:String = "deadSe";
		public static const KEY_TICS:String = "tics";
		public static const KEY_HEAD_IMG:String = "headImg";
		public static const KEY_ATK_TYPE:String = "atkType";
		public static const KEY_QUALITY:String = "quality";
		// 将魂属性
		public static const KEY_TONG_SHUAI:String = "tongShuai";
		public static const KEY_NEI_ZHENG:String = "neiZheng";
		public static const KEY_ZHI_LI:String = "zhiLi";
		public static const KEY_WU_LI:String = "wuLi";
		public static const KEY_CRIT_POINT:String = "critPoint";
		public static const KEY_HP:String = "hp";
		public static const KEY_ATK_POINT:String = "atkPoint";
		public static const KEY_SPEED_POINT:String = "speedPoint";
		public static const KEY_DEF_POINT:String = "defPoint";
		// 技能[tid列表]
		public static const KEY_SKILLS:String = "skills";
		// 特性[tid列表]
		public static const KEY_SPECIALS:String = "specials";
		// 备注
		public static const KEY_REMARK:String = "remark";
		
		public static const TYPE:String = "hero";
		
		public static const CSV_HEAD:Array = [KEY_TEMPLATE_ID, KEY_NAME, KEY_INIT_LEVEL, KEY_MAX_LEVEL, KEY_INTRO, KEY_KISS_ASS,
			KEY_ATK_SE,KEY_DEAD_SE,KEY_TICS,KEY_HEAD_IMG,KEY_ATK_TYPE,KEY_QUALITY,KEY_TONG_SHUAI,KEY_NEI_ZHENG,KEY_ZHI_LI,
			KEY_WU_LI,KEY_CRIT_POINT,KEY_HP,KEY_ATK_POINT,KEY_SPEED_POINT,KEY_DEF_POINT, KEY_SKILLS,KEY_SPECIALS,KEY_REMARK];
		
		public function HeroTemplate()
		{
			super();
		}
		
		
		public static function getTemplate(templateId:Number):HeroTemplate {
			if(!hasData(TYPE)) Template.register(TYPE, HeroTemplate);
			return Template.get(templateId, TYPE) as HeroTemplate;
		}
		
		public static function get allTemplates():Array {
			if(!hasData(TYPE)) Template.register(TYPE, HeroTemplate);
			return Template.getAll(TYPE);
		}
		
		public function get name():String
		{
			return _data[KEY_NAME] +"";
		}
		
		public function get initLevel():int
		{
			return int(_data[KEY_INIT_LEVEL] +"");
		}
		
		public function get maxLevel():int
		{
			return int(_data[KEY_MAX_LEVEL] +"");
		}
		
		public function get intro():String
		{
			return _data[KEY_INTRO] +"";
		}
		
		public function get kissAss():String
		{
			return _data[KEY_KISS_ASS] +"";
		}
		
		public function get atkSe():String
		{
			return _data[KEY_ATK_SE] +"";
		}
		
		public function get deadSe():String
		{
			return _data[KEY_DEAD_SE] +"";
		}
		
		public function get tics():String
		{
			return _data[KEY_TICS] +"";
		}
		
		public function get headImg():String
		{
			return _data[KEY_HEAD_IMG] +"";
		}
		
		public function get remark():String
		{
			return _data[KEY_REMARK] +"";
		}
		
		public function get atkType():int
		{
			return int(_data[KEY_ATK_TYPE] +"");
		}
		
		public function get quality():int
		{
			return int(_data[KEY_QUALITY] +"");
		}
		
		public function get skills():Array
		{
			return toNumberArray(_data[KEY_SKILLS] +"");
		}
		
		public function get specials():Array
		{
			return toNumberArray(_data[KEY_SPECIALS] +"");
		}
		
		public function get tongShuai():int
		{
			return int(_data[KEY_TONG_SHUAI] +"");
		}
		
		public function get neiZheng():int
		{
			return int(_data[KEY_NEI_ZHENG] +"");
		}
		
		public function get zhiLi():int
		{
			return int(_data[KEY_ZHI_LI] +"");
		}
		
		public function get wuLi():int
		{
			return int(_data[KEY_WU_LI] +"");
		}
		
		public function get critPoint():int
		{
			return int(_data[KEY_CRIT_POINT] +"");
		}
		
		public function get hp():int
		{
			return int(_data[KEY_HP] +"");
		}
		
		public function get atkPoint():int
		{
			return int(_data[KEY_ATK_POINT] +"");
		}
		
		public function get speedPoint():int
		{
			return int(_data[KEY_SPEED_POINT] +"");
		}
		
		public function get defPoint():int
		{
			return int(_data[KEY_DEF_POINT] +"");
		}
		
	}
}