package enemy.roper;
import enums.CharacterSyu.Muki;
import flixel.FlxG;

/**
 * ...
 * @author 
 */
class Roper extends CharacterMovePattern
{
	public var recovery1:Int;
	public var recovery2:Int;
	public function new(s:Character) 
	{
		super(s);
	}
	override public function Move(e:Float):Void
	{
		if (IsBlockCenter())
		{
			RoperTypeMove();//向き変更
		}
		super.Move(e);
	}
	private function RoperTypeMove():Void
	{
		if (Target.x == Reg.GilPos.x && Target.y == Reg.GilPos.y)
		{
			Target.muki = Muki.hidari;
			if (!HidariMoveChk(Target.x,Target.y))//左に壁があったら？
			{
				Target.muki = Reg.RandomMuki();
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
					Target.muki = Muki.shita;
					if (!ShitaMoveChk(Target.x, Target.y))
					{
						Target.muki = Reg.RandomMuki();
					}
					else
					{
						return;
					}
				}
				else
				{
					Target.muki = Muki.ue;
					if (!UeMoveChk(Target.x, Target.y))
					{
						Target.muki = Reg.RandomMuki();
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
					Target.muki = Muki.migi;
					if (!MigiMoveChk(Target.x, Target.y))
					{
						Target.muki = Reg.RandomMuki();
					}
					else
					{
						return;
					}
				}
				else
				{
					Target.muki = Muki.hidari;
					if (!HidariMoveChk(Target.x, Target.y))
					{
						Target.muki = Reg.RandomMuki();
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
	private function FukurokoujiChk (m:Muki,x:Float,y:Float):Bool
	{
		var px:Float = x;
		var py:Float = y;
		switch (m)
		{
			case Muki.ue:py -= 24;
			case Muki.migi:px += 24;
			case Muki.shita:py += 24;
			case Muki.hidari:px -= 24;
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