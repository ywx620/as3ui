package com.colintrinity.spark.manager
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.geom.Transform;

	public class MovableBehaviorProxy implements BehaviorProxy
	{
		private var _target:Movable;
		
		private var _parent:DisplayObjectContainer;
		
		private var r:Boolean = true;
		
		private function get parent():DisplayObjectContainer
		{
			return _target.parent;
		}

		public function get target():Movable 
		{
			return _target;
		}
		
		public function get moveHandle():InteractiveObject {
			return _target.moveHandle;
		}

		public function proxy(target:*, r:Boolean = true):void {
			_target = target;
			if(!parent) {
				throw new Error();
			}
			this.r = r;
			moveHandle.addEventListener(MouseEvent.MOUSE_DOWN,startMove);
		}
		
		private function startMove(e:MouseEvent):void {
			target.removeEventListener(MouseEvent.MOUSE_DOWN,startMove);
			if(r) {
				rect = new Rectangle(0,0,parent.width-target.width, parent.height-target.height);
			}
			moveHandle.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMove);
			moveHandle.parent.addEventListener(MouseEvent.MOUSE_UP,stopMove);
			lastX = e.stageX;
			lastY = e.stageY;
		}
		
		private var aX:Number;
		private var aY:Number;
		private var lastX:Number;
		private var lastY:Number;
		private var rect:Rectangle;
		
		private function onMove(e:MouseEvent):void {
			var newX:Number = e.stageX;
			var newY:Number = e.stageY;
			aX = newX - lastX;
			aY = newY - lastY;
			lastX = newX;
			lastY = newY;
			
			var targetX:Number = Sprite(target).x + aX;
			var targetY:Number = Sprite(target).y + aY;
			
			if(r && rect.width < 0) {
				rect.x = rect.width;
				rect.width = -rect.width;
			}
			
			if(r && rect.height < 0) {
				rect.y = rect.height;
				rect.height = -rect.height;
			}
			
			if(!r || rect.contains(targetX,targetY)) {
				Sprite(target).x = targetX;
				Sprite(target).y = targetY;
				e.updateAfterEvent();
			} else {
				if(rect.contains(Sprite(target).x,targetY)) {
					Sprite(target).y = targetY;
					e.updateAfterEvent();
				} else if(rect.contains(targetX,Sprite(target).y)) {
					Sprite(target).x = targetX;
					e.updateAfterEvent();
				}
				
				stopMove(e);
			}
		}
		
		private function stopMove(e:MouseEvent):void {
			moveHandle.parent.removeEventListener(MouseEvent.MOUSE_UP,stopMove);
			moveHandle.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMove);
			moveHandle.addEventListener(MouseEvent.MOUSE_DOWN,startMove);
			e.updateAfterEvent();
		}
	}
}