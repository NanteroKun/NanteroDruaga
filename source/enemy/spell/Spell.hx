package enemy.spell;

/**
 * ...
 * @author 
 */
class Spell extends CharacterMovePattern
{
	public function new(s:Enemy)                  
	{
		super(s);
		s.speed = 4;
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.loadGraphic("assets/images/spell/spell.png", true, 16, 16);
		s.animation.add("0", [0, 1], 30, true);
		s.animation.add("1", [6, 7], 30, true);
		s.animation.add("2", [4, 5], 30, true);
		s.animation.add("3", [2, 3], 30, true);
		s.animation.play(Std.string(s.muki));
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
		switch (s.muki)
		{
			case 0:s.y -= s.speed;
			case 1:s.x += s.speed;
			case 2:s.y += s.speed;
			case 3:s.x -= s.speed;
		}
	}
}