package com.colintrinity.spark.chat
{
	import flash.events.Event;
	
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	import spark.utils.TextFlowUtil;

	/**
	 * 
	 * 這個是ChatLine的基類，實現了最默認的行為
	 *  
	 * @author Colin
	 * 
	 */	
	public class ChatLine
	{
		private var _head:String;
		private var _body:String;
		private var _source:String;
		
		public function ChatLine()
		{
		}
		
		public function get source():String
		{
			return _source;
		}

		public function set source(value:String):void
		{
			_source = value;
		}

		public function set head(value:String):void
		{
			_head = value;
		}

		public function get head():String {
			return _head;
		}
		
		
		public function get body():String
		{
			return _body;
		}

		public function set body(value:String):void
		{
			_body = value;
		}

		protected function get xml():XML
		{
			if(body) {
				return <p>[<a>{head}</a>]:<span>{body}</span></p>;
			} else {
				return <p></p>
			}
		}

		public function get textFlow():TextFlow {
			var textFlow:TextFlow = TextFlowUtil.importFromXML(xml);
			return textFlow;
		}
	}
}