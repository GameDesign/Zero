package
{
	import flash.events.Event;
	import org.flixel.FlxGame;
	//import flash.events.Event;
	
	[SWF(width="320",height="480",backgroundColor="#FFFFFF")]
	[Frame(factoryClass="Preloader")]
	
	public class Zero extends FlxGame
	{
		public function Zero()
		{
			super(320, 480, MenuState, 1);
			//forceDebugger = true; // remove for release
		}
		
		override protected function create(FlashEvent:Event):void
		{
			super.create(FlashEvent);
			stage.removeEventListener(Event.DEACTIVATE, onFocusLost);
			stage.removeEventListener(Event.ACTIVATE, onFocus);
		}
	
	}
}