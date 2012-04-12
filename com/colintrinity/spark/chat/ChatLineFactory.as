package com.colintrinity.spark.chat
{
	import com.colintrinity.spark.text.CSSFormatResolver;
	
	import flashx.textLayout.elements.IFormatResolver;
	
	import mx.styles.IStyleManager2;

	public class ChatLineFactory
	{
		public function ChatLineFactory()
		{
		}
		
		public static function  getChatLineByType(type:String):ChatLine {
			switch(type) {
				case 'w':
					return new WhisperChatLine();
					break;
				case 'u':
					return new WorldChatLine();
					break;
				case 'g':
					return new GuildChatLine();
					break;
				case 'x':
					return new XChatLine();
					break;
				case 'style':
					return new StyleChatLine();
				case 's':
				default:
					return new LocalChatLine();
					break;
			}
		}
	}
}