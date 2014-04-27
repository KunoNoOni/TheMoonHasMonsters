package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class Player extends FlxSprite
	{
		//Variables got here
		public var bulletArray:Array;
		private var bulletID:int = 0;
		private var bullet:FlxSprite;
		private var threshold:Number = 0.3;
		private var counter:Number=0;

		public function Player(X:Number, Y:Number)
		{
			super(X*16,Y*16);
			loadGraphic(Registry.hero,true,true,16,16);
			addAnimation("idle1",[0],15);
			addAnimation("movingH",[1,0,2,0],15,true);

			this.acceleration.y = 450;
			this.offset.x = 5;
			this.offset.y = 8;
			this.width = 5;
			this.height = 8;
			this.health = 100;
		}
		
		override public function update():void
		{
			this.velocity.x = 0;
			counter += FlxG.elapsed;
			
			if(FlxG.keys.LEFT)
			{
				this.facing = LEFT;
				this.velocity.x = -100;
			}
			
			if(FlxG.keys.RIGHT)
			{
				this.facing = RIGHT;
				this.velocity.x = 100;
			}
			
			if(FlxG.keys.pressed('SPACE'))
			{
				if(counter >= threshold)
				{
					counter = 0;
					FlxG.play(Registry.LaserShoot,0.5);
					bullet = bulletArray[bulletID];
					if(facing == RIGHT)
					{
						bullet.reset(x + 4,y - 2);
						bullet.velocity.x = 400;
					}
					else
					{
						bullet.reset(x - 4,y - 2);
						bullet.velocity.x = -400;
					}
					bulletID++;
					if(bulletID == 20)
					{
						bulletID = 0;
					}
				}
			}
			
			if(this.velocity.x == 0)
			{
				this.play("idle1");
			}
			else
			{
				this.play("movingH");
			}
			super.update();
		}
	}
}