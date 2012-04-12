package com.colintrinity.spark.components
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.IList;
	
	public interface IPopUpMenuSupport extends IEventDispatcher
	{
		function get menuData():IList;
		function set menuData(value:IList):void;
	}
}