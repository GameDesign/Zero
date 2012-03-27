package  
{
	import org.flixel.*;

	public class Chef extends FlxSprite
	{
		[Embed(source = "data/chef.png")] private static var ImgChef:Class;
		public static var chopping:Boolean = false;
		
		public function Chef()
		{
			super();
			loadGraphic(ImgChef, true, true, 88, 91); // load graphic
			addAnimation("chop", [0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5, 0, 1, 2, 3, 4, 5], 24, false);
			x = FlxG.width - width;	// he's on the right
			y = FlxG.height - height -35;	// put him down on the bottom of the screen but up a bit to set him behind the counter
			immovable = true;	// obvious
			width = 70;
			offset.x = frameWidth - width;
		}
		
		override public function update():void
		{
			// do animations here
			if (chopping)
			{
				play("chop");
				chopping = false;
			}
			super.update();
		}
		
		
	}
}