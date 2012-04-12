package com.colintrinity.spark.event
{
	import flash.events.Event;
	import flash.geom.Point;
	
	public class MinimapEvent extends Event
	{
		public static const RUN_TO:String = "minimapEvent/runto";
		public function MinimapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var p:Point;
		
		override public function clone():Event
		{
			return new MinimapEvent(type, bubbles, cancelable);
		}
	}
}