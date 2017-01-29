package enemy.spell;

/**
 * ...
 * @author 
 */
class Spell extends CharacterMovePattern
{
	public var firstframe:Bool;
	public function new(s:Character)                  
	{
		super(s);
		Target.speed = 4;
		firstframe = true;
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
	override public function nisedraw() 
	{
		if (firstframe)
		{
			firstframe = false;
		}
		else
		{
			super.nisedraw();
		}
	}
	
}