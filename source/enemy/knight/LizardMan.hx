package enemy.knight;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class LizardMan extends Knight
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
		s.getscore = 200;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/lizardman/Lizardman.png", true, 16, 16);
		for (i in 0...8)
		{
			Target.animation.add(Std.string(i), [i]);
		}
		sword.loadGraphic("assets/images/enemy/knight/lizardman/LizardmanSword.png", true, 32, 32);
		for (i in 0...45)
		{
			sword.animation.add(Std.string(i), [i]);
		}
		shield.loadGraphic("assets/images/enemy/knight/lizardman/LizardmanShield.png", true, 16, 16);
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