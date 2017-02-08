package enemy.ghost;
import enums.CharacterSyu.SpellSyu;

/**
 * ...
 * @author 
 */
class WizardGohst extends Ghost
{
	public function new(s:Character) 
	{
		super(s);
		dasuspell = CharacterSyu.SpellSyu(GreenSpell);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/gohst/WizardGohst.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
	override public function nisedraw() 
	{
		super.nisedraw();
	}
}