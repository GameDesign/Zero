package {
	import org.flixel.*;

	public class MainMenu extends FlxState {
		
		public function MainMenu() {
			var t:FlxText;
			
			t = new FlxText(0, FlxG.height/2, FlxG.width, "ZERO");
			t.size = 24;
			t.y -= t.height;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0, FlxG.height, FlxG.width, "click to play");
			t.size = 12;
			t.y -= t.height;
			t.alignment = "center";
			add(t);

			// Shows the mouse cursor
			FlxG.mouse.show();
		}

		override public function update():void {
			// If the mouse was just pressed
			if (FlxG.mouse.justPressed())
				// Switch from the main menu to the gameplay
				FlxG.switchState(new PlayState());
		}
	}
}