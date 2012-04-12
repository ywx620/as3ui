package com.colintrinity.spark.components
{
	import com.lftcn.shhsl.skins.etc.StarRatingBarSkin;
	
	import flash.display.DisplayObject;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.DataGroup;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class RatingBar extends SkinnableComponent
	{
		public function RatingBar()
		{
			super();
			setStyle("skinClass", StarRatingBarSkin);
		}
		
		/**
		 *  @private
		 */
		private static const RATING_MAX_PROPERTY_FLAG:uint = 1 << 0;
		private static const RATING_PROPERTY_FLAG:uint = 1 << 1;
		
		/**
		 *  @private
		 */
		[SkinPart(required="true")]
		public var markLayer:DisplayObject;
		
		/**
		 *  @private
		 */
		[SkinPart(required="true")]
		public var rating1Group:DataGroup;
		
		/**
		 *  @private
		 */
		[SkinPart(required="true")]
		public var rating2Group:DataGroup;
		
		private var properties:Object = {};
		/**
		 * 最大评级数
		 * 
		 */ 
		public function get maxRating():uint
		{
			if(rating1Group&&rating2Group) {
				return rating1Group.dataProvider.length;
			}
			var v:* = properties.data;
			return (v === undefined) ? 5 : v;
		}
		
		/**
		 * 最大评级数
		 * 
		 */ 
		public function set maxRating(value:uint):void
		{	
			if (rating1Group&&rating2Group)
			{
				rating1Group.dataProvider = new ArrayCollection(new Array(value));
				rating2Group.dataProvider = new ArrayCollection(new Array(value));
			}
			else
			{
				properties.data = value;
			}
			
			// Generate an UPDATE_COMPLETE event.
			invalidateProperties(); 
		}
		
		/**
		 * 评级数
		 * 
		 */ 
		public function get rating():Number
		{
			if(markLayer) {
				return uint(markLayer.width / 14);
			}
			var v:* = properties.rating;
			return (v === undefined) ? 0 : v;
		}
		
		/**
		 * 评级数
		 * 
		 */ 
		public function set rating(value:Number):void {
			if (markLayer)
			{
				markLayer.width = 14 * (value>maxRating?maxRating:value);
			}
			else
			{
				properties.rating = 14 * (value>maxRating?maxRating:value);
			}
			// Generate an UPDATE_COMPLETE event.
			invalidateProperties(); 
		}
		
		override protected function partAdded(partName:String, instance:Object):void {
			
			if(instance == markLayer) {
				markLayer.width = properties.rating;
			}
			if(instance == rating1Group) {
				var arr1:Array;
				if (properties && properties.data) {
					arr1 = new Array(uint(properties.data));
				} else {
					arr1 = [1,2,3,4,5];
				}
				rating1Group.dataProvider = new ArrayCollection(arr1);
			}
			
			if(instance == rating2Group) {
				var arr2:Array;
				if (properties && properties.data) {
					arr2 = new Array(uint(properties.data));
				} else {
					arr2 = [1,2,3,4,5];
				}
				rating2Group.dataProvider = new ArrayCollection(arr2);
			}
			super.partAdded(partName,instance);
		}
	}
}