package;
import enemy.Enemy;
import enums.CharacterSyu.Muki;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import floorfolder.Maze;
import typedefs.TsuikaEnemyTable.BlockPoint;

/**
 * ...
 * @author 
 *各キャラクター達の動き方を設定するやつ
 */
class CharacterMovePattern
{
	public var Target:Character;
	public function IsBlockCenter():Bool
	{
		return ((Target.x - 20) % 24 == 0 && ((Target.y - 36) % 24 == 0));
	}
	/**
	 * @param	center ブロックの中心か否か
	 * @param	x	座標
	 * @param	y	座標
	 * @return		迷路配列用の(int,int)
	 */
	public function ZahyoToBox():BlockPoint
	{
		var ret:BlockPoint = {center:IsBlockCenter(),bx:Std.int((Target.x -20) / 24), by:Std.int((Target.y - 36) / 24)};
		return ret;
	}
	public function new(s:Character) //Targetにs:Character参照渡しで以後Targetに対して操作する
	{
		Target = s;
		Target.color = 0xffffff;
	}
	public function GraphicSet()
	{
	}
	public function Move(e:Float):Void//速度と向きに応じた移動を致します
	{
		switch (Target.muki)
		{
			case Muki.ue :Target.y -= Target.speed;
			case Muki.migi:Target.x += Target.speed;
			case Muki.shita:Target.y += Target.speed;
			case Muki.hidari:Target.x -= Target.speed;
		}
	}
	public function nisedraw()
	{
		Target.nisedraw();
	}
	private function GiltonoKyori(range:Int):Bool
	{
		return (FlxMath.distanceBetween(Target, Reg.GilPos) < range);
	}
	/**
	 * 
	 * @param	karimuki チェックする方向
	 * @param	x　現在の座標X
	 * @param	y　現在の座標Y
	 * @return  移動予定先NO壁だったらTrue
	 */
	private function IdousakiChk(karimuki:Muki,x:Float,y:Float):Bool
	{
		var ikeru:Bool = false;
		switch (karimuki)
		{
			case Muki.ue:ikeru = UeMoveChk(x,y);
			case Muki.migi:ikeru = MigiMoveChk(x,y);
			case Muki.shita:ikeru = ShitaMoveChk(x,y);
			case Muki.hidari:ikeru = HidariMoveChk(x,y);
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