package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class Death extends FlxState
	{
		//Variables got here
		private var earth:FlxSprite;
		private var stars:FlxSprite;
		private var speed:int = -12;
		private var starfield:StarfieldFX;
		private var dialog:Array = new Array("As the last ounce of strength fades from your body it slumps to the floor in a contorted mess. The" +
			" remaining creatures tear into your lifeless body, devouring your organs and entrails.\n\nSoon all that is left is a lifeless pile of bones," +
			" on the floor of an unknown cave beneath the surface of the moon. Who knows how long it will be before someone finds them.\n\n\n\n\n\n\n\n\n" +
			"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nYep, that theme is looking pretty good right about now... \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" +
			"\n\n\n\n\n\n\n\n\n\nPress [x] to continue");
		private var dialogText:FlxText;
		
		public function Death()
		{
			super();
		}
		
		override public function create():void
		{			
			FlxG.playMusic(Registry.death);
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(0, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
		
			dialogText = new FlxText(30,240,190,"");
			dialogText.setFormat(null,8,0xfff200, "left");
			add(dialogText);
			
		}
		
		override public function update():void
		{

			dialogText.text = dialog[0];
			dialogText.velocity.y = speed;
			if(FlxU.floor(dialogText.y) <= -520)
				speed = 0;
			
			if(FlxG.keys.X)
				FlxG.switchState(new TitleState());		
			super.update();
		}
		
		override public function destroy():void
		{
			starfield = null;
		}
	}
}