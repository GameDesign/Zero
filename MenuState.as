package {
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source="data/title.png")] public static var ImgTitle:Class;
		
		public var text:FlxText;
		
		override public function create():void
		{
			add(new FlxSprite(0, 0, ImgTitle));
			
			text = new FlxText(0, FlxG.height, FlxG.width, "CLICK TO PLAY");
			text.alignment = "center";
			text.y -= text.height * 2;
			add(text);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				FlxG.fade(0xFF990000, 1, onFade);
				text.exists = false;
			}
		}
		
		public function onFade():void
		{
			FlxG.switchState(new PlayState());
		}
	}
}