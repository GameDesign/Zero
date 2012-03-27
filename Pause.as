package  
{
	import org.flixel.*;
	
	public class Pause extends FlxGroup
	{
		[Embed(source = "data/pause_bg.png")] private static var PauseIMG:Class;
		
		public var pause:FlxButton;
		public var mute:FlxButton;
		public var louder:FlxButton;
		public var quieter:FlxButton;
		
		public function Pause()
		{
			super();
			
			pause = new FlxButton(50, 50, "Pause", doSomething);
			mute = new FlxButton(50, 100, "Mute", muteSound);
			louder = new FlxButton(50, 150, "+", doSomething);
			quieter = new FlxButton(50, 200, "-", doSomething);
		
			// Loads a graphic of a pause menu
			add(new FlxSprite(0, 0, PauseIMG));
			add(pause);
			add(mute);
			add(louder);
			add(quieter);
		}
		
		private function muteSound():void
		{
			FlxG.mute = !FlxG.mute;
			FlxG.log("Mute");
			FlxG.paused = true;
		}
		
		public function doSomething():void
		{
			FlxG.log("Something");
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}