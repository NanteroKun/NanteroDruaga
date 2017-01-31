package enemy.spell;

/**
 * ...
 * @author 
 */
class GreenSpell extends Spell
{
	public function new(s:Character) 
	{
		super(s);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.color = 0x00de00;
	}
	override public function Move(e:Float) 
	{
		if (Target.x<=20|| Target.x >= 428||Target.y<=36||Target.y>=228)
		{
			Target.kill();
		}
		super.Move(e);
	}
}