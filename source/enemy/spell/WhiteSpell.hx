package enemy.spell;

/**
 * ...
 * @author 
 */
class WhiteSpell extends Spell
{
	public function new(s:Character) 
	{
		super(s);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.color = 0xdedede;
	}
	override public function Move(e:Float) 
	{
		if (IsBlockCenter())
		{
			if (!IdousakiChk(Target.muki, Target.x, Target.y))
			{
				Target.kill();
			}
		}
		super.Move(e);
	}
}