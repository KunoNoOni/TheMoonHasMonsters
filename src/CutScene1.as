package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class CutScene1 extends FlxState
	{
		//Variables got here
		private var dialogBox:FlxSprite;
		private var dialog:Array = new Array("\"What in the world were those creatures!\" you exclaim as you try to catch your breath. \"You know, that " +
			"theme isn't looking so bad right now...\" you think to yourself as you begin wishing you were back on Earth. You decide it would be" +
			" best to get back to the shuttle and get off this rock. As you head for the entrance to the twisty passageway, you begin hearing what " +
			"sounds like thunderous pounding and the floor begins to shake. Out of the passageways emerge large blue creatures twice as tall as you! " +
			"You grab your pistol and prepare to defend yourself!\n\nPress [x] to continue");
		private var elapsed:Number = 0;
		private var pageIndex:int = 0;;
		private var charIndex:int = 0;
		private var displaySpeed:int = .45;
		private var dialogText:FlxText;
		private var displaying:Boolean = true;
		
		public function CutScene1()
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