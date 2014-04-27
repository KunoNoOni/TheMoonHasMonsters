package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import org.flixel.plugin.photonstorm.FX.StarfieldFX;
		
	public class Ending extends FlxState
	{
		//Variables got here
		private var stars:FlxSprite;
		private var speed:int = -7;
		private var starfield:StarfieldFX;
		private var dialog:Array = new Array("With a howling shrill the last of the flesh mounds falls. You make a mad dash for the" +
			" twisting passageway, with each turn your heart races faster and faster until finally you emerge on the surface. Scanning the horizon for" +
			" your shuttle you see it in the distance and begin heading towards it.\n\nYou hear something behind you and turn to see those weird creature you" +
			" fought coming up from beneath the surface of the moon. Not wanting to repeat the experience you just had, you turn towards your shuttle and " +
			" run as fast as you can.\n\nIt seems like you've been running for an eternity, hostile creatures in tow, but you finally make it to the shuttle. " +
			"Climbing aboard you strap yourself in and activate the launch sequence.\n\nThe engines roar to life and you blast off from the surface" +
			" just in the nick of time. The heat from the engines melts some of the creature into puddles of ooze.\n\nYou feel content now that you are on" +
			" your way back home to Earth. You check your watch and see you still have time to enter the Ludum Dare and you think the experience you just" +
			" had will make a great game!\n\nNow totally motivated you begin jotting down notes while the autopilot flies you back to earth. You stop for a moment" +
			" to reflect on what just happened and then the title for your game pops into your mind 'The Moon Has Monsters!'. You smirk and go back to planning" +
			" out your game...\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress [x] to continue");
		private var dialogText:FlxText;
		
		
		public function Ending()
		{
			super();
		}
		
		override public function create():void
		{			
			FlxG.playMusic(Registry.ending);
			if (FlxG.getPlugin(FlxSpecialFX) == null)
			{
				FlxG.addPlugin(new FlxSpecialFX);
			}
			
			starfield = FlxSpecialFX.starfield();
			starfield.setStarSpeed(0, 0);
			stars = starfield.create(0, 0, FlxG.width, FlxG.height, 200);
			add(stars);
		
			dialogText = new FlxText(20,240,200,"");
			dialogText.setFormat(null,8,0xfff200, "left");
			add(dialogText);
			
		}
		
		override public function update():void
		{

			dialogText.text = dialog[0];
			dialogText.velocity.y = speed;

			if(FlxU.floor(dialogText.y) <= -585)
				speed = 0;
			
			if(FlxG.keys.X)
				FlxG.switchState(new Credits());		
			super.update();
		}
				
		override public function destroy():void
		{
			starfield = null;
		}
	}
}