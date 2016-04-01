package editor.utils
{
	public class CSVUtil
	{
		public static const COL_SPAN_STR:String = "|||";
		public static const ROW_SPAN_STR:String = "\n";
		public static const NULL_PLACE_HOLDER:String = "-";
		
		public function CSVUtil()
		{
		}
		
		/**
		 * 将obj的列表，解析成csv数据文件
		 * @param	list
		 * @param	titleArr
		 * @return
		 */
		public static function parseObjListToCsv(list:Array, titleArr:Array):String 
		{
			var len:int = list.length;
			
			var csv:String = titleArr.join(COL_SPAN_STR);
			
			csv += ROW_SPAN_STR;
			
			for (var i:int = 0; i < len; i++) 
			{
				var obj:Object = list[i];
				csv += parseObjToCsvStr(obj, titleArr);
				var span:String = ROW_SPAN_STR;
				if (i + 1 >= len) 
				{
					span = "";
				}
				csv += span;
			}
			return csv;
		}
		
		public static function parseObjToCsvStr(obj:Object, titleArr:Array):String
		{
			var len:int = titleArr.length;
			var str:String = "";
			for (var i:int = 0; i < len; i++) 
			{
				var title:String = titleArr[i];
				var span:String = COL_SPAN_STR;
				if (i + 1 >= len) 
				{
					span = "";
				}
				var value:String = obj[title];
				if (value == null) 
				{
					value = NULL_PLACE_HOLDER;
				}
				str += (value + span);
			}
			return str;
		}
		
		/**
		 * 将csv文件解析成obj的列表
		 * @param	csv
		 * @return
		 */
		public static function parseCsvToList(csv:String):Array
		{
			if(!csv){
				return [];
			}
			var csvList:Array = csv.split(ROW_SPAN_STR);
			var objList:Array = [];
			var titleList:Array = [];
			if (csvList.length > 0) 
			{
				titleList = parseCsvRowToList(csvList.shift());
			}
			var len:int = csvList.length;
			var titleLen:int = titleList.length;
			for (var i:int = 0; i < len; i++) 
			{
				var arr:Array = parseCsvRowToList(csvList[i]);
				if(arr.length > 0){
					var obj:Object = { };
					for (var j:int = 0; j < titleLen; j++) 
					{
						if(arr[j] == NULL_PLACE_HOLDER){
							obj[titleList[j]] = "";
						}else{
							obj[titleList[j]] = arr[j];
						}
					}
					objList[i] = obj;
				}
			}
			return objList;
		}
		
		public static function parseCsvRowToList(csvRow:String):Array
		{
			var list:Array = [];
			if(csvRow){
				list = csvRow.split(COL_SPAN_STR);
			}
			return list;
		}
		
	}
}