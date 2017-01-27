package enemy.slime;

/**
 * ...
 * @author 
 */
class BlackSlime extends Slime
{
	public function new(s:Enemy) 
	{
		super(s);
		waitbase = 63;
	}
	override public function GraphicSet(s:Enemy) 
	{
		s.loadGraphic("assets/images/enemy/slime/blackslime.png", true, 16, 16);
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
	}
}