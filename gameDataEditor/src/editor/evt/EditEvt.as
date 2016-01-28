package editor.evt
{
	import flash.events.Event;
	
	public class EditEvt extends Event
	{
		public static const ADD_ONE_ITEM:String = "ADD_ONE_ITEM";
		public static const ADD_ONE_HERO:String = "ADD_ONE_HERO";
		
		private var _data:Object;
		
		public function EditEvt(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_data = data;
			super(type, bubbles, cancelable);
		}
		
		public function get data():Object
		{
			return _data;
		}

		public function set data(value:Object):void
		{
			_data = value;
		}

		override public function clone():Event{
			var e:EditEvt = new EditEvt(this.type, this.data);  
			return e;
		}
	}
}