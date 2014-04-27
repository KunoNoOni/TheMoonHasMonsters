package 
{
	import org.flixel.*;

	public class PBullet extends FlxSprite
	{	
		public function PBullet(X:Number,Y:Number)
		{
			super(X, Y);
			loadGraphic(Registry.bullet,false,false,4,4);
		}
		
		override public function update():void
		{
			if(this.x > FlxG.stage.width || this.x < -10)
			{
				this.kill();
			}
			
			super.update();
		}
	}
}