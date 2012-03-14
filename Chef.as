package  
{
	import org.flixel.*;

	public class Chef extends FlxSprite
	{
		[Embed(source = "data/chef.png")] private static var ImgChef:Class;
		
		public function Chef()
		{
			super();	// calls the flxSprite constructor
			loadGraphic(ImgChef); // make him 64*64 and white
			x = FlxG.width - width;	// he's on the right
			y = FlxG.height - height;	// put him down on the bottom of the screen
			immovable = true;	// obvious
		}
		
		override public function update():void
		{
			super.update();
			// do animations here
		}
	}
}