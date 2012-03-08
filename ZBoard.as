package  
{
	import org.flixel.*;
	
	public class ZBoard
	{
		public var columns:int;
		public var rows:int;
		public var tiles:FlxGroup;
		public var toggle:ZTile;
		
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
					var tile:ZTile = new ZTile(this);
					
					tile.y = (tile.height + 2) * i;
					tile.x = (tile.width + 2) * j;
					tiles.add(tile);
				}
			}
		}
		
		public function swap(tile:ZTile):void
		{
			if (!toggle)
				return;
			
			// temp tile didn't work
			var x:int = toggle.x;
			var y:int = toggle.y;
			
			var n:int = rows;
			for (var i:int = 0; i < n; i++)
			{
				var string:String = "";
				var m:int = columns;
				for (var j:int = 0; j < m; j++)
				{
					string += tileAt(j, i).type;
				}
				FlxG.log(string);
			}
			
			FlxG.log("-------");
			
			FlxG.log(tiles.members.indexOf(toggle) + " < " + tiles.members.indexOf(tile));
			
			// Works because replace the Tile that appears later in the array first
			if (tiles.members.indexOf(toggle) < tiles.members.indexOf(tile))
			{
				tiles.replace(tile, toggle);
				tiles.replace(toggle, tile);
			}
			else
			{
				tiles.replace(toggle, tile);
				tiles.replace(tile, toggle);
			}
			
			FlxG.log("-------");
			
			var n:int = rows;
			for (var i:int = 0; i < n; i++)
			{
				var string:String = "";
				var m:int = columns;
				for (var j:int = 0; j < m; j++)
				{
					string += tileAt(j, i).type;
				}
				FlxG.log(string);
			}
			
			toggle.x = tile.x;
			toggle.y = tile.y;
			
			tile.x = x;
			tile.y = y;
			
			match();
			
			toggle = null;
		}
		
		public function tileAt(column:int, row:int):ZTile
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
					var horizontal1:ZTile = tileAt(i, j);
					if (i + 1 < columns)
						var horizontal2:ZTile = tileAt(i + 1, j);
					else
						var horizontal2:ZTile = null;
					if (i + 2 < columns)
						var horizontal3:ZTile = tileAt(i + 2, j);
					else
						var horizontal3:ZTile = null;
					
					var vertical1:ZTile = tileAt(i, j);
					if (j + 1 < rows)
						var vertical2:ZTile = tileAt(i, j + 1);
					else
						var vertical2:ZTile = null;
					if (j + 2 < rows)
						var vertical3:ZTile = tileAt(i, j + 2);
					else
						var vertical3:ZTile = null;
					
					// FlxG.log(i + ", " + j);
					
					if (horizontal1 && horizontal2 && horizontal3)
					{
						// FlxG.log(horizontal1.type + ", " + horizontal2.type + ", " + horizontal3.type);
						if (horizontal1.type == horizontal2.type && horizontal2.type == horizontal3.type)
						{
							// FlxG.log("Horizontal Match");
//							horizontal1.alpha = 0.5;
//							horizontal2.alpha = 0.5;
//							horizontal3.alpha = 0.5;
							horizontal1.randomize();
							horizontal2.randomize();
							horizontal3.randomize();
						}
					}
					
					if (vertical1 && vertical2 && vertical3)
					{
						// FlxG.log(vertical1.type + ", " + vertical2.type + ", " + vertical3.type);
						if (vertical1.type == vertical2.type && vertical2.type == vertical3.type)
						{
							// FlxG.log("Vertical Match");
//							vertical1.alpha = 0.5;
//							vertical2.alpha = 0.5;
//							vertical3.alpha = 0.5;
							vertical1.randomize();
							vertical2.randomize();
							vertical3.randomize();
						}
					}
				}
			}
		}
	}
}