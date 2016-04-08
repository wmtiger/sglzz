package com.gamedata.template.base
{
	import com.gamedata.utils.CSVUtil;
	import com.gamedata.utils.TemplateReader;
	import com.gamedata.utils.TemplateWriter;
	
	import flash.filesystem.File;
	import flash.utils.Dictionary;

	public class TemplateData
	{
		/** 模板名、表名、文件名、类型名，四名合一 */
		public var typeName:String;
		
		/** 模板类 */
		public var typeClass:Class;
		
		/** 模板实例 */
		public var list:Array = [];
		
		public var cache:Dictionary = new Dictionary();
		
		public var numTemplates:int;
		
		public function TemplateData()
		{
		}
		
		public function init(type:String, typeCls:Class):void
		{
			typeName = type;
			typeClass = typeCls;
			
			create();
		}
		
		public function create():void
		{
			if(Template.templateRootFile){
				var db:File = Template.templateRootFile.resolvePath(typeName + Template.suffix);
				if(Template.SUFFIX_TYPE_CSV == Template.suffix){
					list = CSVUtil.parseCsvToList(TemplateReader.readUtfStr(db));
				}else if(Template.SUFFIX_TYPE_BIN == Template.suffix){
					// todo
				}
				numTemplates = list.length;
			}
		}
		
		public function saveToFile():void
		{
			if(Template.templateRootFile){
				var db:File = Template.templateRootFile.resolvePath(typeName + Template.suffix);
				if(Template.SUFFIX_TYPE_CSV == Template.suffix){
					TemplateWriter.writeToCsv(db,CSVUtil.parseObjListToCsv(list, typeClass["CSV_HEAD"]));
				}else if(Template.SUFFIX_TYPE_BIN == Template.suffix){
					// todo
				}
			}
		}
	}
}