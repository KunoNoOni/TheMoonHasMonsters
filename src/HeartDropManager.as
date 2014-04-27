package  
{
	import flash.utils.getTimer;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class HeartDropManager extends FlxGroup
	{
	
		public function HeartDropManager() 
		{
			super();
			
			for (var i:int = 0; i < 250; i++)
			{
				add(new HeartDrop);
			}
		}
		
		public function release(x:int, y:int):void
		{
			var hDrop:HeartDrop = HeartDrop(getFirstAvailable());
			if (hDrop)
			{
				hDrop.drop(x,y);
			}
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}