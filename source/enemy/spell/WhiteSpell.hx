package enemy.spell;

/**
 * ...
 * @author 
 */
class WhiteSpell extends Spell
{
	public function new(s:Enemy) 
	{
		super(s);
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.color = 0xdedede;
	}
	override public function Move(s:Enemy) 
	{
		if ((s.x - 20) % 24 == 0 && (s.y - 36) % 24 == 0 )
		{
			if (!IdousakiChk(s.muki, s.x, s.y))
			{
				s.kill();
			}
		}
		super.Move(s);
	}
}