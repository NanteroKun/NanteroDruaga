package enemy.ghost;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class MageGhost extends Ghost
{
	public function new(s:Character) 
	{
		super(s);
		dasuspell = CharacterSyu.SpellSyu(WhiteSpell);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/gohst/MageGohst.png", true, 16, 16);
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