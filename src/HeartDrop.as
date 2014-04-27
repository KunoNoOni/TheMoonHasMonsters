package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class HeartDrop extends FlxSprite
	{
		public var heartTimer:FlxDelay;
		
		public function HeartDrop()
		{
			super();
			loadGraphic(Registry.heart,false,false,8,8);
			exists = false;
			heartTimer = new FlxDelay(3000);
		}
		
		public function drop(x:int, y:int):void
		{
			this.x = x;
			this.y = y-5;
			acceleration.y = 500
			exists = true;
			heartTimer.start();
		}

		
		override public function update():void
		{	
			if(heartTimer.hasExpired)
			{
				if(exists)
					this.kill();
			}
			super.update();
		}
	}
}