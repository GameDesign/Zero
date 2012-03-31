package 
{
	import org.flixel.*;

	public class Death extends FlxState
	{
		
		override public function create():void
		{
			var text:FlxText = new FlxText(0, FlxG.height / 2, FlxG.width, FlxG.score.toString());
			text.alignment = "center";
			text.size = 32;
			text.y -= text.height;
			add(text);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.mouse.justPressed())
				FlxG.switchState(new PlayState());
		}
	}
}