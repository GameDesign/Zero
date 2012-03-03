package {
	import org.flixel.*;

	public class PlayState extends FlxState {
	
		public var chef:Chef;
		public var zombies:FlxGroup;
		
		override public function create():void
		{
			chef = new Chef();
			zombies = new FlxGroup();
			
			for (var i:int = 0; i < 3;i++)
			{
				zombies.add(new Zombie());
			}
				
			add(zombies);
			add(chef);
			
			// Creates the 7 x 7 grid of tiles
			var n:int = 7;
			for (var i:int = 0; i < n; i++)
			{
				var m:int = 7;
				for (var j:int = 0; j < m; j++)
				{
					var tile:Tile = new Tile();
					tile.x = 44 * i + 2 * i;
					tile.y = 44 * j + 2 * j;
					add(tile);
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(zombies, chef, gameOver);
		}
		
		public function gameOver(Object1:FlxObject,Object2:FlxObject):void 
		{
			FlxG.switchState(new Shop());
		}
	}
}