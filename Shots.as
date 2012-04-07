package  
{
	import org.flixel.*;
	public class Shots extends FlxSprite
	{
		
		[Embed(source = "data/bulletShot.png")] public static var Img:Class;
		
		public function Shots() 
		{
			super();
			// Loads the graphic
			loadGraphic(Img, false, false, 21, 20);
			x = 225;
			y = 420;	
		}
		
		override public function update():void
		{
			velocity.x = -175;
			super.update();
		}
		
	}

}