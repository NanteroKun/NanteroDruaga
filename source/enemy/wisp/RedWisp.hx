package enemy.wisp;
import flixel.FlxSprite;
import floor.Maze;

/**
 * ...
 * @author 
 */
class RedWisp extends Wisp
{
	public function new(s:Enemy) 
	{
		super(s);
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
		s.loadGraphic("assets/images/enemy/wisp/redwisp.png", true, 16, 16);
		s.animation.add("idle", [0, 1, 2, 3], 30, true);
		s.animation.play("idle");
	}
	override public function Move(s:Enemy) 
	{
		if ((s.x - 20) % 24 == 0 && (s.y - 36) % 24 == 0 )
		{
			var cnt:Int = 0;
			while (true)
			{
				if (IdousakiChk(Reg.MigiTurn(s.muki),s.x,s.y))
				{
					s.muki = Reg.MigiTurn(s.muki);
					break;
				}
				else
				{
					if (IdousakiChk(s.muki,s.x,s.y))
					{
						break;
					}
					else
					{
						s.muki = Reg.HidariTurn(s.muki);
					}
				}
				cnt++;
				if (cnt > 100)
				{
					trace("LOOP is Kowai ?");
					break;
				}
			}
		}
		super.Move(s);
	}
}