package enemy.slime;
import enums.EnemySyu;

/**
 * ...
 * @author 
 */
class BlueSlime extends Slime
{
	public function new(s:Enemy) 
	{
		super(s);
		waitbase = 127;
	}
	override public function GraphicSet(s:Enemy) 
	{
		s.loadGraphic("assets/images/enemy/slime/blueslime.png", true, 16, 16);
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
	override public function SpellDasu(s:Enemy):Void 
	{
		super.SpellDasu(s);
		TsuikaEnemy.TsuikaEnemyTableSet(EnemySyu.BlueSpell, s.x, s.y, s.muki);
	}
}