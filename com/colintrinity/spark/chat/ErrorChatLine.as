package com.colintrinity.spark.chat
{
	import flashx.textLayout.elements.IFormatResolver;

	public class ErrorChatLine extends ChatLine
	{
		override protected function get xml():XML
		{
			if(body) {
				return <p styleName='chatErrorStyle'>【<a>错误</a>】<span>{body}</span></p>;
			} else {
				return <p></p>
			}
		}
	}
}