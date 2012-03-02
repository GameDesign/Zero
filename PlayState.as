package {
	import org.flixel.*;

	public class PlayState extends FlxState {
	
		override public function create():void {
			add(new Zombie());
			add(new Chef());
		}
		
		override public function update():void {
			super.update();
			FlxG.collide();	// everything will collide
		}
		
		
	}
}