package editor.utils
{
	public class RepeatChkUtil
	{
		public function RepeatChkUtil()
		{
		}
		/**
		 * 判断是否在列表中的Tid和比较的Tid是有重复的，有则返回true，没有返回false
		 * @param tid
		 * @param arr
		 * @return 
		 */		
		public static function chkTidIsRepeatInArr(tid:String, arr:Array):Boolean
		{
			if(int(tid) <= 0){
				return false;
			}
			var len:int = arr.length;
			for(var i:int = 0; i < len; i++){
				var obj:Object = arr[i];
				if(obj.templateId + "" == tid){
					return true;
				}
			}
			return false;
		}
	}
}