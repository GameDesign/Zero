package {
	import org.flixel.*;

	public class MainMenu extends FlxState
	{
		[Embed(source="data/creeper_pixel.ttf", fontFamily="Creeper Pixel", embedAsCFF="false")] public var FntCreeperPixel:String;
		
		override public function create():void
		{
			var t:FlxText;
			
			t = new FlxText(0, FlxG.height/3, FlxG.width, "ZERO");
			t.setFormat("Creeper Pixel", 72, 0xffffffff, "center");
			t.y -= t.height;
			add(t);
			
			t = new FlxText(0, FlxG.height, FlxG.width, "click to play");
			t.setFormat("Creeper Pixel", 36, 0xffffffff, "center");
			t.y -= t.height;
			add(t);

			// Shows the mouse cursor
			FlxG.mouse.show();
		}

		override public function update():void
		{
			// If the mouse was just pressed
			if (FlxG.mouse.justPressed())
				// Switch from the main menu to the gameplay
				FlxG.switchState(new PlayState());
			super.update();
		}
	}
}