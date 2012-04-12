package com.colintrinity.spark.event
{
	import com.colintrinity.spark.chat.ChatLine;
	
	import flash.events.Event;
	
	public class ChatUIEvent extends Event
	{
		
		public static const TEXT_SUBMIT:String = 'textSubmit';
		public static const TEXT_ADD:String = 'textAdd';
		
		public function ChatUIEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public var message:ChatLine;
	}
}