package  
{
	import org.flixel.*;
	
	public class Board
	{
		private var board:Array = new Array(9);
		private var doneBoard:Array = new Array(9);
		private var tempBoard:Array = new Array(9);
		
		private var matches:int = 0;
		
		public function Board() 
		{
			//Initialize the game board, done board, and temp board
			for (var row:int = 0; row < 9; row++)
			{
				//Create the second dimentions for each array
				board[row] = new Array(9);
				doneBoard[row] = new Array(9);
				tempBoard[row] = new Array(9);
				
				//Initialize each array
				for (var col:int = 0; col < 9; col++)
				{
					board[row][col] = -1;
					doneBoard[row][col] = 0;
					tempBoard[row][col] = 0;
				}
			}
			AddTiles();
		}
		
		private function AddTiles():void
		{
			//Randomly adds tiles to board, leaving a border of -1
			for (var row:int = 1; row < 8; row++)
			{
				for (var col:int = 1; col < 8; col++)
				{
					var random:int = Math.random() * 6;
					board[row][col] = Math.round(random);
				}
			}
			
		}
		
		public function GetTile(row:int, col:int):int
		{
			//returns +1 because there is a border of -1
			return board[row+1][col+1];
		}
		
		public function GetDoneTile(row:int, col:int):int
		{
			return doneBoard[row+1][col+1];
		}
		
		public function checkBoard():void
		{
			for (var row:int = 1; row < 8; row++)
			{
				for (var col:int = 1; col < 8; col++)
				{
					if(doneBoard[row][col]==0)
						checkSpot(row, col);
				}
			}
		}
		
		private function checkSpot(row:int, col:int):void
		{
			clearBoard(tempBoard);
			
			matches = 0;
			var type:int = board[row][col];
			
			checkChain(row, col, type);
			
			if (matches > 1)
			{
				copyTempBoard();
			}
		}
		
		private function checkChain(row:int, col:int, type:int):void
		{
			if (tempBoard[row][col] == 1)
				return;
				
			tempBoard[row][col] = 1;
			matches += 1;
			
			if (type == board[row - 1][col])// || 0 == board[row - 1][col])
				checkChain(row - 1, col, type);
			if (type == board[row][col - 1])// || 0 == board[row][col - 1])
				checkChain(row, col - 1, type);
			if (type == board[row + 1][col])// || 0 == board[row + 1][col])
				checkChain(row + 1, col, type);
			if (type == board[row][col + 1])// || 0 == board[row][col + 1])
				checkChain(row, col + 1, type);
		}
		
		private function copyTempBoard():void
		{
			for (var row:int = 1; row < 8; row++)
				for (var col:int = 1; col < 8; col++)
					if (tempBoard[row][col] > 0)
						doneBoard[row][col] = board[row][col];
		}
		
		private function clearBoard(clearBoard:Array):void
		{
			for (var row:int = 1; row < 8; row++)
				for (var col:int = 1; col < 8; col++)
					clearBoard[row][col] = 0;
		}
		
		
	}

}