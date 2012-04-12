package com.colintrinity.spark.chat
{
	import flashx.textLayout.elements.IFormatResolver;

	public class GuildChatLine extends ChatLine
	{
		override protected function get xml():XML
		{
			if(body) {
				return <p styleName='chatGStyle'>【<a>工会</a>】【{source}】说:<span>{body}</span></p>;
			} else {
				return <p styleName='chatGStyle'>格式错误</p>
			}
		}
	}
}