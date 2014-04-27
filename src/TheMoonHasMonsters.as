package
{
	import org.flixel.*;
	
	[SWF(width="480", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class TheMoonHasMonsters extends FlxGame
	{
		public function TheMoonHasMonsters()
		{
			super(240,240,TitleState,2,60,60);
			//forceDebugger = true;
			//FlxG.visualDebug = true;
			//FlxG.debug = true;
		}
	}
}