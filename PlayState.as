package {
	import org.flixel.*;

	public class PlayState extends FlxState {
	
		override public function create():void {
			add(new Zombie());
		}
		
		override public function update():void {
			super.update();
		}
	}
}