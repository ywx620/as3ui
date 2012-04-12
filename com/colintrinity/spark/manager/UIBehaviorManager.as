package com.colintrinity.spark.manager
{
	import de.polygonal.ds.HashMap;
	import de.polygonal.ds.Map;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class UIBehaviorManager
	{
		private static var map:Map = new HashMap(false);;
		
		public function UIBehaviorManager()
		{ 
			
		}
		
		public static function proxy(target:*, params:Object):void {
			if(!map.hasKey(target)) {
				map.set(target,new HashMap(false));
			}
			var targetMap:Map = map.get(target) as Map;
			
			var proxy:BehaviorProxy;
			var config:ProxyConfig = new ProxyConfig();
			config.target = target;
			if(target is Movable) {
				config.type = "move";
				config.proxy = new MovableBehaviorProxy();
				config.proxy.proxy(target,params);
			}
			targetMap.set(config.type,config);
		}
		
		public static function unproxy(target:*):void {
			var config:ProxyConfig = new ProxyConfig();
			if(target is Movable) {
				config.type = "move";
			}
			var targetMap:Map = map.get(target) as Map;
			
			if(targetMap.hasKey(config.type)) {
				targetMap.clr(config.type);
				
				if(targetMap.size() == 0) {
					map.clr(target);
				}
			}
		}
	}
}