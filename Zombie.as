package  
{
	import org.flixel.*;
	
	public class Zombie extends FlxSprite
	{
		[Embed(source = "data/zombie.png")] private static var ImgZombie:Class;
		
		// vars
		public var speed:int;
		
		public function Zombie()
		{
			super();
			// Loads a graphic of a zombie
			loadGraphic(ImgZombie, true, true, 71, 105);
			
			addAnimation("walk", [0, 1, 2, 3, 4, 5, 6], 4, true);
			//Choose a random speed
			speed = Math.random() * 10 + 1;
			//Makes the y coordinate of the zombie start at the bottom
			x = -width;
			y = FlxG.height - height;
		}
		
		override public function update():void 
		{
			//Adds speed to the zombie
			velocity.x = speed;
			
			play("walk");
			super.update();
		}
	}
}