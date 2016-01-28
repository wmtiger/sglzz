package cfg
{
	import flash.display.Stage;
	
	import mx.core.FlexGlobals;

	public class AppCfg
	{
		public function AppCfg()
		{
		}
		
		public static function getStage():Stage{
			return FlexGlobals.topLevelApplication.stage;
		}
	}
}