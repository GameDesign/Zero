package
{
	import org.flixel.*;
	
	public class Credits extends FlxState
	{
		override public function create():void
		{
			var t:FlxText;
			
			t = new FlxText(0, 0, FlxG.width, "Credits");
			t.setFormat("Creeper Pixel", 72, 0xffffffff, "center");
			add(t);
			
			t = new FlxText(125, 200, FlxG.width, "Designed and Developed By:\nBrandon Kerr\nSpencer Baynton\nNick Schudlo\nTaylor Jackson");
			add(t);
			
		}
		
		override public function update():void
		{

		}
	}
}