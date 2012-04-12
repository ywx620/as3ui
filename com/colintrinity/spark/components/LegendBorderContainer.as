package com.colintrinity.spark.components
{
	import spark.components.BorderContainer;
	import spark.components.supportClasses.TextBase;
	
	public class LegendBorderContainer extends BorderContainer
	{
		
		[SkinPart(required="false")]
		public var legendDisplay:TextBase;
		
		private var _legend:String;
		
		private var _showCloseButton:Boolean = false;
		
		public function LegendBorderContainer()
		{
			super();
		}
		
		public function get showCloseButton():Boolean
		{
			return _showCloseButton;
		}

		public function set showCloseButton(value:Boolean):void
		{
			_showCloseButton = value;
		}

		[Inspectable(category="General")]
		public function get legend():String
		{
			return _legend;
		}
		
		[Bindable("change")]
		[Bindable("textChanged")]
		
		// Compiler will strip leading and trailing whitespace from text string.
		[CollapseWhiteSpace]
		public function set legend(value:String):void
		{
			_legend = value;
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			super.partAdded(partName, instance);
			
			if (instance == legendDisplay)
			{
				legendDisplay.text = legend;
			}
		}
		
	}
}