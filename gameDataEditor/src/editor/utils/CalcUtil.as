package editor.utils
{
	public class CalcUtil
	{
		public function CalcUtil()
		{
		}
		
		/**
		 * 计算文本算式
		 */
		public static function calculateString(str:String=""):Number {
			if (str=="") {
				return NaN;
			}
			
			return calculateFun(str);
		}
		
		//检测括号
		private static function calculateFun(str:String):Number{
			var index:Number = str.lastIndexOf("(");
			
			if(index==-1){
				return calculateAdd(str);
			}
			
			var new_str:String = str.substr(index+1);
			var end_index:Number = new_str.indexOf(")");
			var child_str:String = new_str.substr(0,end_index);
			str = str.substr(0,index)+calculateFun(child_str)+new_str.substr(end_index+1);
			return calculateFun(str);
		}
		
		//计算加法
		private static function calculateAdd(str:String):Number{
			var add_arr:Array = str.split("+");
			
			var len:Number = add_arr.length;
			var result:Number = 0;
			
			for(var i:Number=0;i<len;i++){
				if(!Number(add_arr[i]) && Number(add_arr[i])!=0){
					add_arr[i] = calculateDes(String(add_arr[i]));
				}
				
				if(i==0){
					result = Number(add_arr[i]);
				}else{
					result += Number(add_arr[i]);
				}
			}
			
			return result;
		}
		
		//计算减法
		private static function calculateDes(str:String):Number{
			var des_arr:Array = str.split("-");
			var d_len:Number = des_arr.length;
			var result:Number = 0;
			for(var i:Number=0;i<d_len;i++){
				if(!Number(des_arr[i]) && Number(des_arr[i])!=0){
					des_arr[i] = calculateMul(String(des_arr[i]));
				}
				
				if(i==0){
					result = Number(des_arr[i]);
				}else{
					result -= Number(des_arr[i]);
				}
			}
			
			return result;
		}
		
		//计算乘法
		private static function calculateMul(str:String):Number{
			var mul_arr:Array = str.split("*");
			var m_len:Number = mul_arr.length;
			var result:Number = 0;
			for(var i:Number=0;i<m_len;i++){
				if(!Number(mul_arr[i]) && Number(mul_arr[i])!=0){
					mul_arr[i] = calculateExc(String(mul_arr[i]));
				}
				if(i==0){
					result = Number(mul_arr[i]);
				}else{
					result *= Number(mul_arr[i]);
				}
			}
			
			return result;
		}
		
		//计算除法
		private static function calculateExc(str:String):Number{
			var exc_arr:Array = str.split("/");
			var result:Number = Number(exc_arr[0]);
			var e_len:Number = exc_arr.length;
			
			for(var i:Number=1;i<e_len;i++){
				result=result/Number(exc_arr[i]);
			}
			
			return result;
		}
	}
}