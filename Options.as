package
{
	import org.flixel.*;
	
	public class Options extends FlxState
	{
		[Embed(source = "data/button_image.png")] public static var ButtonImage:Class;
		override public function create():void
		{
			var t:FlxText;
			var b:FlxButton;
			
			t = new FlxText(0, 0, FlxG.width, "Options");
			t.setFormat("Creeper Pixel", 72, 0xffffffff, "center");
			add(t);
			
			b = new FlxButton(85, 100, "Credits", credits);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
			
			b = new FlxButton(85, 150, "Turn on/off Music", music);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
			
			b = new FlxButton(85, 200, "Turn on/off Sound Effects", soundEffects);
			b.loadGraphic(ButtonImage, false, false);
			add(b);
			
			b = new FlxButton(85, 250, "Back", backToMain);
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