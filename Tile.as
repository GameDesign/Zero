package
{
	import org.flixel.*;
	
	public class Tile extends FlxButton
	{
		[Embed(source = "data/bullet.png" )] private static var ImgBullet:Class;
		[Embed(source = "data/brain.png"  )] private static var ImgBrain:Class;
		[Embed(source = "data/foot.png"   )] private static var ImgFoot:Class;
		[Embed(source = "data/hand.png"   )] private static var ImgHand:Class;
		[Embed(source = "data/heart.png"  )] private static var ImgHeart:Class;
		[Embed(source = "data/stomach.png")] private static var ImgStomach:Class;
		
		public function Tile()
		{
			super();
			
			var random:int = Math.random() * 6 + 1;
			
			switch (random)
			{
				case 1:
				{
					loadGraphic(ImgBullet);
					break;
				}
				case 2:
				{
					loadGraphic(ImgBrain);
					break;
				}
				case 3:
				{
					loadGraphic(ImgFoot);
					break;
				}
				case 4:
				{
					loadGraphic(ImgHand);
					break;
				}
				case 5:
				{
					loadGraphic(ImgHeart);
					break;
				}
				case 6:
				{
					loadGraphic(ImgStomach);
					break;
				}
				default:
				{
					break;
				}
			}
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}