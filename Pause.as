package  
{
	import org.flixel.*;
	
	public class Pause extends FlxGroup
	{
		[Embed(source = "data/pause_bg.png")] private static var PauseIMG:Class;
		[Embed(source = "data/blank.png")] private static var ClearIMG:Class;
		[Embed(source = "data/volume.png")] private static var VolumeIMG:Class;
		public var pause:FlxButton;
		public var mute:FlxButton;
		public var louder:FlxButton;
		public var quieter:FlxButton;
		
		public var volumeBar:FlxSprite;
		
		public function Pause()
		{
			super();
			
//			pause = new FlxButton(50, 50, "Pause", doSomething);
//			mute = new FlxButton(50, 100, "Mute", muteSound);
//			louder = new FlxButton(50, 150, "+", doSomething);
//			quieter = new FlxButton(50, 200, "-", doSomething);
//		
			// Loads a graphic of a pause menu
			add(new FlxSprite(0, 10, PauseIMG));
			add(new FlxButton(35, 170, null, doSomething).loadGraphic(ClearIMG, false, false));
			add(new FlxButton(35, 210, null, muteSound).loadGraphic(ClearIMG, false, false));
			add(new FlxButton(35, 250, null, quieterSound).loadGraphic(ClearIMG, false, false));
			add(new FlxButton(35, 290, null, louderSound).loadGraphic(ClearIMG, false, false));
			
			//Loads the volume bar sprite sheet to be displayed with the pause menu
			volumeBar = new FlxSprite(10, -10, VolumeIMG);
			volumeBar.loadGraphic(VolumeIMG, true, false, 160, 60);
			volumeBar.scale.x = 0.75;
			volumeBar.scale.y = 0.75;
			
			add(volumeBar);
			//Set the volume frame to the current volume
			volumeBar.frame = FlxG.volume*10;
			
		}
		
		private function muteSound():void
		{
			//Toggles mute
			FlxG.mute = !FlxG.mute;
			
			//Sets volume bar sprite
			if(FlxG.mute)
				volumeBar.frame = 0;
			else
				volumeBar.frame = FlxG.volume * 10;
				
			FlxG.log("Mute");
			FlxG.paused = true;
			this.revive();
		}
		
		public function doSomething():void
		{
			FlxG.log("Something");
			FlxG.paused = true;
			this.revive();
		}
		
		private function louderSound():void
		{
			FlxG.volume = FlxG.volume + 0.1;
			volumeBar.frame = FlxG.volume*10;
			FlxG.paused = true;
			this.revive();
		}
		
		private function quieterSound():void
		{
			FlxG.volume = FlxG.volume - 0.1;
			volumeBar.frame = FlxG.volume*10;
			FlxG.paused = true;
			this.revive();
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}