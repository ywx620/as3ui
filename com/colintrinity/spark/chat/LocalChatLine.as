package com.colintrinity.spark.chat
{
	import flashx.textLayout.elements.IFormatResolver;

	public class LocalChatLine extends ChatLine
	{
		override protected function get xml():XML
		{
			if(body) {
				return <p styleName='chatSStyle'>【当前】【<a href='event:targetName'>{source}</a>】说:<span>{body}</span></p>;
			} else {
				return <p styleName='chatSStyle'>格式错误</p>
			}
		}
	}
}