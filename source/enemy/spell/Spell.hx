package enemy.spell;

/**
 * ...
 * @author 
 */
class Spell extends CharacterMovePattern
{
	public function new(s:Character)                  
	{
		super(s);
		s.speed = 4;
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.loadGraphic("assets/images/spell/spell.png", true, 16, 16);
		Target.animation.add("0", [0, 1], 30, true);
		Target.animation.add("1", [6, 7], 30, true);
		Target.animation.add("2", [4, 5], 30, true);
		Target.animation.add("3", [2, 3], 30, true);
		Target.animation.play(Std.string(Target.muki));
	}
	override public function Move() 
	{
		super.Move();
	}
}