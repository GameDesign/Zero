package  
{
	import org.flixel.*;
	
	public class Pause extends FlxSprite
	{
		[Embed(source = "data/pause_bg.png")] private static var PauseIMG:Class;
		
		public function Pause()
		{
			super();
			// Loads a graphic of a pause menu
			loadGraphic(PauseIMG);
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}