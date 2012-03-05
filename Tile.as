package
{
	import org.flixel.*;
	
	public class Tile extends FlxButton
	{
		[Embed(source = "data/bullet.png")] private static var ImgBullet:Class;
		[Embed(source = "data/brain.png")] private static var ImgBrain:Class;
		[Embed(source = "data/foot.png")] private static var ImgFoot:Class;
		[Embed(source = "data/hand.png")] private static var ImgHand:Class;
		[Embed(source = "data/heart.png")] private static var ImgHeart:Class;
		[Embed(source = "data/stomach.png")] private static var ImgStomach:Class;
		
		public var tileType:int;
		public var images:Array = new Array(ImgBullet, ImgBrain, ImgFoot, ImgHand, ImgHeart, ImgStomach);
				
		public function Tile(type:int)
		{
			super();
			loadGraphic(images[type]);
			tileType = type;
			onUp = onClick;
		}
		
		public function randomize():void
		{
			var random:int = Math.random() * images.length;
			
			loadGraphic(images[random]);
		}
		
		public function onClick():void
		{
			FlxG.log("Clicked");
			//randomize();
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}