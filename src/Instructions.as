package
{
	import org.flixel.*;
		
	public class Instructions extends FlxState
	{
		//Variables got here
		private var Level:FlxTilemap;
		private var box:FlxSprite;
		private var instruct:FlxText;
		private var instruct2:FlxText;
		private var instruct3:FlxText;
		private var instruct4:FlxText;
		private var instruct5:FlxText;
		private var pressX:FlxText;
		private var hd:HeartDrop;
		
		public function Instructions()
		{
			super();
		}
		
		override public function create():void
		{
			Registry.playerHealth = 100;
			
			Level = new FlxTilemap(); 
			Level.loadMap(new Registry[Registry.levels[Registry.currLevel]],Registry.buildTile,16,16,0,0,1,2);
			add(Level);

			box = new FlxSprite();
			box.makeGraphic(16,16,0xFFFFFFFF);
			box.x = 15*16;
			box.y = 12*16;
			add(box);
			box.visible = false;
			
			FlxG.camera.setBounds(0, 0, Level.width, Level.height);
			FlxG.worldBounds = new FlxRect(0, 0, Level.width, Level.height);
			FlxG.camera.follow(box, FlxCamera.STYLE_PLATFORMER);
			
			hd = new HeartDrop();
			add(hd);
			hd.exists = true;
			hd.x = 177;
			hd.y = 151;
			
			instruct = new FlxText(FlxG.width*0.5+30,FlxG.height*0.5-45, 200, "How to Play");
			instruct.setFormat("Showcard Gothic",20,0xfff200, "center");
			add(instruct);
			
			instruct2 = new FlxText(FlxG.width*0.5+5,FlxG.height*0.5-15, 250, "Left/Right Arrows keys to move.");
			instruct2.setFormat("Showcard Gothic",12,0xfff200, "left");
			add(instruct2);
			
			instruct3 = new FlxText(FlxG.width*0.5+5,FlxG.height*0.5+5, 240, "Space to shoot. Hold for rapid fire.");
			instruct3.setFormat("Showcard Gothic",12,0xfff200, "left");
			add(instruct3);
			
			instruct4 = new FlxText(FlxG.width*0.5+5,FlxG.height*0.5+25, 200, "Pickup ");
			instruct4.setFormat("Showcard Gothic",12,0xfff200, "left");
			add(instruct4);
			
			instruct5 = new FlxText(FlxG.width*0.5+15,FlxG.height*0.5+25, 200, " to replenish lost life.");
			instruct5.setFormat("Showcard Gothic",12,0xfff200, "right");
			add(instruct5);
			
			
			pressX = new FlxText(FlxG.width*0.5+20,FlxG.height+40, 200, "PRESS [x] TO START");
			pressX.setFormat("Showcard Gothic",15,0xfff200, "center");
			add(pressX);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
			{
				FlxG.playMusic(Registry.titleCredits,0);
				FlxG.switchState(new Intro());	//<--- using new state change code for flixel 2.5		
			}
			super.update();
		}
	}
}