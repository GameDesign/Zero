package  
{
	import org.flixel.*;
	
	public class Pause extends FlxGroup
	{
		[Embed(source = "data/pause_bg.png")] private static var PauseIMG:Class;
		[Embed(source = "data/pausemenu.png")] private static var ClearIMG:Class;
		
		public function Pause()
		{
			super();

			// Loads a graphic of a pause menu
			add(new FlxSprite(0, 0, PauseIMG));
			add(new FlxButton(55, 180, null, doSomething).loadGraphic(ClearIMG, false, false));
			add(new FlxButton(55, 220, null, muteSound).loadGraphic(ClearIMG, false, false));
			add(new FlxButton(55, 260, null, louderSound).loadGraphic(ClearIMG, false, false));
			add(new FlxButton(55, 305, null, quieterSound).loadGraphic(ClearIMG, false, false));
			
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
		
		private function louderSound()
		{
			FlxG.volume = FlxG.volume + 0.1;
		}
		
		private function quieterSound()
		{
			FlxG.volume = FlxG.volume - 0.1;
		}
	}
}