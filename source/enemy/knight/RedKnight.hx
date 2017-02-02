package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class RedKnight extends Knight
{
	public function new(s:Character) 
	{
		sword = new Sword();
		shield = new FlxSprite();
		super(s);
		s.speed = 0.5;
		s.hitpoint = 144;
		recovery1 = 24;
		recovery2 = 9;
		s.getscore = 1200;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/redknight/RedKnight.png", true, 16, 16);
		sword.loadGraphic("assets/images/enemy/knight/redknight/RedKnightSword.png", true, 32, 32);
		shield.loadGraphic("assets/images/enemy/knight/redknight/RedKnightShield.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
}