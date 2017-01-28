package enemy.roper;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class Roper extends CharacterMovePattern
{
	public function new(s:Character) 
	{
		super(s);
	}
	private function RoperTypeMove():Void
	{
		if (Target.x == Reg.GilPos.x && Target.y == Reg.GilPos.y)
		{
			Target.muki = 3;
			if (!HidariMoveChk(Target.x,Target.y))//左に壁があったら？
			{
				Target.muki = FlxG.random.int(0, 3);
			}
			else
			{
				return;
			}
		}
		else
		{
			if (Target.x == Reg.GilPos.x)
			{
				if (Target.y < Reg.GilPos.y)
				{
					Target.muki = 2;
					if (!ShitaMoveChk(Target.x, Target.y))
					{
						Target.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
				else
				{
					Target.muki = 0;
					if (!UeMoveChk(Target.x, Target.y))
					{
						Target.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
			}
			if (Target.y == Reg.GilPos.y)
			{
				if (Target.x < Reg.GilPos.x)
				{
					Target.muki = 1;
					if (!MigiMoveChk(Target.x, Target.y))
					{
						Target.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
				else
				{
					Target.muki = 3;
					if (!HidariMoveChk(Target.x, Target.y))
					{
						Target.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
			}
		}
		var cnt:Int = 0;
		while (true)
		{
			if (IdousakiChk(Reg.MigiTurn(Target.muki), Target.x, Target.y) 
				&& !FukurokoujiChk(Reg.MigiTurn(Target.muki), Target.x, Target.y))
			{
				Target.muki = Reg.MigiTurn(Target.muki);
				break;
			}
			else
			{
				Target.muki = Reg.HidariTurn(Target.muki);
			}
		}
	}
	private function FukurokoujiChk (m:Int,x:Float,y:Float):Bool
	{
		var px:Float = x;
		var py:Float = y;
		switch (m)
		{
			case 0:py -= 24;
			case 1:px += 24;
			case 2:py += 24;
			case 3:px -= 24;
		}
		if (!IdousakiChk(m, px, py) 
			&& !IdousakiChk(Reg.MigiTurn(m),px,py)
			&& !IdousakiChk(Reg.HidariTurn(m), px, py))//右に曲がった先が袋小路でした
		{
			return true;
		}
		return false;
	}
}