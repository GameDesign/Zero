package {
	import org.flixel.*;
	
	public class Shop extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			
			t = new FlxText(0, FlxG.height/2, FlxG.width, "Shop");
			t.size = 24;
			t.y -= t.height;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0, FlxG.height, FlxG.width, "click to play");
			t.size = 12;
			t.y -= t.height;
			t.alignment = "center";
			add(t);
		}
		
		override public function update():void
		{
			// If the mouse was just pressed
			if (FlxG.mouse.justPressed())
				// Switch from the shop to the gameplay
				FlxG.switchState(new PlayState());
			super.update();
		}
	}
}