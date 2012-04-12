package com.colintrinity.spark.chat
{
	import flashx.textLayout.elements.IFormatResolver;

	public class WorldChatLine extends ChatLine
	{
		override protected function get xml():XML
		{
			if(body) {
				return <p styleName='chatUStyle'>【<a>世界</a>】【{source}】说:<span>{body}</span></p>;
			} else {
				return <p styleName='chatUStyle'>格式错误</p>
			}
		}
	}
}