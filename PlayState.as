package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	public class PlayState extends FlxState
	{
		[Embed(source="data/home.png")] private static var ImgHome:Class;
		[Embed(source="data/pause.png")] private static var ImgPause:Class;
		[Embed(source = "data/music.mp3")] private static var SndMusic:Class;
		[Embed(source = "data/invisChef.png")] private static var ImgChefButton:Class;
		[Embed(source = "data/bg.png")] private static var ImgBG:Class;		
		[Embed(source = "data/bulletCount.png")] private static var ImgBullet:Class;
		
		private static var COLUMNS:uint = 7;
		private static var ROWS:uint = 7;
		
		public var board:Board;
		public var chef:Chef;
		public var dishs:FlxGroup;
		public var pause:Pause;
		public var score:FlxText;
		public var bulletDisplay:FlxText;
		public var zombies:FlxGroup;
		public var timer:FlxDelay;
		public var zomebieSpawnDelay:int = 5000;	// time in MS for how long to delay zombie spawning	
		
		// the amount of time played - used for spawning zombies
		public var elapsedTime:Number;
		// speed to pass into zombie on construction
		public var zombieSpeedScalar:Number = 10;
		// counter for how many zombies have been brought it
		public var zombieCounter:int = 0;
		
		// the time to wait until next spawn
		public var spawnTime:Number;
		public const TIME_SEED:int = 12;
		
		override public function create():void
		{
			elapsedTime = 0;
			spawnTime = 5;
			
			// background image
			add(new FlxSprite(0, 0, null).loadGraphic(ImgBG, false, false, 320, 480));
			
			chef = new Chef();
			pause = new Pause();
			zombies = new FlxGroup();
			dishs = new FlxGroup();
						
			score = new FlxText(0, 0, FlxG.width);
			score.alignment = "center";
			score.shadow = 0xFF000000;
			score.size = 21;
			add(score);
			
			bulletDisplay = new FlxText(0, 458, FlxG.width);
			bulletDisplay.alignment = "right";
			bulletDisplay.size = 18;
			add(bulletDisplay);
			 
			// Home button
			add(new FlxButton(0, 0, "", goToMain).loadGraphic(ImgHome, true, false, 32, 32));
			// Pause button
			add(new FlxButton(FlxG.width - 30, 0, null, pauseGame).loadGraphic(ImgPause, true, false, 32, 32));
			// ammo counter image
			add(new FlxSprite(256, 458, ImgBullet));
			
			add(new FlxButton(FlxG.width - 91, FlxG.height - 131, null, throwDishChefClick).loadGraphic(ImgChefButton, false, false, 91, 91));
			// start with first zombie
			zombies.add(new Zombie(zombieSpeedScalar));
			// add all objects to the game
			add(dishs);
			add(zombies);
			add(chef);
			
			board = new Board(COLUMNS, ROWS);
			add(board);
			// this would need to be called after swaps and and replacing tiles
			board.checkBoard();
			
			// start timer for zombie spawn delay
			timer = new FlxDelay(zomebieSpawnDelay);
			timer.start();
			
			FlxG.flash(0xFF000000, 1);
			FlxG.mouse.show();
			FlxG.play(SndMusic);
		}
		
		public function pauseGame():void
		{
			if (!FlxG.paused)
			{
				FlxG.paused = true;
				
				add(pause);
				//super.update(); //in order for buttons to work
				pause.revive();
			}
			else
			{
				FlxG.paused = false;
				remove(pause);
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
			
			if (FlxG.keys.justPressed("P"))
			{
				pauseGame();
			}
			
			// check collisions
			FlxG.collide(zombies, chef, gameOver);
			FlxG.collide(dishs, zombies, hitZombieWithDish);
// if enough time has passed, spawn new zombie
//elapsedTime += FlxG.elapsed;			
//if (elapsedTime >= spawnTime)
			if (timer.hasExpired)
			{
				zombieSpeedScalar += 0.3;
				zombies.add(new Zombie(zombieSpeedScalar));
				add(zombies);
				zombieCounter++;
				// reset timer
				if (zombieCounter < 20)
					zomebieSpawnDelay = 5000;
				else if (zombieCounter < 30)
					zomebieSpawnDelay = 4500;
				else if (zombieCounter < 40)
					zomebieSpawnDelay = 4000;
				else if (zombieCounter < 50)
					zomebieSpawnDelay = 3500;
				else	
					zomebieSpawnDelay = 3000;
					
				FlxG.watch(this, "zombieCounter");
				timer.duration = zomebieSpawnDelay;
				timer.start();
/*
// reset timer
elapsedTime = 0;
spawnTime = FlxG.random() * TIME_SEED;
*/
			}
			
			
			if (board.checkBowl() > -1)
			{
				// do animation and throw dish if chain is made
				Chef.chopping = true;
				throwDish();
			}

			score.text = "$" + FlxG.score.toString(); //use this score to update the actual score at the top of the screen.
			if (board.getBullets() < 10)
				bulletDisplay.text = "x0" + board.getBullets().toString()
			else
				bulletDisplay.text = "x" + board.getBullets().toString()
		}
		
		public function gameOver(Object1:FlxObject, Object2:FlxObject):void
		{
			FlxG.switchState(new Death());
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
		
		public function throwDishChefClick()
		{
			if (board.getBullets() > 0)
			{
				throwDish();
				board.shootBullet();
			}
		}
	}
}