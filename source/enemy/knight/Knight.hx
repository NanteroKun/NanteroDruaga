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
		if ((Target.x - 20) % 24 == 0 && ((Target.y - 36) % 24 == 0))
        {
			RoperTypeMove();//向き変更
		}	
		super.Move();
	}
}