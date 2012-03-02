package  
{
	import org.flixel.*;
	public class Zombie extends FlxSprite
	{
		
		public function Zombie() 
		{
			super();
			//Adds a graphic of a zombie
			makeGraphic(32, 64, 0xFF00FF00);
			
			//Makes the y coordinate of the zombie start at the bottom
			y = FlxG.height - height;
		}
		
		override public function update():void 
		{
			//Adds speed to the zombie
			velocity.x = Math.random() * 50;
			
			super.update();
		}
		
	}

}