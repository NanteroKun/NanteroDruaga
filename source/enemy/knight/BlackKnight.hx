package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class BlackKnight extends Knight
{
	public function new(s:Character) 
	{
		sword = new Sword();
		shield = new FlxSprite();
		super(s);
		s.speed = 0.5;
		s.hitpoint = 48;
		recovery1 = 48;
		recovery2 = 21;
		s.getscore = 1000;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/blackknight/BlackKnight.png", true, 16, 16);
		sword.loadGraphic("assets/images/enemy/knight/blackknight/BlackKnightSword.png", true, 32, 32);
		shield.loadGraphic("assets/images/enemy/knight/blackknight/BlackKnightShield.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
}