package
{
	import flash.utils.getTimer;
	
	import org.flixel.*;

	public class EnemyManagerR extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:int = 1000;
		private var monAR:MonsterAR;
		private var monBR:MonsterBR;
		private var monCR:MonsterCR;
		private var i:int;
	
		public function EnemyManagerR() 
		{
			super();
			
			switch(Registry.stage)
			{
				case 1: 
				{
					
					for (i = 0; i < 35; i++)
					{
						add(new MonsterAR);
					}
					break;
				}
				case 2: 
				{
					for (i = 0; i < 30; i++)
					{
						add(new MonsterBR);
					}
					break;
				}
				case 3: 
				{
					for (i = 0; i < 30; i++)
					{
						add(new MonsterCR);
					}
					break;
				}
			}
		}
		
		public function release():void
		{
			switch(Registry.stage)
			{
				case 1:
				{
					monAR = MonsterAR(getFirstAvailable());
					if (monAR)
					{
						monAR.launch();
					}
					break;
				}
				case 2:
				{
					monBR = MonsterBR(getFirstAvailable());
					if (monBR)
					{
						monBR.launch();
					}
					break;
				}
				case 3:
				{
					monCR = MonsterCR(getFirstAvailable());
					if (monCR)
					{
						monCR.launch();
					}
					break;
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
			
			if(Registry.stageComplete)
			{
				setAll("exists",false);	
			}
		}
	}
}