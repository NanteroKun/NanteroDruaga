package enemy.magician;
import enums.CharacterSyu;
import flixel.FlxG;
import flixel.math.FlxPoint;
import typedefs.TsuikaEnemyTable;

/**
 * ...
 * @author 
 */
class Magician extends CharacterMovePattern
{
	private var deteru:Bool;
	private var waitcnt:Int;
	private var appcnt:Int;
	private var dasuspell:CharacterSyu;
	public function new(s:Character) 
	{
		super(s);
		waitcnt = FlxG.random.int(0, 7) * 16 + 48;
		appcnt = 0;
		Target.speed = 0;
		Target.setPosition( -10000, -10000);
		deteru = false;
	}
	override public function GraphicSet() 
	{
		Target.animation.add(Std.string(Muki.ue), [0]);
		Target.animation.add(Std.string(Muki.migi), [1]);
		Target.animation.add(Std.string(Muki.shita), [2]);
		Target.animation.add(Std.string(Muki.hidari), [3]);
		Target.animation.add("NO", [4]);
	}
	override public function Move(e:Float) 
	{
		if (waitcnt > 0 && !deteru)
		{
			waitcnt--;
			Target.setPosition( -10000, -10000);
		}
		if (waitcnt == 0 && !deteru)
		{
			var px:Float = (Reg.GilPos.x - 20) % 24;
			var py:Float = (Reg.GilPos.y - 36) % 24;
			var denai:Bool = false;
			if ((px >= 7 && px <= 17) || (py >= 7 && py <= 17))
			{
				denai = true;
			}
			if (!denai)
			{
				var p:FlxPoint = MagePositionSet();
				Target.setPosition(p.x, p.y);
				deteru = true;
				appcnt = 0;
			}
		}
		if (deteru)
		{
			var appcnt2:Int = Std.int(appcnt / 16);
			switch(appcnt2)
			{
				case 0:magedisp(4);
				case 1:magedisp(2);
				case 2, 3:Target.animation.play(Std.string((Target.muki)));
				case 4:magedisp(2);
				case 5:magedisp(4);
			}
			if (appcnt == 32)
			{
				Target.animation.play(Std.string(Target.muki));
				var s:TsuikaEnemyTable={syu:dasuspell, x:Target.x, y:Target.y, m:Target.muki, wait:0};
				TsuikaEnemy.TsuikaEnemyTableSet(s);
			}
			if (appcnt == 96)
			{
				Target.setPosition( -10000, -10000);
				deteru = false;
				waitcnt = FlxG.random.int(0, 7) * 16 + 48;
			}
			appcnt++;
		}
	}
	private function magedisp(t:Int):Void
	{
		if (appcnt % t == 0 )
		{	
			Target.animation.play(Std.string(Target.muki));
		}
		else
		{
			Target.animation.play("NO");
		}
	}
	private function MagePositionSet():FlxPoint
	{
		var loopcnt:Int = 0;
		var retpos:FlxPoint = FlxPoint.get(0, 0);
		var tx:Float = Reg.GilPos.x;
		var ty:Float = Reg.GilPos.y;
		var gx:Int = Std.int((tx - 20) / 24);
		var gy:Int = Std.int((ty - 36) / 24);
		if ((tx - 20) % 24 > 16) { gx++; }
		if ((ty - 36) % 24 > 16) { gy++; }
		var ex:Int = -1;
		var ey:Int = -1;
		var emuki:Muki = Muki.shita;
		while (true)
		{
			loopcnt++;
			var syutsugen:Int = FlxG.random.int(0, 15);
			switch (syutsugen)
			{
				case 0: ex = gx; ey = gy - 3; emuki = Muki.shita; 
				case 1: ex = gx - 1; ey = gy - 2; emuki = Muki.shita; 
				case 2: ex = gx; ey = gy - 2; emuki = Muki.shita; 
				case 3: ex = gx + 1; ey = gy - 2; emuki = Muki.shita; 
				case 4: ex = gx - 3; ey = gy; emuki = Muki.migi; 
				case 5: ex = gx - 2; ey = gy - 1; emuki = Muki.migi; 
				case 6: ex = gx - 2; ey = gy; emuki = Muki.migi; 
				case 7: ex = gx - 2; ey = gy + 1; emuki = Muki.migi; 
				case 8: ex = gx; ey = gy + 3; emuki = Muki.ue; 
				case 9: ex = gx - 1; ey = gy + 2; emuki = Muki.ue; 
				case 10: ex = gx; ey = gy + 2; emuki = Muki.ue;
				case 11: ex = gx + 1; ey = gy + 2; emuki = Muki.ue; 
				case 12: ex = gx + 3; ey = gy; emuki = Muki.hidari; 
				case 13: ex = gx + 2; ey = gy - 1; emuki = Muki.hidari;  
				case 14: ex = gx + 2; ey = gy; emuki = Muki.hidari;  
				case 15: ex = gx + 2; ey = gy + 1; emuki = Muki.hidari;  
			}
			if (ex < 0 || ex > 17 || ey < 0 || ey > 8) { continue; }
			retpos.x = ex * 24 + 20;
			retpos.y = ey * 24 + 36;
			Target.muki = emuki;
			if (Type.enumEq(Target.syu,CharacterSyu.EnemySyu(Mage)) || Type.enumEq(Target.syu,CharacterSyu.EnemySyu(Sorcerer)))
			{
				if (IdousakiChk(emuki, retpos.x, retpos.y))
				{
					break;
				}
				else
				{
					if (loopcnt < 100) 
					{
						continue;
					}
				}
			}
			break;
		}
		return retpos;
	}
}