package;
import enemy.Enemy;
import flixel.FlxG;
import flixel.FlxSprite;
import floorfolder.Maze;

/**
 * ...
 * @author 
 *各キャラクター達の動き方を設定するやつ
 */
class CharacterMovePattern
{
	private var Target:Character;
	public function new(s:Character) //Targetにs:Character参照渡しで以後Targetに対して操作する
	{
		Target = s;
	}
	public function GraphicSet()
	{
	}
	public function Move()//速度と向きに応じた移動を致します
	{
		switch (Target.muki)
		{
			case 0:Target.y -= Target.speed;
			case 1:Target.x += Target.speed;
			case 2:Target.y += Target.speed;
			case 3:Target.x -= Target.speed;
		}
	}
	public function nisedraw()
	{
		Target.nisedraw();
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