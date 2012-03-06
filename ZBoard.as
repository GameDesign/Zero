package  
{
	import org.flixel.*;
	
	public class ZBoard
	{
		public var columns:int;
		public var rows:int;
		public var tiles:FlxGroup;
		
		public function ZBoard() 
		{
			columns = 7;
			rows = 7;
			tiles = new FlxGroup();
			
			var n:int = columns;
			for (var i:int = 0; i < n; i++)
			{
				var m:int = rows;
				for (var j:int = 0; j < m; j++)
				{
					// generates random tiles and places them
					var random:int = Math.random() * 6;
					var tile:Tile = new Tile(random);
					
					tile.y = (tile.height + 2) * i;
					tile.x = (tile.width + 2) * j;
					tiles.add(tile);
				}
			}
		}
		
		public function tileAt(column:int, row:int):Tile
		{
			/*
			 members is a one dimensional array within the FlxGroup
			 to find a tile at (3,3) would be at index 24 in the array
			 (0,0) is 0 and (6,6) is 48
			 */
			return tiles.members[(row + 1) * rows - (columns - (column))];
		}
		
		public function match():void
		{
			var n:int = columns;
			for (var i:int = 0; i < n; i++)
			{
				var m:int = rows;
				for (var j:int = 0; j < m; j++)
				{
					// There has to be a cleaner was to do this!
					
					/*
					 checks the three tiles horizontally and vertically
					 to see if they have the same type and if they do
					 sets their transparency to 50%
					 */
					var horizontal1:Tile = tileAt(i, j);
					if (i + 1 < columns)
						var horizontal2:Tile = tileAt(i + 1, j);
					else
						var horizontal2:Tile = null;
					if (i + 2 < columns)
						var horizontal3:Tile = tileAt(i + 2, j);
					else
						var horizontal3:Tile = null;
					
					var vertical1:Tile = tileAt(i, j);
					if (j + 1 < rows)
						var vertical2:Tile = tileAt(i, j + 1);
					else
						var vertical2:Tile = null;
					if (j + 2 < rows)
						var vertical3:Tile = tileAt(i, j + 2);
					else
						var vertical3:Tile = null;
					
					FlxG.log(i + ", " + j);
					
					if (horizontal1 && horizontal2 && horizontal3)
					{
						FlxG.log(horizontal1.tileType + ", " + horizontal2.tileType + ", " + horizontal3.tileType);
						if (horizontal1.tileType == horizontal2.tileType && horizontal2.tileType == horizontal3.tileType)
						{
							FlxG.log("Horizontal Match");
							horizontal1.alpha = 0.5;
							horizontal2.alpha = 0.5;
							horizontal3.alpha = 0.5;
						}
					}
					
					if (vertical1 && vertical2 && vertical3)
					{
						FlxG.log(vertical1.tileType + ", " + vertical2.tileType + ", " + vertical3.tileType);
						if (vertical1.tileType == vertical2.tileType && vertical2.tileType == vertical3.tileType)
						{
							FlxG.log("Vertical Match");
							vertical1.alpha = 0.5;
							vertical2.alpha = 0.5;
							vertical3.alpha = 0.5;
						}
					}
				}
			}
		}
	}
}