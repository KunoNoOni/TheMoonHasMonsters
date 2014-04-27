package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class CutScene2 extends FlxState
	{
		//Variables got here
		private var dialogBox:FlxSprite;
		private var dialog:Array = new Array("As the last of the hulking creatures fall you wonder what else is in store for you today. Deciding you" +
			" do not want to find out, you head towards the twisting passageway. Just as your about to enter you notice the clear ooze on your boots" +
			" begins to float into the air and disappears down the passageway. Now that it's gone you attempt to jump but are still unable to do so." +
			" As your about to try again the clear ooze appears and encases you in a type of cocoon. As you try to break free you can make out what looks like" +
			" walking mounds of flesh coming towards you.. Just as their about to descend upon you, you break free! \n\nPress [x] to continue");
		private var elapsed:Number = 0;
		private var pageIndex:int = 0;;
		private var charIndex:int = 0;
		private var displaySpeed:int = .45;
		private var dialogText:FlxText;
		private var displaying:Boolean = true;
		private var HUD:FlxSprite;
		private var distanceLabel:FlxText;
		private var distanceNumLabel:FlxText;
		private var stageLabel:FlxText;
		
		public function CutScene2()
		{
			super();
		}
		
		override public function create():void
		{			
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
				FlxG.switchState(new PlayState());		
			super.update();
		}
	}
}