package enemy.slime;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class DarkGreenSlime extends Slime
{
	public function new(s:Character) 
	{
		super(s);
		waitbase = 31;
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/slime/darkgreenslime.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
	override public function SpellDasu():Void 
	{
		super.SpellDasu();
		TsuikaEnemy.TsuikaEnemyTableSet(CharacterSyu.GreenSpell, Target.x, Target.y, Target.muki);
	}
}