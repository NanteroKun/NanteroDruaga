package enemy.slime;
import enums.CharacterSyu;
import typedefs.TsuikaEnemyTable;

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
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
	override public function SpellDasu():Void 
	{
		super.SpellDasu();
		var s:TsuikaEnemyTable={syu:CharacterSyu.SpellSyu(GreenSpell), x:Target.x, y:Target.y, m:Target.muki, wait:0};
		TsuikaEnemy.TsuikaEnemyTableSet(s);
	}
}