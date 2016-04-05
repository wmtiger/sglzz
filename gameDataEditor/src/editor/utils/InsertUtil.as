package editor.utils 
{
	import cfg.AppCfg;
	
	import editor.normal.AddCellWnd;
	
	import mx.managers.PopUpManager;

	/**
	 * 插入的方法，里面包含了插入一个新数据的方法
	 * @author weism
	 */
	public class InsertUtil 
	{
		private static var _addCellWnd:AddCellWnd;// 增加项界面
		
		public function InsertUtil() 
		{
			
		}
		/**
		 * 插入新数据
		 * @param type
		 */		
		public static function addCell(type:String):void
		{
			if(_addCellWnd == null){
				_addCellWnd = new AddCellWnd();
			}
			_addCellWnd.type = type;
			PopUpManager.addPopUp(_addCellWnd, AppCfg.getTopLevel(), true);
		}
		
	}

}