package  
{
	import org.flixel.*;
	
	public class Zombie extends FlxSprite
	{
		public var speed:int;
		
		public function Zombie()
		{
			super();
			//Adds a graphic of a zombie
			makeGraphic(32, 64, 0xFF00FF00);
			//Choose a random speed
			speed = Math.random() * 50;
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