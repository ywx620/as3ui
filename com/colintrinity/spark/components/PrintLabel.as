package com.colintrinity.spark.components
{
	import spark.components.Label;
	
	/**
	 * 
	 * @author colin
	 * 
	 */	
	public class PrintLabel extends Label
	{
		private var _param:String;
		private var _template:String = "{0}";
		
		public function PrintLabel()
		{
			super();
		}
		
		public function get param():String
		{
			return _param;
		}

		[Bindable]
		public function set param(value:String):void
		{
			_param = value;
			invalidateProperties();
		}

		public function get template():String
		{
			return _template;
		}

		[Bindable]
		public function set template(value:String):void
		{
			_template = value;
			invalidateProperties();
		}

		private static function subsititute(str:String, rest:Array):String
		{
			if(!str)
			{
				return "";
			}
			
			var len:uint = rest.length;
			var args:Array;
			
			if(len == 1 && rest[0] is Array)
			{
				args = rest[0] as Array;
				len = args.length;
			}
			else
			{
				args = rest;
			}
			
			for(var i:uint = 0; i < len; i++)
			{
				str = str.replace(new RegExp("\\$\\[" + i + "\\]", 'g'), args[i]);
			}
			return str;
		}
		
		
		override protected function commitProperties():void {
			super.commitProperties();
			if(param) {
				text = subsititute(template,param.split(","));
			}
		}
	}
}