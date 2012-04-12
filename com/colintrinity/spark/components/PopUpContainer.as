package com.colintrinity.spark.components
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.core.IChildList;
	import mx.core.IVisualElement;
	import mx.core.UIComponent;
	
	import spark.components.Group;
	
	public class PopUpContainer extends Group
	{
		public function PopUpContainer()
		{
			super();
		}
		
		override public function addChild(child:DisplayObject):DisplayObject
		{
			if(child is IVisualElement) {
				return super.addElement(child as IVisualElement) as DisplayObject;
			} else {
				throw(new Error(resourceManager.getString("components", "addChildError")));
			}
			return null;
		}
		
		private function mouseClickHandler(e:MouseEvent):void {
			var child:IVisualElement = e.currentTarget as IVisualElement;
			try {
				var i:int = getElementIndex(child);
				if(i!=-1) {
					addElement(child);
					child.addEventListener(MouseEvent.CLICK, mouseClickHandler);
				}
			} catch(e:Error) {
				
			}
		}
		
		/**
		 *  @private
		 */
		override public function addChildAt(child:DisplayObject, index:int):DisplayObject
		{
			if(child is IVisualElement) {
				return super.addElementAt(child as IVisualElement,index) as DisplayObject;
			} else {
				throw(new Error(resourceManager.getString("components", "addChildAtError")));
			}
			return null;
		}
		
		/**
		 *  @private
		 */
		override public function removeChild(child:DisplayObject):DisplayObject
		{
			if(child is IVisualElement) {
				return super.removeElement(child as IVisualElement) as DisplayObject;
			} else {
				throw(new Error(resourceManager.getString("components", "removeChildError")));
			}
			return null;
		}
		
		/**
		 *  @private
		 */
		override public function removeChildAt(index:int):DisplayObject
		{
			return super.removeElementAt(index) as DisplayObject;
		}
		
		/**
		 *  @private
		 */
		override public function setChildIndex(child:DisplayObject, index:int):void
		{
			if(child is IVisualElement) {
				super.setElementIndex(child as IVisualElement, index);
			} else {
				throw(new Error(resourceManager.getString("components", "setChildIndexError")));
			}
		}
		
		/**
		 *  @private
		 */
		override public function swapChildren(child1:DisplayObject, child2:DisplayObject):void
		{
			if(child1 is IVisualElement && child2 is IVisualElement) {
				super.swapElements(child1 as IVisualElement, child2 as IVisualElement);
			} else {
				throw(new Error(resourceManager.getString("components", "swapChildrenError")));
			}
		}
		
		/**
		 *  @private
		 */
		override public function swapChildrenAt(index1:int, index2:int):void
		{
			super.swapChildrenAt(index1,index2);
		}
		
		override public function addElement(element:IVisualElement):IVisualElement
		{
			element.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			return super.addElement(element);
		}
		
		override public function removeElement(element:IVisualElement):IVisualElement
		{
			element.removeEventListener(MouseEvent.CLICK, mouseClickHandler);
			return super.removeElement(element);
		}
		
		
	}
}