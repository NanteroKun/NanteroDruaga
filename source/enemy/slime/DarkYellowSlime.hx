package enemy.slime;
import enums.CharacterSyu;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class DarkYellowSlime extends Slime
{
	public function new(s:Character) 
	{
		super(s);
		waitbase = 31;
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/slime/darkyellowslime.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
	override public function SpellDasu():Void 
	{
		super.SpellDasu();
		var syuu:CharacterSyu = CharacterSyu.No;
		var k:Int = FlxG.random.int(0, 3);
		switch (k)
		{
			case 0:syuu = CharacterSyu.SpellSyu(WhiteSpell);
			case 1:syuu = CharacterSyu.SpellSyu(BlueSpell);
			case 2:syuu = CharacterSyu.SpellSyu(RedSpell);
			case 3:syuu = CharacterSyu.SpellSyu(GreenSpell);
		}
		TsuikaEnemy.TsuikaEnemyTableSet(syuu, Target.x, Target.y, Target.muki,0);
	}
}