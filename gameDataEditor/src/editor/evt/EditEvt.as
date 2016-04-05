package editor.evt
{
	import flash.events.Event;
	
	public class EditEvt extends Event
	{
		// 所有的ADD开头的事件，为增加模板事件
		public static const ADD_ONE_ITEM:String = "ADD_ONE_ITEM";// 增加一个物品的数据模板
		public static const ADD_ONE_HERO:String = "ADD_ONE_HERO";// 增加一个武将的数据模板
		public static const ADD_ONE_SKILL:String = "ADD_ONE_SKILL";// 增加一个技能的数据模板
		public static const ADD_ONE_HERO_SOUL:String = "ADD_ONE_HERO_SOUL";// 增加一个将魂的数据模板
		
		// 所有的INSERT开头的事件，为某个模板中的插入事件
		public static const INSERT_HERO_SKILL:String = "INSERT_HERO_SKILL";// 在武将中插入其技能
		
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