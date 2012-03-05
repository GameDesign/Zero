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
					doneBoard[row][col] = -1;
					tempBoard[row][col] = -1;
				}
			}
			AddTiles();
		}
		
		/**
		 * Function to randomly add values into the board 2d array.
		 */
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
		
		/**
		 * Returns the value of the position on the board
		 * @param	row
		 * @param	col
		 * @return
		 */
		public function GetTile(row:int, col:int):int
		{
			//returns +1 because there is a border of -1
			return board[row+1][col+1];
		}
		
		/**
		 * The done board is used to determine which pieces are within chains.
		 * Calling this function returns the value within the done board.
		 * @param	row
		 * @param	col
		 * @return
		 */
		public function GetDoneTile(row:int, col:int):int
		{
			return doneBoard[row+1][col+1];
		}
		
		/**
		 * Function which initiates the board checking. This function will
		 * go through every location on the board. The result of this function will
		 * be in the doneBoard. For every tile on the board which is in a chain, the done
		 * board will hold that value
		 * 
		 * Example
		 * Regular Board:		doneBoard:
		 * -1 -1 -1 -1 -1		-1 -1 -1 -1 -1
		 * -1  5  1  2 -1		-1  5 -1 -1 -1
		 * -1  5  3  4 -1		-1  5 -1 -1 -1
		 * -1  5  5  2 -1		-1  5  5 -1 -1
		 * -1 -1 -1 -1 -1		-1 -1 -1 -1 -1
		 */
		public function checkBoard():void
		{
			for (var row:int = 1; row < 8; row++)
			{
				for (var col:int = 1; col < 8; col++)
				{
					if(doneBoard[row][col]==-1)
						checkSpot(row, col);
				}
			}
		}
		
		/**
		 * Given a location within the board, this function will initiate
		 * the temp board and match count, then check for chains. Once the chain
		 * checking is complete, if the match count is high enough, the results are
		 * kept.
		 * @param	row
		 * @param	col
		 */
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
		
		/**
		 * This function recursively checks if the values around it match, and
		 * counts the number of touching tiles in a chain.
		 * @param	row
		 * @param	col
		 * @param	type
		 */
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
		
		/**
		 * This function is used to copy long enough matches to the doneBoard.
		 */
		private function copyTempBoard():void
		{
			for (var row:int = 1; row < 8; row++)
				for (var col:int = 1; col < 8; col++)
					if (tempBoard[row][col] >= 0)
						doneBoard[row][col] = board[row][col];
		}
		
		/**
		 * This function will clear a board to all values of -1.
		 * @param	clearBoard
		 */
		private function clearBoard(clearBoard:Array):void
		{
			for (var row:int = 1; row < 8; row++)
				for (var col:int = 1; col < 8; col++)
					clearBoard[row][col] = -1;
		}
		
		
	}

}