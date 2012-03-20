package {
	import org.flixel.*;

	public class MainMenu extends FlxState
	{
		[Embed(source="data/music.mp3")] public static var SndMusic:Class;	
		[Embed(source="data/button_image3.png")] public static var ButtonImage:Class;
		
		override public function create():void
		{
			var t:FlxText;
			var b:FlxButton;
			
			t = new FlxText(0, FlxG.height/3, FlxG.width, "ZERO");
			t.setFormat("", 72, 0xffffffff, "center");
			t.y -= t.height;
			add(t);
			
			b = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Click to play", startGame);
			b.loadGraphic(ButtonImage, false, false);
			b.x -= b.width / 2;
			add(b);
			
			b = new FlxButton(FlxG.width / 2, FlxG.height / 2, "Options", optionsClick);
			b.loadGraphic(ButtonImage, false, false);
			b.x -= b.width / 2;
			b.y += b.height * 2;
			add(b);

			// Shows the mouse cursor
			FlxG.mouse.show();
			FlxG.play(SndMusic); 
		}

		override public function update():void
		{
			super.update();
		}
		
		public function optionsClick():void
		{
			FlxG.switchState(new Options());
		}
		
		public function startGame():void
		{
			FlxG.switchState(new PlayState());
		}
	}
}