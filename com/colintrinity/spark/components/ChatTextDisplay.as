/**
 * 
 * 
 * 反正這個是聊天部分那個顯示的地方的那個組件
 * 
 * RichEditableText 這貨用了TLF，所以繼承這個類的本類也是非常複雜的。。。
 * 
 * 然後下面是修改的日誌
 * 
 * @log 2011-02-17 22:49 添加addChatLine的方法
 *  
 */
package com.colintrinity.spark.components
{
	import com.colintrinity.spark.chat.ChatLine;
	import com.colintrinity.spark.text.CSSFormatResolver;
	import com.lftcn.shhsl.event.ChatLineFunctionEvent;
	
	import flashx.textLayout.elements.FlowElement;
	import flashx.textLayout.elements.LinkElement;
	import flashx.textLayout.elements.TextFlow;
	import flashx.textLayout.events.FlowElementMouseEvent;
	
	import spark.components.RichEditableText;
	
	[Event(name="chatMenuPopUp", type="com.lftcn.shhsl.event.ChatLineFunctionEvent")]
	/**
	 * 
	 * 反正這個是聊天部分那個顯示的地方的那個組件
	 * 
	 * @author Colin
	 * 
	 */	
	public class ChatTextDisplay extends RichEditableText
	{
		public function ChatTextDisplay()
		{
			super();
		}
		
		private var _maxLine:uint = 200;
		
		public function get maxLine():uint
		{
			return _maxLine;
		}

		public function set maxLine(value:uint):void
		{
			_maxLine = value;
		}

		/**
		 * 也就該了下默認時候本RichEditableText是不能編輯的
		 * 而且默認新建了個空的TextFlow給他
		 * 
		 */		
		override protected function createChildren():void {
			super.createChildren();
			editable = false;
		    selectable = false;
			textFlow = new TextFlow();
			textFlow.addEventListener(FlowElementMouseEvent.CLICK, clickHandler);
			textFlow.linkActiveFormat = {color:0xece3b1, textDecoration: "none"};
			textFlow.linkHoverFormat = {color:0xece3b1, textDecoration: "underline"};
			textFlow.linkNormalFormat = {color:0xece3b1, textDecoration: "none"};
		}
		
		/**
		 *
		 * 添加一個ChatLine對象到當前文本流裏面
		 * 
		 * 其實也不是，嚴格的說，是把ChatLine的textFlow中的文本流添加到當前文本流裏面
		 *  
		 * @param value
		 * 
		 */		
		public function addChatLine(value:ChatLine):void {
			var incomingFlow:TextFlow = value.textFlow;
			
			for (var i:int = 0; i < textFlow.numChildren; i++ ) {
				var element:FlowElement = incomingFlow.getChildAt(i);
				if(element) {
					if(textFlow.numChildren > 200) {
						textFlow.removeChildAt(0);
					}
					textFlow.addChild(element);
				}
			}
			
			textFlow.formatResolver = new CSSFormatResolver(styleManager);
			textFlow.invalidateAllFormats();
		}
		
		private function clickHandler(e:FlowElementMouseEvent):void {
			if( e.flowElement is LinkElement ) {
				var type:String = LinkElement(e.flowElement).href;
				switch(type) {
					case 'event:targetName':
						var eventObj:ChatLineFunctionEvent = new ChatLineFunctionEvent(ChatLineFunctionEvent.POPUP_MENU,{name:LinkElement(e.flowElement).getText(),x:e.originalEvent.stageX,y:e.originalEvent.stageY});
						this.dispatchEvent(eventObj);
						break;
				}
			}
		}
	}
}