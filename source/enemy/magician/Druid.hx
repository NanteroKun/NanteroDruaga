package enemy.magician;

/**
 * ...
 * @author 
 */
class Druid extends Magician
{
	public function new(s:Character) 
	{
		super(s);
		dasuspell = CharacterSyu.SpellSyu(BlueSpell);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/magician/Druid.png", true, 16, 16);
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