package {
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source="data/brainz.png")] public static var ImgZombie:Class;
		[Embed(source="data/title.png")] public static var ImgTitle:Class;
		
		public var text:FlxText;
		public var zombie:FlxSprite;
		 
		override public function create():void
		{
			add(new FlxSprite(0, 0, ImgTitle));
			
			zombie = new FlxSprite(0, FlxG.height, ImgZombie);
			zombie.velocity.x = 50;
			zombie.x -= zombie.width;
			zombie.y -= zombie.height;
			add(zombie);
			
			text = new FlxText(0, FlxG.height, FlxG.width, "CLICK TO PLAY");
			text.alignment = "center";
			text.shadow = 0xFF000000;
			text.size = 12;
			text.y -= text.height * 2;
			add(text);
			
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
			
			if (zombie.x > FlxG.width)
				zombie.x = -zombie.width;
			
			if (FlxG.mouse.justPressed())
			{
				FlxG.mouse.hide();
				FlxG.fade(0xFF000000, 1, onFade);
				text.exists = false;
			}
		}
		
		public function onFade():void
		{
			FlxG.switchState(new StoryState());
		}
	}
}