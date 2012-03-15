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
		
		public var board:Board;
		public var type:int;
		public var images:Array = new Array(ImgBullet, ImgBrain, ImgFoot, ImgHand, ImgHeart, ImgStomach);
		public var fade:Boolean;
		
		public function Tile(b:Board)
		{
			super();
			board = b;
			type = Math.random() * images.length;
			loadGraphic(images[type]);
			onUp = onClick;
			fade = false;
		}
		
		public function randomize():void
		{
			var random:int = Math.random() * images.length;
			loadGraphic(images[random]);
			type = random;
			alpha = 1;
			fade = false;
			board.checkBoard();
		}
		
		public function setType(newType:int):void
		{
			loadGraphic(images[newType]);
			type = newType;
		}
		
		public function onClick():void
		{
			if (!board.toggle)
				board.toggle = this;
			else
				board.swap(this);
		}
		
		public function fadeOut():void
		{
			//this.alpha = 0.5;
			fade = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (fade)
			{
				//this.alpha = 0.5;
				if(alpha > 0)
					alpha -= 0.1;
				else
					randomize();
					
			}
		}
	}
}