package enemy.spell;
import enums.CharacterSyu.Muki;

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
		Target.animation.add(Std.string(Muki.ue), [0, 1], 30, true);
		Target.animation.add(Std.string(Muki.migi), [6, 7], 30, true);
		Target.animation.add(Std.string(Muki.shita), [4, 5], 30, true);
		Target.animation.add(Std.string(Muki.hidari), [2, 3], 30, true);
		Target.animation.play(Std.string(Target.muki));
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
	override public function nisedraw() 
	{
		if (firstframe && !IsBlockCenter())
		{
			firstframe = false;
		}
		if (!firstframe)
		{
			super.nisedraw();
		}
	}
	
}