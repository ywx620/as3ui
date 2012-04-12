package com.colintrinity.spark.event
{
	import flash.events.Event;
	
	public class PaginateEvent extends Event
	{
		public static const HOME:String = "/event/paginateEvent#HOME";
		public static const PREVIOUS:String = "/event/paginateEvent#PREVIOUS";
		public static const NEXT:String = "/event/paginateEvent#NEXT";
		public static const END:String = "/event/paginateEvent#END";
		public static const CHANGE:String = "/event/paginateEvent#CHANGE";
		
		public function PaginateEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var oldPage:uint;
		public var newPage:uint;
	}
}