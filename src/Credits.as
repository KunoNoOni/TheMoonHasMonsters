package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class Credits extends FlxState
	{
		//Variables got here
		private var earth:FlxSprite;
		private var stars:FlxSprite;
		private var speed:int = -50;
		private var starfield:StarfieldFX;
		private var dialog:Array = new Array("Credits\n\nThe\nMoon Has\nMonsters!\n\nBy KunoNoOni\n\nCreated for\nLudum Dare 29 #LD48" +
			"\n\n\n\n\n\nThanks for playing!\n\n\n\n\n\n\n\n\n\nPress [x] to continue");
		private var dialogText:FlxText;
		
		public function Credits()
		{
			super();
		}
		
		override public function create():void
		{			
			FlxG.playMusic(Registry.titleCredits);
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(0, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
		
			dialogText = new FlxText(0,240,240,"");
			dialogText.setFormat("Showcard Gothic",20,0xfff200, "center");
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