package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source="data/music.mp3")] public static var SndMusic:Class;
		[Embed(source = "data/pause.png")] private static var ImgPause:Class;
		
		public var board:Board;
		public var chef:Chef;
		public var zombies:FlxGroup;
		
		public var pauseButton:FlxButton;
		public var pauseText:FlxText;
		public var pause:FlxGroup;
		
		public var mainMenuButton:FlxButton;
		
		// the amount of time played - used for spawning zombies
		public var elapsedTime:Number;
		// the time to wait until next spawn
		public var spawnTime:Number;
		public const TIME_SEED:int = 12;
		
		override public function create():void
		{
			elapsedTime = 0;
			spawnTime = 5;
			
			board = new Board();
			chef = new Chef();
			zombies = new FlxGroup();
			pause = new FlxGroup();
			
			mainMenuButton = new FlxButton(0, 0, "Main", goToMain);
			add(mainMenuButton);
			
			pauseText = new FlxText(0, FlxG.height/2, FlxG.width, "Paused!");
			pauseText.setFormat("Creeper Pixel", 60, 0xffffffff, "center");
			pauseButton = new FlxButton();
			pauseButton.loadGraphic(ImgPause, true, false, 16, 16);
			pauseButton.x = FlxG.width - pauseButton.width * 2;
			pauseButton.y = pauseButton.height / 2;
			pauseButton.onUp = pauseGame;
			add(pauseButton);
			
			// start with first zombie
			zombies.add(new Zombie());
			// add all objects to the game
			add(zombies);
			add(chef);
			
			// because tiles is a FlxGroup it can be used to add all the tiles to the game
			add(board.tiles);
			
			// this would need to be called after swaps and and replacing tiles
			//zboard.match();
			board.checkBoard();
			//while (board.checkBoard()){}
			
			// play BGM
			FlxG.play(SndMusic);
		}
		
		public function pauseGame():void
		{
			if (!FlxG.paused)
			{
				FlxG.paused = true;
				add(pauseText);
				pause.revive();
			}
			else
			{
				FlxG.paused = false;
				remove(pauseText);
				pause.alive = false;
				pause.exists = false;
			}
		}
		
		override public function update():void
		{
			if (!FlxG.paused)
			{
				super.update();
			}
			else
			{
				pause.update();
			}
			
			if (FlxG.keys.justPressed("ESCAPE") || FlxG.keys.justPressed("P"))
			{
				if (!FlxG.paused)
				{
					FlxG.paused = true;
					add(pauseText);
					pause.revive();
				}
				else
				{
					FlxG.paused = false;
					remove(pauseText);
					pause.alive = false;
					pause.exists = false;
				}
			}
			
			// check collisions
			FlxG.collide(zombies, chef, gameOver);
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
		}
		
		public function gameOver(Object1:FlxObject, Object2:FlxObject):void
		{
			//FlxG.switchState(new Shop());
		}
		
		public function goToMain()
		{
			FlxG.switchState(new MainMenu());
			super.update(); 
		}
	}
}