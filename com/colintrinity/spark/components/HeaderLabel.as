package com.colintrinity.spark.components
{
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class HeaderLabel extends SkinnableComponent
	{
		[SkinPart]
		public var labelDisplay:Label;
		
		private var _text:String;
		
		public function HeaderLabel()
		{
			super();
		}
		
		public function get text():String 
		{
			if(labelDisplay) {
				return labelDisplay.text;
			} else {
				return _text;
			}
		}
		
		/**
		 *  @private
		 */
		public function set text(value:String):void
		{
			if (labelDisplay)
			{
				labelDisplay.text = value;
			} else {
				_text = value;
			}
		}
		
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName,instance);
			
			if(instance == labelDisplay && _text) {
				labelDisplay.text = _text;
			}
		}
	}
}