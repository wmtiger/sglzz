package com.gamedata.template.base
{
	import com.gamedata.utils.CSVUtil;
	import com.gamedata.utils.TemplateUtil;
	
	import flash.filesystem.File;
	import flash.utils.Dictionary;

	public class Template
	{
		//-----------
		// 以下为Template的静态变量及方法
		public static const SUFFIX_TYPE_CSV:String = ".csv";
		public static const SUFFIX_TYPE_BIN:String = ".bin";
		
		/** 所有模板的模板仓库 */
		protected static var templateDepot:Dictionary = new Dictionary();
		
		private static var _file:File;// 设置中的模板文件根目录
		private static var _suffix:String = ".csv";// 默认为csv的后缀，还有bin的
		
		public function Template()
		{
		}

		/**
		 * 初始化模板基类设置
		 */		
		public static function initTemplateSetting(filePath:String, suffix:String = SUFFIX_TYPE_CSV):void
		{
			_file = new File(filePath);
			_suffix = suffix;
		}
		
		public static function saveToFileAll():void
		{
			for each(var tData:TemplateData in templateDepot){
				tData.saveToFile();
			}
		}
		
		public static function get suffix():String
		{
			return _suffix;
		}
		public static function get templateRootFile():File
		{
			return _file;
		}
		
		protected static function register(type:String, typeCls:Class):TemplateData {
			var templateData:TemplateData = new TemplateData();
			templateData.init(type, typeCls);
			templateDepot[type] = templateData;
			return templateData;
		}
		
		public static function getType(type:String):TemplateData {
			return templateDepot[type] as TemplateData;
		}
		
		public static function hasData(type:String):Boolean
		{
			return getType(type) != null;
		}
		
		public static function get(templateId:Number, type:String):Template
		{
			var templateData:TemplateData = templateDepot[type];
			if (templateData == null) return null;
			
			if (templateData.cache[templateId] == null) {
				var templateIndex:int = TemplateUtil.search(templateId, templateData.list);
				if (templateIndex == -1) {
					trace(type+' 表里没有 '+templateId);
					return null;
				}
				var template:Template = Template(new templateData.typeClass());
				template.init(templateData.list[templateIndex]);
				templateData.cache[templateId] = template;
			}
			return templateData.cache[templateId];
		}
		
		/**
		 * 是否存在下一条模板
		 * @param continuous 设为true表示查询的下一条模板的唯一ID必须连续，设为false则代表不必连续
		 * @return 返回是否存在下一条模板
		 * 
		 */
//		public function hasNext(continuous:Boolean = false):Boolean {
//			return _index < _typeData.numTemplates - 1 && (!continuous ||
//				getTemplateData(_index+1)[0] == templateId + 1);
//		}
		
		/**
		 * 是否存在上一条模板
		 * @param continuous 设为true表示查询的上一条模板的唯一ID必须连续，设为false则代表不必连续
		 * @return 返回是否存在上一条模板
		 * 
		 */
//		public function hasPrev(continuous:Boolean = false):Boolean {
//			return _index > 0 && (!continuous ||
//				getTemplateData(_index-1)[0] == templateId - 1);
//		}
		
		
		/**
		 * @param type 模板表的名字
		 * @return 返回摸板表里所有的模板数组
		 */
		public static function getAll(type:String):Array {
			var templateType:TemplateData = templateDepot[type];
			return templateType != null ? templateType.list : [];
		}
		
		protected static function toNumberArray(str:String):Array {
			if (str == null || str == '') return [];
			var leftIdx:int = str.indexOf("[");
			var rightIdx:int = str.indexOf("]");
			if(leftIdx >= 0 && rightIdx > 0){
				str = str.substr(leftIdx+1, rightIdx - leftIdx - 1);
			}
			var array:Array = str.split(',');
			var i:int = array.length;
			while (--i > -1) array[i] = Number(array[i]);
			return array;
		}
		
		//---------------------
		// 以下为Template的成员方法及变量
		
		protected var _data:Object;
		
		private function init(data:Object):void {
			this._data = data;
		}
		
		/**	每条模板数据的唯一ID 		 */
		public function get templateId():Number {
			return Number(_data.templateId);
		}

		
	}
}