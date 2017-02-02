package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class BlueKnight extends Knight
{
	public function new(s:Character) 
	{
		sword = new Sword();
		shield = new FlxSprite();
		super(s);
		s.speed = 0.5;
		s.hitpoint = 24;
		recovery1 = 24;
		recovery2 = 9;
		s.getscore = 1000;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/blueknight/BlueKnight.png", true, 16, 16);
		sword.loadGraphic("assets/images/enemy/knight/blueknight/BlueKnightSword.png", true, 32, 32);
		shield.loadGraphic("assets/images/enemy/knight/blueknight/BlueKnightShield.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
}