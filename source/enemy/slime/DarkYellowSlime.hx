package enemy.slime;
import enums.EnemySyu;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class DarkYellowSlime extends Slime
{
	public function new(s:Enemy) 
	{
		super(s);
		waitbase = 31;
	}
	override public function GraphicSet(s:Enemy) 
	{
		s.loadGraphic("assets/images/enemy/slime/darkyellowslime.png", true, 16, 16);
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
	override public function SpellDasu(s:Enemy):Void 
	{
		super.SpellDasu(s);
		var syuu:EnemySyu = EnemySyu.No;
		var k:Int = FlxG.random.int(0, 4);
		k = 2;
		switch (k)
		{
			case 0:syuu = EnemySyu.WhiteSpell;
			case 1:syuu = EnemySyu.BlueSpell;
			case 2:syuu = EnemySyu.RedSpell;
			case 3:syuu = EnemySyu.GreenSpell;
		}
		TsuikaEnemy.TsuikaEnemyTableSet(syuu, s.x, s.y, s.muki);
	}
}