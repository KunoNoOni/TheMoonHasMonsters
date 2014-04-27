package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		//Variables got here
		private var Level:FlxTilemap;
		private var mAL:MonsterAL;
		private var mAR:MonsterAR;
		private var mBL:MonsterBL;
		private var mBR:MonsterBR;
		private var mCL:MonsterCL;
		private var mCR:MonsterCR;
		private var box:FlxSprite;
		private var title:FlxText;
		private var pressX:FlxText;
		private var info:FlxText;
		
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			FlxG.playMusic(Registry.titleCredits);
			Registry.playerHealth = 100;
			Registry.stage = 1;
			Registry.stageComplete = false;
			
			Level = new FlxTilemap(); 
			Level.loadMap(new Registry[Registry.levels[Registry.currLevel]],Registry.buildTile,16,16,0,0,1,2);
			add(Level);
			
			mAL = new MonsterAL();
			add(mAL);
			mAL.launch();
			
			mAR = new MonsterAR();
			add(mAR);
			mAR.launch();
			
			mBL = new MonsterBL();
			add(mBL);
			mBL.launch();
			
			mBR = new MonsterBR();
			add(mBR);
			mBR.launch();
				
			mCL = new MonsterCL();
			add(mCL);
			mCL.launch();
			
			mCR = new MonsterCR();
			add(mCR);
			mCR.launch();
			
			box = new FlxSprite();
			box.makeGraphic(16,16,0xFFFFFFFF);
			box.x = 15*16;
			box.y = 12*16;
			add(box);
			box.visible = false;
			
			FlxG.camera.setBounds(0, 0, Level.width, Level.height);
			FlxG.worldBounds = new FlxRect(0, 0, Level.width, Level.height);
			FlxG.camera.follow(box, FlxCamera.STYLE_PLATFORMER);
			
			title = new FlxText(FlxG.width*0.5+23,FlxG.height*0.5-45, 200, "The\n Moon Has Monsters!");
			title.setFormat("Showcard Gothic",25,0xfff200, "center");
			add(title);
			
			info = new FlxText(FlxG.width*0.5+20,FlxG.height-15, 200, "A game created for Ludum Dare 29 #LD48");
			info.setFormat("Showcard Gothic",15,0xfff200, "center");
			add(info);
			
			pressX = new FlxText(FlxG.width*0.5-30,FlxG.height+40, 300, "PRESS [x] FOR INSTRUCTIONS");
			pressX.setFormat("Showcard Gothic",15,0xfff200, "center");
			add(pressX);
		}
		
		override public function update():void
		{
			if(mAL.x >= 400)
				mAL.x = 100;
			
			if(mAR.x <= 100)
				mAR.x = 400;
			
			if(mBL.x >= 400)
				mBL.x = 100;
			
			if(mBR.x <= 100)
				mBR.x = 400;
			
			if(mCL.x >= 400)
				mCL.x = 100;
			
			if(mCR.x <= 100)
				mCR.x = 400;
			
			
			if(FlxG.keys.X)
				FlxG.switchState(new Instructions());	//<--- using new state change code for flixel 2.5		
			super.update();
		}
	}
}