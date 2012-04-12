package com.colintrinity.spark.manager
{
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.events.IEventDispatcher;
	import flash.geom.Rectangle;

	public interface Movable extends IEventDispatcher
	{
		function get moveHandle():InteractiveObject;
		function startDrag(lockCenter:Boolean=false, bounds:Rectangle=null):void;
		function stopDrag():void;
		function get parent():DisplayObjectContainer;
		function get width():Number;
		function get height():Number;
	}
}