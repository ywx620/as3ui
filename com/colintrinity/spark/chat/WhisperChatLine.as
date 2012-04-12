package com.colintrinity.spark.chat
{
	import flashx.textLayout.elements.IFormatResolver;

	public class WhisperChatLine extends ChatLine
	{
		private var _target:String;
		private var _content:String;

		public function get content():String
		{
			return _content;
		}

		public function set content(value:String):void
		{
			_content = value;
		}

		public function get target():String
		{
			return _target;
		}

		public function set target(value:String):void
		{
			_target = value;
		}
		
		override public function set body(value:String):void {
			if(value) {
				_target = value.split(" ")[0];
				_content = value.replace(_target,'');
			}
		}

		override protected function get xml():XML
		{
			if(content) {
				if(target) {
					return <p styleName='chatWStyle'>【<a>私聊</a>】你悄悄的对【<a href='event:targetName' >{target}</a>】说:<span>{content}</span></p>;
				} else {
					return <p styleName='chatWStyle'>【<a>私聊</a>】【<a>{source}</a>】悄悄的对你说:<span>{content}</span></p>;
				}
			} else {
				return <p styleName='chatWStyle'>格式错误</p>
			}
		}
	}
}