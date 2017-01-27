package enemy.knight;

/**
 * ...
 * @author 
 */
class Knight extends CharacterMovePattern
{

	public function new(s:Enemy) 
	{
		super(s);
		s.muki = 2;
		s.setPosition(Reg.XposSet(), Reg.YposSet());
	}
	override function GraphicSet(s:Enemy)
	{
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy)
	{
		super.Move(s);
		if ((s.x - 20) % 24 == 0 && ((s.y - 36) % 24 == 0))
        {
			RoperTypeMove(s);
		}	
		switch (s.muki)
		{
			case 0:s.y -= s.speed;
			case 1:s.x += s.speed;
			case 2:s.y += s.speed;
			case 3:s.x -= s.speed;
			default:trace(s.muki);
		}
	}
}