package
{	
	import org.flixel.FlxGame;
	[SWF(width="320", height="480", backgroundColor="#FFFFFF")]
	[Frame(factoryClass="Preloader")]

	public class Zero extends FlxGame
	{
		public function Zero()
		{
			super(320, 480, MainMenu, 1);
			forceDebugger = true;
		}
	}
}