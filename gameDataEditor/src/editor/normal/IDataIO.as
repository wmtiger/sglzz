package editor.normal
{
	public interface IDataIO
	{
		/**
		 * 将当前的数据保存成一个文件
		 */		
		function saveToFile():void;
		/**
		 * 通过一个文件读出来的数据, 显示信息面板
		 * @param obj
		 */		
		function showByObj(obj:Object):void;
		
	}
}