package enemy.knight;
import enemy.roper.Roper;

/**
 * ...
 * @author 
 */
class Knight extends Roper
{
	public function new(s:Character) 
	{
		super(s);
		Target.muki = 2;
		Target.setPosition(Reg.XposSet(), Reg.YposSet());
	}
	override function GraphicSet()
	{
		super.GraphicSet();
	}
	override public function Move()
	{
		super.Move();
	}
}