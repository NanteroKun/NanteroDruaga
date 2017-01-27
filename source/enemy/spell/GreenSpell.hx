package enemy.spell;

/**
 * ...
 * @author 
 */
class GreenSpell extends Spell
{
	public function new(s:Enemy) 
	{
		super(s);
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.color = 0x00de00;
	}
	override public function Move(s:Enemy) 
	{
		if (s.x<=20|| s.x >= 428||s.y<=36||s.y>=228)
		{
			s.kill();
		}
		super.Move(s);
	}
}