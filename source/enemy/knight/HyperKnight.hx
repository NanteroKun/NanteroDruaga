package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class HyperKnight extends Knight
{
	public function new(s:Character) 
	{
		sword = new Sword();
		shield = new FlxSprite();
		super(s);
		s.speed = 0.5;
		s.hitpoint = 96;
		recovery1 = 96;
		recovery2 = 42;
		s.getscore = 300;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/hyperknight/HyperKnight.png", true, 16, 16);
		sword.loadGraphic("assets/images/enemy/knight/hyperknight/HyperKnightSword.png", true, 32, 32);
		shield.loadGraphic("assets/images/enemy/knight/hyperknight/HyperKnightShield.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
}