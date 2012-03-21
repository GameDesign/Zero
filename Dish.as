package  
{
	import org.flixel.*;
	public class Dish extends FlxSprite
	{
		[Embed(source = "data/heart.png")] public static var Img:Class;
		
		public function Dish() 
		{
			super();
			// Loads a graphic of a zombie
			loadGraphic(Img, true, true, 20, 20);
			x = 275;
			y = 420;
		}
		
		override public function update():void
		{
			velocity.x = -40;
			super.update();
		}
		
	}

}