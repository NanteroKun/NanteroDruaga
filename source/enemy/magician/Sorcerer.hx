package enemy.magician;

/**
 * ...
 * @author 
 */
class Sorcerer extends Magician
{
	public function new(s:Character) 
	{
		super(s);
		dasuspell = CharacterSyu.SpellSyu(RedSpell);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/magician/Sorcerer.png", true, 16, 16);
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