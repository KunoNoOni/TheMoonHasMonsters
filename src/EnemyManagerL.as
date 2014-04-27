package
{
	import flash.utils.getTimer;
	
	import org.flixel.*;

	public class EnemyManagerL extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:int = 1000;
		private var monAL:MonsterAL;
		private var monBL:MonsterBL;
		private var monCL:MonsterCL;
		private var i:int;
	
		public function EnemyManagerL() 
		{
			super();
			
			switch(Registry.stage)
			{
				case 1: 
				{
					
					for (i = 0; i < 35; i++)
					{
						add(new MonsterAL);
					}
					break;
				}
				case 2: 
				{
					for (i = 0; i < 30; i++)
					{
						add(new MonsterBL);
					}
					break;
				}
				case 3: 
				{
					for (i = 0; i < 30; i++)
					{
						add(new MonsterCL);
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
					monAL = MonsterAL(getFirstAvailable());
					if (monAL)
					{
						monAL.launch();
					}
					break;
				}
				case 2: 
				{
					monBL = MonsterBL(getFirstAvailable());
					if (monBL)
					{
						monBL.launch();
					}
					break;
				}
				case 3: 
				{
					monCL = MonsterCL(getFirstAvailable());
					if (monCL)
					{
						monCL.launch();
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