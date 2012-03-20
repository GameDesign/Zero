package
{
	import flash.display.PixelSnapping;
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source="data/music.mp3")] public static var SndMusic:Class;
		[Embed(source = "data/pause.png")] private static var ImgPause:Class;
		[Embed(source = "data/mainmenubuttonimage.png")] private static var MMButtonIMG:Class;
		
		public var board:Board;
		public var chef:Chef;
		public var zombies:FlxGroup;
		public var pauseIMG:Pause;
		
		public var pauseButton:FlxButton;
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
			pauseIMG = new Pause();
			zombies = new FlxGroup();
			pause = new FlxGroup();
			
			mainMenuButton = new FlxButton(5, 5, "", goToMain);
			mainMenuButton.loadGraphic(MMButtonIMG, false, false);
			add(mainMenuButton);
			
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
			
			FlxG.mouse.show();
			// play BGM
			FlxG.play(SndMusic);
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
				super.update();
			}
			else
			{
				pause.update();
			}
			
			if (FlxG.keys.justPressed("ESCAPE") || FlxG.keys.justPressed("P"))
			{
				pauseGame();
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