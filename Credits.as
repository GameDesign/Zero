package
{
	import flash.display.GraphicsSolidFill;
	import org.flixel.*;
	
	public class Credits extends FlxState
	{
		[Embed(source = "data/button_image3.png")] public static var ButtonImage:Class;
		override public function create():void
		{
			var t:FlxText;
			var b:FlxButton;
			
			t = new FlxText(0, 0, FlxG.width, "Credits");
			t.setFormat("", 72, 0xffffffff, "center");
			add(t);
			
			t = new FlxText(125, 200, FlxG.width, "Designed and Developed By:\nBrandon Kerr\nSpencer Baynton\nNick Schudlo\nTaylor Jackson");
			add(t);
			
			b = new FlxButton((FlxG.width / 2) - 50, 300, "Back", stopCredits);
			b.loadGraphic(ButtonImage, false, false);
			add(b); 
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function stopCredits():void
		{
			FlxG.switchState(new Options());
			super.update();
		}
	}
}