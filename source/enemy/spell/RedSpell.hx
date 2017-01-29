package enemy.spell;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class RedSpell extends Spell
{
	private var firstframe:Bool;
	public function new(s:Character) 
	{
		super(s);
		firstframe = true;
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
		firstframe = false;
		super.Move();
	}
	private function element():Void
	{
		TsuikaEnemy.TsuikaEnemyTableSet(CharacterSyu.EnemySyu(FireElement), Target.x, Target.y, Target.muki,0);
		Target.kill();
	}
}