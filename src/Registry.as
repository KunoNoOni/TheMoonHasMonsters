package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Registry
	{
		public static var levels:Array = ["null","Level1"];
		public static var currLevel:int = 1;
		public static var bulletDir:Number;
		public static var wep:FlxWeapon;
		public static var stage:Number = 1;
		public static var stageComplete:Boolean = false;
		public static var playerHealth:Number;
		public static var toCompleteStage:Number = 50;	

		[Embed(source = 'Sprites/buildTiles.png')] static public var buildTile:Class;
		[Embed(source = 'Sprites/Hero.png')] static public var hero:Class;
		[Embed(source = 'Sprites/bullet.png')] static public var bullet:Class;
		[Embed(source = 'Sprites/gun.png')] static public var Gun:Class;
		[Embed(source = 'Sprites/heart.png')] static public var heart:Class;
		[Embed(source = 'Sprites/Monster1-16x16.png')] static public var M1:Class;
		[Embed(source = 'Sprites/Monster2-32x16.png')] static public var M2:Class;
		[Embed(source = 'Sprites/Monster3-16x16.png')] static public var M3:Class;
		[Embed(source = 'Sprites/dialogBox.png')] static public var dialogBox:Class;
		[Embed(source = 'Sprites/playerBits.png')] static public var pBits:Class;
		[Embed(source = 'Sprites/monsterBlood.png')] static public var mBlood:Class;
		[Embed(source = 'Sprites/titleBackground.png')] static public var tBgnd:Class;
		
			
		[Embed(source = 'Maps/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')] static public var Level1:Class;
		
		[Embed(source = 'sounds/ChatType.mp3')] static public var ChatType:Class;
		[Embed(source = 'sounds/playerHurt.mp3')] static public var playerHurt:Class;
		[Embed(source = 'sounds/mobADeath.mp3')] static public var mobADeath:Class;
		[Embed(source = 'sounds/mobBDeath.mp3')] static public var mobBDeath:Class;
		[Embed(source = 'sounds/mobCDeath.mp3')] static public var mobCDeath:Class;
		[Embed(source = 'sounds/Laser_Shoot.mp3')] static public var LaserShoot:Class;
		[Embed(source = 'sounds/heartPickup.mp3')] static public var heartPickup:Class;

		[Embed(source = 'Music/OnTheVertexsWings.mp3')] static public var titleCredits:Class;
		[Embed(source = 'Music/TheRunningKittens.mp3')] static public var ending:Class;
		[Embed(source = 'Music/TheWhiteCats.mp3')] static public var gameplay:Class;
		[Embed(source = 'Music/TheBrownBranch.mp3')] static public var death:Class;
		
		[Embed(source="../fonts/SHOWG.ttf", fontFamily="Showcard Gothic", embedAsCFF="false")] static public var fntShowG:String;
		
		
		public function Registry()
		{
		}
	}
}