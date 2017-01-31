package enemy.slime;
import enemy.spell.Spell;
import enemy.spell.WhiteSpell;
import enums.CharacterSyu;
import typedefs.TsuikaEnemyTable;

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
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
	override public function SpellDasu():Void 
	{
		super.SpellDasu();
		var s:TsuikaEnemyTable={syu:CharacterSyu.SpellSyu(WhiteSpell), x:Target.x, y:Target.y, m:Target.muki, wait:0};
		TsuikaEnemy.TsuikaEnemyTableSet(s);
	}
}