package 
{
	import org.flixel.*;

	public class Death extends FlxState
	{
		[Embed(source="data/death.png")] private static var ImgBackground:Class;
		
		override public function create():void
		{
			add(new FlxSprite(0, 0, ImgBackground));
			
			var text:FlxText = new FlxText(0, FlxG.height / 2, FlxG.width, FlxG.score.toString());
			text.alignment = "center";
			text.color = 0xFF000000;
			text.size = 72;
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