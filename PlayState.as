package
{
	import flash.display.PixelSnapping;
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source="data/music.mp3")] public static var SndMusic:Class;
		[Embed(source="data/home.png")] private static var ImgHome:Class;
		[Embed(source="data/pause.png")] private static var ImgPause:Class;
		
		public var board:Board;
		public var chef:Chef;
		public var zombies:FlxGroup;
		public var dishs:FlxGroup;
		
		public var scoreText:FlxText;
		public var score:int;
		
		public var pauseIMG:Pause;
		public var pause:FlxGroup;
		
		public var dishButton:FlxButton;
		
		// the amount of time played - used for spawning zombies
		public var elapsedTime:Number;
		// the time to wait until next spawn
		public var spawnTime:Number;
		public const TIME_SEED:int = 12;
		
		override public function create():void
		{
			elapsedTime = 0;
			spawnTime = 5;
			score = 0;	// For Now - will need to do reading in in the future
			
			board = new Board();
			chef = new Chef();
			pauseIMG = new Pause();
			zombies = new FlxGroup();
			pause = new FlxGroup();
			dishs = new FlxGroup();
			
			// Home button
			add(new FlxButton(0, 0, "", goToMain).loadGraphic(ImgHome, true, false, 30, 30));
			// Pause button
			add(new FlxButton(FlxG.width - 30, 0, null, pauseGame).loadGraphic(ImgPause, true, false, 30, 30));
			
			scoreText = new FlxText(0, 10, FlxG.width, "$" + score.toString());
			scoreText.alignment = "center";
			add(scoreText);
			
			//dishButton = new FlxButton(100, 5, "Dish", throwDish);
			//add(dishButton);
			
			// start with first zombie
			zombies.add(new Zombie());
			// add all objects to the game
			add(dishs);
			add(zombies);
			add(chef);
			
			// because tiles is a FlxGroup it can be used to add all the tiles to the game
			add(board.tiles);
			
			// this would need to be called after swaps and and replacing tiles
			//zboard.match();
			board.checkBoard();
			//while (board.checkBoard()){}
			
			FlxG.mouse.show();
			// play BGM
			//FlxG.play(SndMusic);
			FlxG.flash(0xFF000000, 1);
		}
		
		public function pauseGame():void
		{
			if (!FlxG.paused)
			{
				FlxG.paused = true;
				add(pauseIMG);
				pause.revive();
			}
			else
			{
				FlxG.paused = false;
				remove(pauseIMG);
				pause.alive = false;
				pause.exists = false;
			}
		}
		
		override public function update():void
		{
			if (!FlxG.paused)
			{
				scoreText.text = "$" + score.toString();
				super.update();
			}
			else
			{
				pause.update();
			}
			
			if (FlxG.keys.justPressed("P"))
			{
				pauseGame();
			}
			
			// check collisions
			FlxG.collide(zombies, chef, gameOver);
			FlxG.collide(dishs, zombies, hitZombieWithDish);
			// if enough time has passed, spawn new zombie
			elapsedTime += FlxG.elapsed;
			if (elapsedTime >= spawnTime)
			{
				zombies.add(new Zombie());
				add(zombies);
				// reset timer
				elapsedTime = 0;
				spawnTime = FlxG.random() * TIME_SEED;
			}
			
			if (board.checkBowl() > -1)
			{
				// do animation and throw dish if chain is made
				Chef.chopping = true;
				score += 5;	//TEST - might want somewhere else, want to handle bonuses
				throwDish();
			}
				
			
			board.getScore();//use this score to update the actual score at the top of the screen.
			
		}
		
		public function gameOver(Object1:FlxObject, Object2:FlxObject):void
		{
			//FlxG.switchState(new Shop());
		}
		
		public function goToMain():void
		{
			FlxG.switchState(new MenuState());
		}
		
		public function throwDish():void
		{
			dishs.add(new Dish());
		}
		
		public function hitZombieWithDish(Object1:FlxObject, Object2:FlxObject):void
		{
			Object1.kill();
			Object2.kill();
		}
	}
}