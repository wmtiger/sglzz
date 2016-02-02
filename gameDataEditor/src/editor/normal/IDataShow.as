package editor.normal
{
	public interface IDataShow
	{
		
		/**
		 * 通过一个文件读出来的数据, 显示信息面板
		 * @param obj
		 */		
		function set editObj(obj:Object):void;
		
		function clear():void;
		
	}
}