package enemy.slime;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class BlueSlime extends Slime
{
	public function new(s:Character) 
	{
		super(s);
		waitbase = 127;
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/slime/blueslime.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
	override public function SpellDasu():Void 
	{
		super.SpellDasu();
		TsuikaEnemy.TsuikaEnemyTableSet(CharacterSyu.BlueSpell, Target.x, Target.y, Target.muki);
	}
}