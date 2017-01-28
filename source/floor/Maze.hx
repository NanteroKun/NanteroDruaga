package floor;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

/**
 * ...
 * @author 												
 */
class Maze extends FlxObject
{
	private static var wall:Array<Int>;
	private var wall2:Array<Int>;
	private static var walls:FlxTypedGroup<Wall>;
	private var randomseed:Int;
	public function new() 
	{
		super();
		wall = new Array<Int>();
		wall2 = new Array<Int>();
		walls = new FlxTypedGroup<Wall>();
		MakeMaze();
	}
	override public function draw():Void 
	{
		super.draw();
		walls.draw();
	}
	private function MakeMaze():Void
	{
		walls = new FlxTypedGroup<Wall>();
		randomseed = Reg.floor;
		var cnt:Int = 0;
		for (x in 0...17)
		{
			for (y in 0...8)
			{
				wall[cnt] = -1;
				wall2[cnt] =-1;
				cnt++;
			}
		}
		var x1:Int = 0;//x基準柱
		var y1:Int = 0;//y基準柱
		var i:Int = 16;
		while (i >-1)
		{
			for (j in 0...8)
			{
				if (wall[i + j * 17] != -1)//決定済みの柱は処理しない
				{
					continue;
				}
				else
				{
					for (cnt in 0...136)
					{
						wall2[cnt] =-1;//仮柱全部消す
					}
				}
				x1 = i; y1 = j;
				while (true)
				{
					var kabe:Int = KabeRandom();
					if (kabe == 0 && y1 == 0) { wall[x1+ y1*17] = kabe; break; }  //上　　外壁に当たって
					if (kabe == 1 && x1 == 16) { wall[x1+ y1*17] = kabe; break; }  //右　次の基準柱に移動する
					if (kabe == 2 && y1 == 7) { wall[x1+ y1*17] = kabe; break; }  //下　
					if (kabe == 3 && x1 == 0) { wall[x1+ y1*17] = kabe; break; } //左
					if (kabe == 0 && returnmap2(x1,y1 - 1) != -1) { continue; }  //現在生成中の柱に当たって方向決定からやり直し
					if (kabe == 1 && returnmap2(x1 + 1,y1) != -1) { continue; }
					if (kabe == 2 && returnmap2(x1, (y1 + 1)) != -1) { continue; }
					if (kabe == 3 && returnmap2(x1 - 1,y1) != -1) { continue; }
					if (kabe == 0 && returnmap(x1,( y1 - 1)) != -1) { wall[x1+ y1*17] = kabe; break; }//固定済みの壁に当たってループ脱出
					if (kabe == 1 && returnmap(x1 + 1,y1) != -1) { wall[x1+ y1*17] = kabe; break; }
					if (kabe == 2 && returnmap(x1, (y1 + 1)) != -1) { wall[x1+ y1*17] = kabe; break; }
					if (kabe == 3 && returnmap(x1 - 1, y1) != -1) { wall[x1+ y1*17] = kabe; break; }
					wall[x1+ y1*17] = kabe;    //壁ではなかった。現在位置に壁セット
					wall2[x1+ y1*17] = kabe;   //現在進行中の柱にもセット
                    switch (kabe)               //次の柱に移動
					{
						case 0: y1--; 
						case 1: x1++; 
						case 2: y1++; 
						case 3: x1--; 
						default: 
					}
				}
			}
		i--;
		}
		var k:Int  = 0;
		var loadgra:String;
		for (i in 0...17)
		{
			for (j in 0...8)
			{
				k++;
				if (wall[i+ j*17] == 0 || wall[i+ j*17] == 2)
				{
					loadgra = "assets/images/wall/Tatehashira.png";
				}
				else
				{
					loadgra = "assets/images/wall/Yokohashira.png";
				}
				var no:String = Std.string(i)+Std.string(j);
				var temp:Wall;
				switch (wall[i+ j*17])
				{
					case 0:
						temp = new Wall();
						temp.name = no;
						temp.loadGraphic(loadgra, false);
						temp.setPosition((36 + i * 24) , (j * 24 + 35) );
						walls.add(temp);
					case 1:
						temp = new Wall();
						temp.name = no;
						temp.loadGraphic(loadgra, false);
						temp.setPosition((43 + i * 24) , (j * 24 + 52) );
						walls.add(temp);
					case 2:
						temp = new Wall();
						temp.name = no;
						temp.loadGraphic(loadgra, false);
						temp.setPosition(36 + i * 24 , (j * 24 + 59) );
						walls.add(temp);
					case 3:
						temp = new Wall();
						temp.name = no;
						temp.loadGraphic(loadgra, false);
						temp.setPosition(19 + i * 24 , (j * 24 + 52) );
						walls.add(temp);
					default: break;
				}
			}
		}
	}
	private function KabeRandom():Int
	{
		var A:Int = (randomseed & 255);
		var B:Int = A;
		var CY:Int;
		A = (A & 144);
		if (A == 144 || A == 0) { CY = 1; } else { CY = 0; }
		A = B;
		A *= 2;
		A += CY;
		randomseed = A;
		var kabe:Int = (randomseed & 3);
		return kabe;
	}
	private function returnmap2(x:Int, y:Int):Int
	{
		if (x < 0 || x > 16 || y < 0 || y > 7)
		{
			return 99;   								
		}
		return wall2[x+y*17];
	}
	private function returnmap(x:Int, y:Int):Int
	{
		if (x < 0 || x > 16 || y < 0 || y > 7)
		{
			return 99;
		}
		return wall[x+ y*17];
	}
	public static function WallReturn(x:Int, y:Int):Int
	{
		if (x < 0 || x > 16 || y < 0 || y > 7)
		{
			return 99;
		}
		return wall[x+ y*17];
	}
	/**
	 * 
	 * @param	x 座標と向きを入れるとそこの壁を壊してくれるというやつ
	 * @param	y
	 * @param	muki
	 */
	public static function WallDel(x:Int, y:Int,muki:Int):Void
	{
		switch (muki)
		{
			case 0:
				if (WallReturn(x, y - 1) == 3) { WallObjectKesu(x, y - 1); return; }
				if (WallReturn(x - 1, y - 1) == 1) { WallObjectKesu(x - 1, y - 1); return; }
			case 1:
				if (WallReturn(x, y - 1) == 2) { WallObjectKesu(x, y - 1); return; }
				if (WallReturn(x, y) == 0) { WallObjectKesu(x, y); return; }
			case 2:
				if (WallReturn(x, y) == 3) { WallObjectKesu(x, y); return; }
				if (WallReturn(x - 1, y) == 1) { WallObjectKesu(x - 1, y); return; }
			case 3:
				if (WallReturn(x - 1, y - 1) == 2) { WallObjectKesu(x - 1, y - 1); return ; }
				if (WallReturn(x - 1, y) == 0) { WallObjectKesu(x - 1, y); return ; }
		}
	}
	private static function WallObjectKesu(x:Int, y:Int):Void
	{
		wall[x + y * 17] = -1;
		var kesi:String = Std.string(x) + Std.string(y);
		walls.forEachAlive(function(w:Wall) 
		{
			w.WallKesu(kesi); // すべて消す
		});
	}
}