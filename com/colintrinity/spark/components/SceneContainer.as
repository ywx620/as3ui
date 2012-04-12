package com.colintrinity.spark.components
{
	import flash.display.DisplayObject;
	
	import mx.core.mx_internal;
	
	import spark.components.Group;

	public class SceneContainer extends Group
	{
		public function SceneContainer()
		{
		}
		
		public function addViewPort(value:DisplayObject):void {
			super.mx_internal::$addChild(value);
		}
	}
}