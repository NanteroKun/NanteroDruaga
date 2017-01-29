package enemy.slime;
import enemy.spell.Spell;
import enemy.spell.WhiteSpell;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class RedSlime extends Slime
{
	public function new(s:Character) 
	{
		super(s);
		waitbase = 127;
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/slime/redslime.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
	override public function SpellDasu():Void 
	{
		super.SpellDasu();
		TsuikaEnemy.TsuikaEnemyTableSet(CharacterSyu.EnemySyu(WhiteSpell), Target.x, Target.y, Target.muki,0);
	}
}