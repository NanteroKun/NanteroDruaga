package enemy.slime;
import enums.EnemySyu;

/**
 * ...
 * @author 
 */
class DarkGreenSlime extends Slime
{
	public function new(s:Enemy) 
	{
		super(s);
		waitbase = 31;
	}
	override public function GraphicSet(s:Enemy) 
	{
		s.loadGraphic("assets/images/enemy/slime/darkgreenslime.png", true, 16, 16);
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
	override public function SpellDasu(s:Enemy):Void 
	{
		super.SpellDasu(s);
		TsuikaEnemy.TsuikaEnemyTableSet(EnemySyu.GreenSpell, s.x, s.y, s.muki);
	}
}