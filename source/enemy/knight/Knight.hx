package enemy.knight;

/**
 * ...
 * @author 
 */
class Knight extends CharacterMovePattern
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
		if ((Target.x - 20) % 24 == 0 && ((Target.y - 36) % 24 == 0))
        {
			RoperTypeMove();
		}	
	}
}