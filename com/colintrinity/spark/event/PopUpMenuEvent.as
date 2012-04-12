package com.colintrinity.spark.event
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	public class PopUpMenuEvent extends Event
	{
		public static const ITEM_CLICK:String = 'itemClick';
		public static const MENU_CLOSED:String = 'menuClosed';
		public static const MENU_OPEN:String = 'menuOpen';
		
		public function PopUpMenuEvent(type:String, data:Object = null, host:DisplayObject = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.data = data;
			this.host = host;
		}
		
		override public function clone():Event {
			return new PopUpMenuEvent(type,data,host,bubbles,cancelable);
		}	
		
		public var data:Object;
		public var host:DisplayObject;
		
	}
}