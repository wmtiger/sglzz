package cfg
{
	import flash.desktop.NativeApplication;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import mx.core.FlexGlobals;
	
	public class AppCfg
	{
		public function AppCfg()
		{
		}
		
		/**
		 * 获取本app的顶层显示
		 */
		public static function getTopLevel():gameDataEditor
		{
			return FlexGlobals.topLevelApplication as gameDataEditor;
		}
		
		/**
		 * 获取本app的state
		 */
		public static function getStage():Stage
		{
			return FlexGlobals.topLevelApplication.stage;
		}
		
		/**
		 * 获取当前app的xml配置的version属性
		 */
		public static function get version():String {
			var appXML:XML = NativeApplication.nativeApplication.applicationDescriptor;
			var ns:Namespace = appXML.namespace();
			return appXML.ns::versionNumber;
		}
		
		/**
		 * 获取当前app的xml配置
		 */
		public static function appXml(node:String=null):String {
			var appXML:XML = NativeApplication.nativeApplication.applicationDescriptor;
			if (node == null) {
				return appXML;
			} else {
				var ns:Namespace = appXML.namespace();
				return appXML.ns::[node];
			}
		}
		
	}
}