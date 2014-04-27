package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class MonsterBR extends FlxSprite
	{
		//Variables got here

		public function MonsterBR()
		{
			super();
			loadGraphic(Registry.M2,true,true,16,32);
			addAnimation("movingH",[1,0,2],15,true);
			exists = false;
			//this.acceleration.y = 450;
			this.health = 30;
		}
		
		public function launch():void
		{
			x = 464;
			y = 176;
			velocity.x = -Math.floor(10 + (Math.random() * (20 - 10)));//((FlxG.random() * 100)+100);
			exists = true;
		}
		
		override public function update():void
		{
			this.play("movingH");

			super.update();
		}
	}
}