package editor.evt
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	/**
	 * 事件转发用
	 * @author weishaoming
	 */	
	public class EvtMgr extends EventDispatcher
	{
		private static var _instance:EvtMgr;
		
		public function EvtMgr(target:IEventDispatcher=null)
		{
			super(target);
		}

		public static function get instance():EvtMgr
		{
			return _instance ||= new EvtMgr();
		}

	}
}