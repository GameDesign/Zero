package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Tile extends FlxButton
	{
		[Embed(source = "data/arm.png")] private static var ImgArm:Class;
		[Embed(source = "data/bullet.png")] private static var ImgBullet:Class;
		[Embed(source = "data/brain.png")] private static var ImgBrain:Class;
		[Embed(source = "data/foot.png")] private static var ImgFoot:Class;
		[Embed(source = "data/heart.png")] private static var ImgHeart:Class;
		[Embed(source = "data/stomach.png")] private static var ImgStomach:Class;
		
		public var board:Board;
		public var type:int;
		public var images:Array = new Array(ImgBullet, ImgBrain, ImgFoot, ImgHeart, ImgArm, ImgStomach);
		public var fade:Boolean;
		private var BULLET_PROBABILITY:int = 200;
		
		public var column:uint;
		public var row:uint;
		
		public function Tile(b:Board, Column:uint, Row:uint)
		{
			super();
			
			board = b;
			column = Column;
			row = Row;
			
			type = (Math.random() * (images.length - 1)) + 1;
			loadGraphic(images[type], true, false, 44, 44);
			onUp = onClick;
			fade = false;
		}
		
		public function pickTile():int
		{
			var random:int = (Math.random() * (images.length - 1))+1;
			var bulletChance:int = Math.random() * BULLET_PROBABILITY;
			if (bulletChance == 0 )
				random = 0;
			return random;
		}
		
		public function randomize():void
		{
			
			type = pickTile();
			loadGraphic(images[type], true, false, 44, 44);
			alpha = 1;
			fade = false;
			board.checkBoard();
		}
		
		public function randomizeNoCheck():void
		{
			type = pickTile();
			loadGraphic(images[type], true, false, 44, 44);
		}
		
		public function setType(newType:int):void
		{
			loadGraphic(images[newType], true, false, 44, 44);
			type = newType;
		}
		
		public function onClick():void
		{
			on = !on;
			if (!board.toggle)
				board.toggle = this;
			else
			{
				if (this != board.toggle)
					board.swap(this);
			}
		}
		
		public function fadeOut():void
		{
			fade = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (on)
				frame = PRESSED;
			
			var location:FlxPoint = new FlxPoint(column * width, row * height + FlxG.height / 15);
			
			if (x != location.x || y != location.y)
			{
				location.x += width / 2;
				location.y += height / 2;
				FlxVelocity.moveTowardsPoint(this, location, 1, 250);
			}
			
			if (fade)
			{
				if (alpha > 0)
					alpha -= 0.1;
				else
					randomize();
					
			}
		}
	}
}