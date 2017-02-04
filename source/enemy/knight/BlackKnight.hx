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
		Target.speed = 0.5;
		Target.hitpoint = 48;
		Target.getscore = 1000;
		recovery1 = 48;
		recovery2 = 21;
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