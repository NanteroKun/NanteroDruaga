package;
import enemy.Enemy;
import flixel.FlxG;
import flixel.FlxSprite;
import floor.Maze;

/**
 * ...
 * @author 
 *各キャラクター達の動き方を設定するやつ
 */
class CharacterMovePattern
{
	private var Target:Character;
	public function new(s:Enemy) //Targetにs:Character参照渡しで以後Targetに対して操作する
	{
	}
	public function GraphicSet(s:Enemy)
	{
	}
	public function Move(s:Enemy)
	{
	}
	private function RoperTypeMove(s:Enemy):Void
	{
			
		if (s.x == Reg.GilPos.x && s.y == Reg.GilPos.y)
		{
			s.muki = 3;
			if (!HidariMoveChk(s.x,s.y))//左に壁があったら？
			{
				s.muki = FlxG.random.int(0, 3);
			}
			else
			{
				return;
			}
		}
		else
		{
			if (s.x == Reg.GilPos.x)
			{
				if (s.y < Reg.GilPos.y)
				{
					s.muki = 2;
					if (!ShitaMoveChk(s.x, s.y))
					{
						s.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
				else
				{
					s.muki = 0;
					if (!UeMoveChk(s.x, s.y))
					{
						s.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
			}
			if (s.y == Reg.GilPos.y)
			{
				if (s.x < Reg.GilPos.x)
				{
					s.muki = 1;
					if (!MigiMoveChk(s.x, s.y))
					{
						s.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
				else
				{
					s.muki = 3;
					if (!HidariMoveChk(s.x, s.y))
					{
						s.muki = FlxG.random.int(0, 3);
					}
					else
					{
						return;
					}
				}
			}
		}
		var ok:Bool = false;
		while (ok)
		{
			switch(s.muki)
			{
				case 0:if (MigiMoveChk(s.x, s.y)){s.muki = 1; ok = true; }else{s.muki = 3; }
				case 1:if (ShitaMoveChk(s.x, s.y)){s.muki = 2; ok = true; }else{s.muki = 0; }
				case 2:if (HidariMoveChk(s.x, s.y)){s.muki = 3; ok = true; }else{s.muki = 1; }
				case 3:if (UeMoveChk(s.x, s.y)){s.muki = 0; ok = true; }else{s.muki = 2;}
			}
		}
	}
	/**
	 * 
	 * @param	karimuki チェックする方向
	 * @param	x　現在の座標X
	 * @param	y　現在の座標Y
	 * @return  移動予定先NO壁だったらTrue
	 */
	private function IdousakiChk(karimuki:Int,x:Float,y:Float):Bool
	{
		var ikeru:Bool = false;
		switch (karimuki)
		{
			case 0:ikeru = UeMoveChk(x,y);
			case 1:ikeru = MigiMoveChk(x,y);
			case 2:ikeru = ShitaMoveChk(x,y);
			case 3:ikeru = HidariMoveChk(x,y);
		}
		return ikeru;
	}
	private function UeMoveChk(x:Float,y:Float):Bool
	{
		if (y <= 36){return false; }
		var x1:Int = Std.int((x - 20) / 24);
		var y1:Int = Std.int((y - 36) / 24);
		if (Maze.WallReturn(x1, y1 - 1) == 3 ) { return false; }
        if (Maze.WallReturn(x1 - 1, y1 - 1) == 1 ) { return false; }
        return true;
	}
	private function MigiMoveChk(x:Float, y:Float):Bool
	{
		if (x >= 428){return false; }
		var x1:Int = Std.int((x - 20) / 24);
		var y1:Int = Std.int((y - 36) / 24);
		if (Maze.WallReturn(x1, y1 - 1) == 2) { return false; }
        if (Maze.WallReturn(x1, y1) == 0) { return false; }
        return true;
	}
	private function ShitaMoveChk(x:Float, y:Float):Bool
	{
		if (y >= 228){return false; }
		var x1:Int = Std.int((x - 20) / 24);
		var y1:Int = Std.int((y - 36) / 24);
		if (Maze.WallReturn(x1, y1) == 3) { return false; }
        if (Maze.WallReturn(x1 - 1, y1) == 1) { return false; }
        return true;
	}
	private function HidariMoveChk(x:Float, y:Float):Bool
	{
		if (x <= 20){return false; }
		var x1:Int = Std.int((x - 20) / 24);
		var y1:Int = Std.int((y - 36) / 24);
		if (Maze.WallReturn(x1 - 1, y1 - 1) == 2) { return false; }
        if (Maze.WallReturn(x1 - 1, y1) == 0) { return false; }
        return true;
	}
}