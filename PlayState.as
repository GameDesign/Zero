package {
	import org.flixel.*;

	public class PlayState extends FlxState {
	
		public var chef:Chef;
		public var zombies:FlxGroup;
		public var board:Board;
		
		public var tileBoard:Array = new Array(7);
		
		override public function create():void
		{
			chef = new Chef();
			zombies = new FlxGroup();
			board = new Board();
			
			for (var z:int = 0; z < 3; z++)
			{
				zombies.add(new Zombie());
			}
				
			add(zombies);
			add(chef);
			
			// Creates the 7 x 7 grid of tiles
			var n:int = 7;
			for (var i:int = 0; i < n; i++)
			{
				tileBoard[i] = new Array(7);
				var m:int = 7;
				for (var j:int = 0; j < m; j++)
				{
					var type:int = board.GetTile(i, j);
					var tile:Tile = new Tile(type);
					tile.y = 44 * i + 2 * i;
					tile.x = 44 * j + 2 * j;
					add(tile);
					tileBoard[i][j] = tile;
				}
			}
			
			board.checkBoard();
			
			for (var row:int = 0; row < 7; row++)
				for (var col:int = 0; col < 7; col++)
				{
					if (board.GetDoneTile(row, col) > 0)
					{
						tileBoard[row][col].kill();
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
			//FlxG.switchState(new Shop());
		}
	}
}