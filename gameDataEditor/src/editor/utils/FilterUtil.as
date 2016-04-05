package editor.utils
{
	public class FilterUtil
	{
		public function FilterUtil()
		{
		}
		
		/**
		 * 获取过滤后的数组
		 */
		public static function getFilterArr(needFilterArr:Array, searchStr:String):Array
		{
			var tempArr:Array = [];
			var len:int = needFilterArr.length;
			var i:int = 0;
			var obj:Object;
			if(int(searchStr) > 0){
				// 输入的是数字
				for(i = 0; i < len; i++){
					obj = needFilterArr[i];
					if(String(obj.templateId).indexOf(searchStr) >= 0){
						tempArr.push(obj);
					}
				}
			}else{
				// 输入的是其他文字
				for(i = 0; i < len; i++){
					obj = needFilterArr[i];
					if(String(obj.name).indexOf(searchStr) >= 0){
						tempArr.push(obj);
					}
				}
			}
			return tempArr;
		}
	}
}