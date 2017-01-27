package enemy.slime;
import enemy.spell.Spell;
import enemy.spell.WhiteSpell;
import enums.EnemySyu;

/**
 * ...
 * @author 
 */
class RedSlime extends Slime
{
	public function new(s:Enemy) 
	{
		super(s);
		waitbase = 127;
	}
	override public function GraphicSet(s:Enemy) 
	{
		s.loadGraphic("assets/images/enemy/slime/redslime.png", true, 16, 16);
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
	override public function SpellDasu(s:Enemy):Void 
	{
		super.SpellDasu(s);
		TsuikaEnemy.TsuikaEnemyTableSet(EnemySyu.WhiteSpell, s.x, s.y, s.muki);
	}
}