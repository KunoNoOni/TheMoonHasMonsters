package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class Intro extends FlxState
	{
		//Variables got here
		private var dialogBox:FlxSprite;
		private var dialog:Array = new Array("Having decided to not do Ludum Dare 29 because the theme \"sucks\", you decide to take a trip to the moon.\n\n" +
			" After an uneventful trip, you search around for something to see. You find what looks like a mine shaft, and head in. This long " +
			"twisty passage finally opens up to a huge cavern with a bridge. As you step out on the bridge you notice this clear ooze and realize " +
			"it is preventing you from jumping! Suddenly odd shaped pink things start moving towards you!\n\n \"Oh my!\" you scream " +
			"\"The Moon Has Monsters!\". \n\nPress X to continue");
		private var elapsed:Number = 0;
		private var pageIndex:int = 0;;
		private var charIndex:int = 0;
		private var displaySpeed:int = .45;
		private var dialogText:FlxText;
		private var displaying:Boolean = true;
		
		public function Intro()
		{
			super();
		}
		
		override public function create():void
		{			
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
					
			dialogBox = new FlxSprite(20,20,Registry.dialogBox);
			add(dialogBox);
			
			dialogText = new FlxText(23,25,200,"");
			dialogText.setFormat(null,8,0xfff200, "left");
			add(dialogText);
		}
		
		override public function update():void
		{
			if(displaying)
			{
				elapsed += FlxG.elapsed;
				if(elapsed > displaySpeed)
				{
					elapsed = 0;
					charIndex++;
					if(charIndex > dialog[pageIndex].length)
					{
						displaying = false;
					}
					dialogText.text = dialog[pageIndex].substr(0, charIndex);
					FlxG.play(Registry.ChatType,.8);
				}
			}

			if(FlxG.keys.X)
			{
				FlxG.switchState(new PlayState());
			}
			super.update();
		}
	}
}