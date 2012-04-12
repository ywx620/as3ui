package com.colintrinity.spark.components
{
	import de.polygonal.ds.HashMap;
	import de.polygonal.ds.Itr;
	import de.polygonal.ds.Map;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	
	import mx.core.mx_internal;
	
	import spark.components.Group;

	public class OverlayContanier extends Group
	{
		private var _focuses:Vector.<DisplayObject>;
		private var _focusRects:Map = new HashMap();
		
		[Embed(source="assets/embed/swf/guide-arrow.swf")]
		private var _focusArrowClass:Class;
		
		[Embed(source="assets/embed/swf/guide-arrow-glow.swf")]
		private var _focusGlowClass:Class;
		
		public function OverlayContanier()
		{
			mouseEnabledWhereTransparent = true;
		}
		
		public function get focusGlowClass():Class
		{
			return _focusGlowClass;
		}
		
		public function set focusGlowClass(value:Class):void
		{
			_focusGlowClass = value;
		}
		
		public function get focusArrowClass():Class
		{
			return _focusArrowClass;
		}
		
		public function set focusArrowClass(value:Class):void
		{
			_focusArrowClass = value;
		}
		
		public function clearFocuses():void {
			
		}
		
		public function addFocus(value:DisplayObject):void {
			_focusRects.clear();
			var rect:Rectangle = value.getBounds(this);
			_focusRects.set(value,rect);
			invalidateDisplayList();
		}
		
		public function removeFocus(value:DisplayObject):void {
			_focusRects.remove(value);
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			while(numChildren) {
				mx_internal::$removeChildAt(0);
			}
			
			var middleX:Number = width / 2;
			var middleY:Number = height / 2;
			
			var itr:Itr = _focusRects.keys();
			
			while(itr.hasNext()) {
				var target:DisplayObject = itr.next() as DisplayObject;
				var rect:Rectangle = _focusRects.get(target) as Rectangle;
				var rectMiddleX:Number = rect.width / 2 + rect.x;
				var rectMiddleY:Number = rect.height / 2 + rect.y;
				
				if(focusArrowClass) {
					var arrow:MovieClip = new focusArrowClass();
					var seta:Number = Math.atan2((rectMiddleY - middleY) , (rectMiddleX - middleX));
					arrow.rotation = seta *  180 / Math.PI;
					arrow.x = rectMiddleX - Math.cos(seta) * 50;
					arrow.y = rectMiddleY - Math.sin(seta) * 50;
					mx_internal::$addChild(arrow);
				}
				
				if(focusGlowClass) {
					var glow:MovieClip = new focusGlowClass();
					glow.x = rectMiddleX;
					glow.y = rectMiddleY;
					mx_internal::$addChild(glow);
				}
			}
			
			
		}
	}
}