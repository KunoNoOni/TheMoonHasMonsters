package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class MonsterAL extends FlxSprite
	{
		//Variables got here

		public function MonsterAL()
		{
			super();
			loadGraphic(Registry.M1,true,true,16,16);
			addAnimation("movingH",[0,1,0,2],15,true);
			exists = false;
			this.facing = LEFT;
			//this.acceleration.y = 450;
			this.health = 20;
		}
		
		public function launch():void
		{
			x = 1;
			y = 192;
			velocity.x = Math.floor(10 + (Math.random() * (30 - 10)));//((FlxG.random() * 100)+100);
			exists = true;
		}
		
		override public function update():void
		{
			this.play("movingH");
			
			super.update();
		}
	}
}