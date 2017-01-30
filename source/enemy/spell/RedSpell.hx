package enemy.spell;
import enums.CharacterSyu;
import typedefs.TsuikaEnemyTable;

/**
 * ...
 * @author 
 */
class RedSpell extends Spell
{
	public function new(s:Character) 
	{
		super(s);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.color = 0xde0000;
	}
	override public function Move() 
	{
		if ((Target.x - 20) % 24 == 0 && (Target.y - 36) % 24 == 0 )
		{
			if (!IdousakiChk(Target.muki, Target.x, Target.y)) 
			{
				element();
			}
			if (!firstframe)
			{
				if (IdousakiChk(Reg.MigiTurn(Target.muki), Target.x, Target.y)
				||IdousakiChk(Reg.HidariTurn(Target.muki),Target.x,Target.y))
				{
					element();
				}
			}
		}
		super.Move();
	}
	private function element():Void
	{
		var s:TsuikaEnemyTable={syu:CharacterSyu.SpellSyu(FireElement), x:Target.x, y:Target.y, m:Target.muki, wait:0};
		TsuikaEnemy.TsuikaEnemyTableSet(s);
		Target.kill();
	}
}