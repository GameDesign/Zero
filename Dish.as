package  
{
	import org.flixel.*;
	public class Dish extends FlxSprite
	{
		[Embed(source = "data/dish.png")] public static var Img:Class;
		
		public function Dish() 
		{
			super();
			// Loads a graphic of a zombie
			loadGraphic(Img, false, false, 26, 6);
			x = 275;
			y = 420;
		}
		
		override public function update():void
		{
			velocity.x = -100;
			super.update();
		}
		
	}

}