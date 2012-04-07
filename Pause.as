package  
{
	import org.flixel.*;
	
	public class Pause extends FlxGroup
	{
		[Embed(source = "data/pause_bg.png")] private static var PauseIMG:Class;
		[Embed(source = "data/pausemenu.png")] private static var ClearIMG:Class;
		public var pause:FlxButton;
		public var mute:FlxButton;
		public var louder:FlxButton;
		public var quieter:FlxButton;
		
		public function Pause()
		{
			super();
			
//			pause = new FlxButton(50, 50, "Pause", doSomething);
//			mute = new FlxButton(50, 100, "Mute", muteSound);
//			louder = new FlxButton(50, 150, "+", doSomething);
//			quieter = new FlxButton(50, 200, "-", doSomething);
//		
			// Loads a graphic of a pause menu
			add(new FlxSprite(0, 0, PauseIMG));
			
//			add(new FlxButton(55, 180, null, doSomething).loadGraphic(ClearIMG, false, false));
//			add(new FlxButton(55, 220, null, muteSound).loadGraphic(ClearIMG, false, false));
//			add(new FlxButton(55, 260, null, louderSound).loadGraphic(ClearIMG, false, false));
//			add(new FlxButton(55, 305, null, quieterSound).loadGraphic(ClearIMG, false, false));
			
		}
		
		private function muteSound():void
		{
			FlxG.mute = !FlxG.mute;
			FlxG.log("Mute");
		}
		
		public function doSomething():void
		{
			FlxG.log("Something");
		}
		
		private function louderSound():void
		{
			FlxG.volume = FlxG.volume + 0.1;
		}
		
		private function quieterSound():void
		{
			FlxG.volume = FlxG.volume - 0.1;
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}