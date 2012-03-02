package {
	import org.flixel.*;

	public class PlayState extends FlxState {
	
		public var chef:Chef;
		public var zombies:FlxGroup;
		
		override public function create():void {
			
			chef = new Chef();
			zombies = new FlxGroup();
			for (var i:int = 0; i < 3;i++)
				zombies.add(new Zombie());
				
			add(zombies);
			add(chef);
		}
		
		override public function update():void {
			super.update();
			FlxG.collide(zombies, chef, gameOver);	// everything will collide
		}
		
		public function gameOver(Object1:FlxObject,Object2:FlxObject):void 
		{
			FlxG.resetState();
		}
		
	}
}