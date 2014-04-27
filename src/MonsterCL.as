package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class MonsterCL extends FlxSprite
	{
		//Variables got here

		public function MonsterCL()
		{
			super();
			loadGraphic(Registry.M3,true,true,16,16);
			addAnimation("movingH",[1,0,2],15,true);
			this.facing = LEFT;
			exists = false;
			//this.acceleration.y = 450;
			this.health = 40;
		}
		
		public function launch():void
		{
			x = 1;
			y = 192;
			velocity.x = Math.floor(25 + (Math.random() * (30 - 25)));//((FlxG.random() * 100)+100);
			exists = true;
		}
		
		override public function update():void
		{
			this.play("movingH");

			super.update();
		}
	}
}