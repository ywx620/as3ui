package com.colintrinity.spark.chat
{
	import flashx.textLayout.elements.IFormatResolver;

	public class XChatLine extends ChatLine
	{
		override protected function get xml():XML
		{
			if(body) {
				return <p styleName='chatXStyle'>【<a>*GM*</a>】【{source}】说:<span>{body}</span></p>;
			} else {
				return <p></p>
			}
		}
	}
}