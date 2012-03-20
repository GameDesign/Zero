package
{
	import org.flixel.*;
	
	public class Options extends FlxState
	{
		[Embed(source = "data/button_image3.png")] public static var ButtonImage:Class;
		override public function create():void
		{
			var t:FlxText;
			var b:FlxButton;
			
			t = new FlxText(0, 0, FlxG.width, "Options");
			t.setFormat("", 72, 0xffffffff, "center");
			add(t);
			
			b = new FlxButton((FlxG.width / 2) - 50, 100, "Credits", credits);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
			
			b = new FlxButton((FlxG.width / 2) - 50, 150, "Toggle Song", music);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
			
			b = new FlxButton((FlxG.width / 2) - 50, 200, "Toggle SFX", soundEffects);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
			
			b = new FlxButton((FlxG.width / 2) - 50, 250, "Back", backToMain);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function credits():void
		{
			FlxG.switchState(new Credits());
		}
		
		public function music():void
		{
			
		}
		
		public function soundEffects():void
		{
			
		}
		
		public function backToMain():void
		{
			FlxG.switchState(new MainMenu());
			super.update(); 
		}
	}
}