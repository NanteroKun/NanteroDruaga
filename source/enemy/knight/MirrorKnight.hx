package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class MirrorKnight extends Knight
{
	public function new(s:Character) 
	{
		sword = new Sword();
		shield = new FlxSprite();
		super(s);
		s.speed = Reg.GilPos.speed;
		s.hitpoint = 48;
		recovery1 = 48;
		recovery2 = 21;
		s.getscore = 2000;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/mirrorknight/MirrorKnight.png", true, 16, 16);
		for (i in 0...8)
		{
			Target.animation.add(Std.string(i), [i]);
		}
		sword.loadGraphic("assets/images/enemy/knight/mirrorknight/MirrorKnightSword.png", true, 32, 32);
		for (i in 0...45)
		{
			sword.animation.add(Std.string(i), [i]);
		}
		shield.loadGraphic("assets/images/enemy/knight/mirrorknight/MirrorKnightShield.png", true, 16, 16);
		for (i in 0...12)
		{
			shield.animation.add(Std.string(i), [i]);
		}
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
}