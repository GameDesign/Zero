package  
{
	import org.flixel.*;
	
	public class Zombie extends FlxSprite
	{
		[Embed(source = "data/zombie.png")] private static var ImgZombie:Class;
		
		public var speed:int;
		
		public function Zombie()
		{
			super();
			// Loads a graphic of a zombie
			loadGraphic(ImgZombie);
			//Choose a random speed
			speed = Math.random() * 20 + 1;
			//Makes the y coordinate of the zombie start at the bottom
			y = FlxG.height - height;
		}
		
		override public function update():void 
		{
			//Adds speed to the zombie
			velocity.x = speed;
			super.update();
		}
	}
}