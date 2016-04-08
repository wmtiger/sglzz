package com.gamedata.utils
{
	public class TemplateUtil
	{
		public function TemplateUtil()
		{
		}
		/**
		 * 从obj中获取对应的key的value值
		 * @param obj
		 * @param key
		 * @return 
		 */		
		public static function getDataByObjKey(obj:Object, key:String):String
		{
			return obj[key] ? obj[key] + "" : "";
		}
		
		/**
		 * 从模板列表中搜索对应的tid的idx
		 * 根据模板ID，使用对半查找法，查询模板数据索引。(查询路径仅为log2n,65536条记录最多遍历16次即找到)
		 * 所有数据是 Array.NUMERIC 排列的
		 * @param templateId
		 * @param arr
		 * @return 
		 */		
		public static function search(templateId:int, arr:Array):int {
			var left:int = 0;
			var right:int = arr.length - 1;
			while (left <= right) {
				var i:int = (right - left >> 1) + left;
				var dataTemplateId:int = int(arr[i].templateId);
				if (dataTemplateId == templateId) return i;
				dataTemplateId < templateId ? left = i + 1 : right = i - 1;
			}
			return -1;
		}
		
	}
}