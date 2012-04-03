package {
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		[Embed(source="data/brainz.png")] public static var ImgZombie:Class;
		[Embed(source="data/title.png")] public static var ImgTitle:Class;
		
		public var background:FlxSprite;
		public var text:FlxText;
		public var zombie:FlxSprite;
		 
		override public function create():void
		{
			background = new FlxSprite();
			background.loadGraphic(ImgTitle, true, false, 320, 480);
			background.addAnimation("flicker", [0, 1], 1, true);
			add(background);
			
			zombie = new FlxSprite(0, FlxG.height, ImgZombie);
			zombie.velocity.x = 50;
			zombie.x -= zombie.width * 2;
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
			
			background.play("flicker");
			
			if (zombie.x > FlxG.width)
				zombie.x = -zombie.width * 2;
			
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