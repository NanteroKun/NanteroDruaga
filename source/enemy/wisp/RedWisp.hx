package enemy.wisp;
import flixel.FlxSprite;
import floorfolder.Maze;

/**
 * ...
 * @author 
 */
class RedWisp extends Wisp
{
	public function new(s:Character) 
	{
		super(s);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
		Target.loadGraphic("assets/images/enemy/wisp/redwisp.png", true, 16, 16);
		Target.animation.add("idle", [0, 1, 2, 3], 30, true);
		Target.animation.play("idle");
	}
	override public function Move(e:Float) 
	{
		if ((Target.x - 20) % 24 == 0 && (Target.y - 36) % 24 == 0 )
		{
			var cnt:Int = 0;
			while (true)
			{
				if (IdousakiChk(Reg.MigiTurn(Target.muki),Target.x,Target.y))
				{
					Target.muki = Reg.MigiTurn(Target.muki);
					break;
				}
				else
				{
					if (IdousakiChk(Target.muki,Target.x,Target.y))
					{
						break;
					}
					else
					{
						Target.muki = Reg.HidariTurn(Target.muki);
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
		super.Move(e);
	}
}