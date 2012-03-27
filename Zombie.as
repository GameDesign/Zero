package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class Zombie extends FlxSprite
	{
		[Embed(source = "data/zombie.png")] private static var ImgZombie:Class;
		
		// Speed of the zombie
		public var speed:int;
		
		
		
		public function Zombie(speedScalar:Number)
		{
			super();
			// Loads a graphic of a zombie
			loadGraphic(ImgZombie, true, true, 71, 105);
			
			addAnimation("walk", [0, 1, 2, 3, 4, 5, 6], 4, true);
// Choose a random speed using the scalar
//speed = Math.random() * 5 + speedScalar;
			// set the speed
			speed = speedScalar;
			// Makes the y coordinate of the zombie start at the bottom
			x = -width;
			y = FlxG.height - height;
			width = 41;
			
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