package
{
	import org.flixel.*;
	
	public class ZTile extends FlxButton
	{
		[Embed(source = "data/bullet.png")] private static var ImgBullet:Class;
		[Embed(source = "data/brain.png")] private static var ImgBrain:Class;
		[Embed(source = "data/foot.png")] private static var ImgFoot:Class;
		[Embed(source = "data/hand.png")] private static var ImgHand:Class;
		[Embed(source = "data/heart.png")] private static var ImgHeart:Class;
		[Embed(source = "data/stomach.png")] private static var ImgStomach:Class;
		
		public var board:ZBoard;
		public var type:int;
		public var images:Array = new Array(ImgBullet, ImgBrain, ImgFoot, ImgHand, ImgHeart, ImgStomach);
		
		public function ZTile(Board:ZBoard)
		{
			super();
			board = Board;
			type = Math.random() * images.length;
			loadGraphic(images[type]);
			onUp = onClick;
		}
		
		public function randomize():void
		{
			var random:int = Math.random() * images.length;
			loadGraphic(images[random]);
			type = random;
			board.match();
		}
		
		public function onClick():void
		{
			if (!board.toggle)
				board.toggle = this;
			else
				board.swap(this);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}