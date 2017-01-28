package enemy.slime;

/**
 * ...
 * @author 
 */
class BlackSlime extends Slime
{
	public function new(s:Character) 
	{
		waitbase = 63;
		super(s);
	}
	override public function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/slime/blackslime.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
}