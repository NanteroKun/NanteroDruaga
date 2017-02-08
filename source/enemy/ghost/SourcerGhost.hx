package enemy.ghost;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class SourcerGhost extends Ghost
{
	public function new(s:Character) 
	{
		super(s);
		dasuspell = CharacterSyu.SpellSyu(RedSpell);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/gohst/SorcerrorGohst.png", true, 16, 16);
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