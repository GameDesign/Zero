package
{
	import org.flixel.*;
	
	public class Options extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			var b:FlxButton;
			
			t = new FlxText(0, 0, FlxG.width, "Options");
			t.setFormat("Creeper Pixel", 72, 0xffffffff, "center");
			add(t);
			
			b = new FlxButton(125, 100, "Credits", credits);
			add(b);
			
			b = new FlxButton(125, 150, "Turn on/off Music", music);
			add(b);
			
			b = new FlxButton(125, 200, "Turn on/off Sound Effects", soundEffects);
			add(b);
			
			b = new FlxButton(125, 250, "Back", backToMain);
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