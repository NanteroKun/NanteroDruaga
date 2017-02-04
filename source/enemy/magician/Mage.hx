package enemy.magician;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class Mage extends Magician
{
	public function new(s:Character) 
	{
		super(s);
		dasuspell = CharacterSyu.SpellSyu(WhiteSpell);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/magician/Mage.png", true, 16, 16);
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