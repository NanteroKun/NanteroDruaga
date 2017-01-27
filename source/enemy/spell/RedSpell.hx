package enemy.spell;
import enums.EnemySyu;

/**
 * ...
 * @author 
 */
class RedSpell extends Spell
{
	private var firstframe:Bool;
	public function new(s:Enemy) 
	{
		super(s);
		firstframe = true;
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.color = 0xde0000;
	}
	override public function Move(s:Enemy) 
	{
		if ((s.x - 20) % 24 == 0 && (s.y - 36) % 24 == 0 )
		{
			if (!IdousakiChk(s.muki, s.x, s.y)) 
			{
				element(s);
			}
			if (!firstframe)
			{
				if (IdousakiChk(Reg.MigiTurn(s.muki), s.x, s.y)||IdousakiChk(Reg.HidariTurn(s.muki),s.x,s.y))
				{
					element(s);
				}
			}
		}
		firstframe = false;
		super.Move(s);
	}
	private function element(s:Enemy):Void
	{
		s.kill();
		TsuikaEnemy.TsuikaEnemyTableSet(EnemySyu.FireElement, s.x, s.y, s.muki);
	}
}