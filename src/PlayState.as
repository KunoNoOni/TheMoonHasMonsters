package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var Level:FlxTilemap;
		private var player:Player;
		private var b:PBullet;
		private var bulletGroup:FlxGroup = new FlxGroup();
		private var EML:EnemyManagerL;
		private var EMR:EnemyManagerR;
		private var HD:HeartDropManager;
		private var heart:HeartDrop;
		private var lifeLabel:FlxText;
		private var lifeNumLabel:FlxText;
		private var killsLabel:FlxText;
		private var killsNumLabel:FlxText;
		private var killsCounter:Number = 0;
		private var mobAL:MonsterAL;
		private var mobAR:MonsterAR;
		private var mobBL:MonsterBL;
		private var mobBR:MonsterBR;
		private var mobCL:MonsterCL;
		private var mobCR:MonsterCR;
		private var tookDamage:Boolean = false;
		private var stageSwitch:Boolean = false;
		private var damageTimer:FlxDelay;
		private var stageCounterDelay:FlxDelay;
		private var endGameTimer:FlxDelay;
		private var stageCounter:Number=0;
		private var num:Number;
		private var emit:FlxEmitter;
		private var emit2:FlxEmitter;

				
		override public function create():void
		{	
			FlxG.playMusic(Registry.gameplay);
			Level = new FlxTilemap(); 
			Level.loadMap(new Registry[Registry.levels[Registry.currLevel]],Registry.buildTile,16,16,0,0,1,2);
			add(Level);
			
			if(Registry.stageComplete)
			{
				Registry.stage += 1;
				Registry.stageComplete = false;
			}
			
			EML = new EnemyManagerL();
			add(EML);
			
			EMR = new EnemyManagerR();
			add(EMR);
			
			HD = new HeartDropManager();
			add(HD);
			
			player = new Player(16,12);
			add(player);
			
			player.health = Registry.playerHealth;
			
			hud();
			
			initPlayerBullets();
			
			//set the camera and worldbounds
			FlxG.worldBounds.x = 0;
			FlxG.worldBounds.y = 0;
			FlxG.worldBounds.width = Level.width;
			FlxG.worldBounds.height = Level.height;
			
			FlxG.camera.setBounds(0, 0, Level.width, Level.height);
			FlxG.worldBounds = new FlxRect(0, 0, Level.width, Level.height);
			FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
			
			damageTimer = new FlxDelay(1000);
			stageCounterDelay = new FlxDelay(2000);
			endGameTimer = new FlxDelay(2000);
		}	
		
		override public function update():void
		{
			if(player.x < 16)
			{
				player.x = 16;
			}
			if(player.x > 464)
			{
				player.x = 464;
			}
			
			//this is for checking if the stage is over
			if(stageCounter >= Registry.toCompleteStage)
			{
				if(!stageSwitch)
				{
					stageSwitch = true;
					stageCounterDelay.reset(2000);
					FlxG.fade(0x00000000,2);
				}

				Registry.stageComplete = true;
			}
			
			//this goes with the above check
			if(stageCounterDelay.hasExpired)
			{
				FlxG.playMusic(Registry.gameplay,0);
				switch(Registry.stage)
				{
					case 1:
					{
						FlxG.switchState(new CutScene1());
						break;
					}
					case 2:
					{
						FlxG.switchState(new CutScene2());
						break;
					}
					case 3:
					{
						FlxG.switchState(new Ending());
						break;
					}
				}
			}
			
			if(endGameTimer.hasExpired)
			{
				FlxG.switchState(new Death());
			}
			
			//this checks if the delay for the player getting hurt is over
			if(damageTimer.hasExpired)
			{
				tookDamage = false;
			}
			
			if(!tookDamage)
				FlxG.overlap(EML,player,playerLoseHealth);
			
			if(!tookDamage)
				FlxG.overlap(EMR,player,playerLoseHealth);
			
			
			
			FlxG.overlap(EML,bulletGroup,mobLoseHealth);
			FlxG.overlap(EMR,bulletGroup,mobLoseHealth);
			FlxG.overlap(HD,player,playerGainsHealth);
			
			super.update();
			
			FlxG.collide(EML,Level);
			FlxG.collide(EMR,Level);
			FlxG.collide(heart,Level);
			FlxG.collide(player,Level);
		}
		
		private function initPlayerBullets():void
		{
			for(var v:int = 0;v<20;v++)
			{
				b = new PBullet(-20,-20);
				bulletGroup.add(b);
			}
			
			player.bulletArray = bulletGroup.members;
			add(bulletGroup);
		}
		
		private function hud():void
		{
			lifeLabel = new FlxText(5,5,100, "Life: ");
			lifeLabel.setFormat(null,10,0xFFFFFF, "left");
			lifeLabel.scrollFactor.x = lifeLabel.scrollFactor.y = 0; 
			add(lifeLabel);
			lifeNumLabel = new FlxText(35,5,100, ""+Registry.playerHealth);
			lifeNumLabel.setFormat(null,10,0xFFFFFF, "left");
			lifeNumLabel.scrollFactor.x = lifeNumLabel.scrollFactor.y = 0;
			add(lifeNumLabel);
			
			killsLabel = new FlxText(150,5,100, "Kills: ");
			killsLabel.setFormat(null,10,0xFFFFFF, "left");
			killsLabel.scrollFactor.x = killsLabel.scrollFactor.y = 0; 
			add(killsLabel);
			killsNumLabel = new FlxText(185,5,100, ""+killsCounter);
			killsNumLabel.setFormat(null,10,0xFFFFFF, "left");
			killsNumLabel.scrollFactor.x = killsNumLabel.scrollFactor.y = 0;
			add(killsNumLabel);
		}
		
		private function playerLoseHealth(a:FlxSprite, b:FlxSprite):void
		{
			tookDamage = true;
			damageTimer.start();
			FlxG.play(Registry.playerHurt,0.5);
			b.health -= 15;
			Registry.playerHealth = player.health;
			lifeNumLabel.text = ""+player.health;
			
			if(player.health <= 0)
			{
				player.kill();
				emit = new FlxEmitter(b.x,b.y-8);
				emit.setXSpeed(-15,15);
				emit.setYSpeed(-100,-50);
				emit.gravity = 350;
				emit.makeParticles(Registry.pBits,25,0,true,1);
				add(emit);
				emit.start(true,2);
				endGameTimer.start();
				EML.setAll("exists",false);
				EMR.setAll("exists",false);
			}
			
		}
		
		private function playerGainsHealth(a:FlxSprite, b:FlxSprite):void
		{
			a.kill();
			if(player.health != 100)	
			{	
				FlxG.play(Registry.heartPickup,0.5);
				b.health += 15;
				Registry.playerHealth = player.health;
				lifeNumLabel.text = ""+player.health;
			}
		}
		
		private function mobLoseHealth(a:FlxSprite, b:FlxSprite):void
		{
			a.kill();
			switch(Registry.stage)
			{
				case 1:
				{
					FlxG.play(Registry.mobADeath,0.5);
					break;
				}
				case 2:
				{
					FlxG.play(Registry.mobBDeath,0.5);
					break;
				}
				case 3:
				{
					FlxG.play(Registry.mobCDeath,0.5);
					break;
				}
			}
			emit2 = new FlxEmitter(a.x,a.y-8);
			emit2.setXSpeed(-15,15);
			emit2.setYSpeed(-100,-50);
			emit2.gravity = 350;
			emit2.makeParticles(Registry.mBlood,75,0,true,1);
			add(emit2);
			emit2.start(true,2);
			b.kill();
			stageCounter += 1;
			killsCounter += 1;
			killsNumLabel.text = ""+killsCounter;
			num = FlxG.random()*100+1;
			if(FlxU.round(num) >= 0 && FlxU.round(num) <= 10 || FlxU.round(num) >= 90 && FlxU.round(num) <= 100)
				HD.release(a.x,a.y);
		}
	}
}
