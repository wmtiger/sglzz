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
		// 技能
		
		
		public static const CSV_HEAD:Array = [KEY_TEMPLATE_ID, KEY_NAME, KEY_INIT_LEVEL, KEY_MAX_LEVEL, KEY_INTRO, KEY_KISS_ASS,
			KEY_ATK_SE,KEY_DEAD_SE,KEY_TICS,KEY_HEAD_IMG,KEY_ATK_TYPE,KEY_QUALITY,KEY_TONG_SHUAI,KEY_NEI_ZHENG,KEY_ZHI_LI,
			KEY_WU_LI,KEY_CRIT_POINT,KEY_HP,KEY_ATK_POINT,KEY_SPEED_POINT,KEY_DEF_POINT];
		
		public function HeroTemplate()
		{
			super();
		}
	}
}