package enemy.knight;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxSpriteUtil;
import floorfolder.Maze;

/**
 * ...
 * @author 
 */
class Gil extends Knight
{
	private var idoumuki:Int;
	private var gilwaitcnt:Int;
	private var direct:FlxPoint = FlxPoint.get(0, 0);
	public function new(s:Character) 
	{
		super(s);
		Target.setPosition(20, 36);
		Target.speed = 1;
		Target.muki = 2;
		sword = new Sword();
		shield = new FlxSprite();
		sword.swordcnt = 4;
		sword.swordmuki =-1;
		sword.kenfurispeed = 7;
		gilwaitcnt = 0;
	}
	override function GraphicSet():Void 
	{
		Target.loadGraphic("assets/images/gil/Gil.png", true, 16, 16);
		for (i in 0...8)
		{
			Target.animation.add(Std.string(i), [i]);
		}
		sword.loadGraphic("assets/images/gil/whitesword.png", true, 32, 32);
		for (i in 0...45)
		{
			sword.animation.add(Std.string(i), [i]);
		}
		shield.loadGraphic("assets/images/gil/gilshield.png", true, 16, 16);
		for (i in 0...12)
		{
			shield.animation.add(Std.string(i), [i]);
		}
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		gilwaitcnt++;
		if (gilwaitcnt < 120){return;}
		idoumuki =-1;
		if(FlxG.keys.pressed.LEFT) {
            idoumuki=3;
        }
        if(FlxG.keys.pressed.UP) {
            idoumuki =0;
        }
        if(FlxG.keys.pressed.RIGHT) {
            idoumuki = 1;
        }
        if(FlxG.keys.pressed.DOWN) {
            idoumuki = 2;
        }
		direct.set(0, 0);
		switch(idoumuki)
		{
			case 0:walkcnt++; if (UeMoveChk(Target.x, Target.y)){direct.y =-1; }
			case 1:walkcnt++; if (MigiMoveChk(Target.x,Target.y)){direct.x=1; }
			case 2:walkcnt++; if (ShitaMoveChk(Target.x,Target.y)){direct.y=1; }
			case 3:walkcnt++; if (HidariMoveChk(Target.x, Target.y)){direct.x =-1; }
			default:walkcnt = 0;
		}
		Target.x += direct.x * Target.speed;
		Target.y += direct.y * Target.speed;
		sword.Move(FlxG.keys.pressed.Z);
	}
	override public function nisedraw() 
	{
		if (gilwaitcnt < 60)
		{
			SwordAnimation();
			return; 
		}
		else
		{
			if (gilwaitcnt < 120)
			{
				if (gilwaitcnt % 2 == 0)
				{
					return; 
				}
			}
		}
		super.nisedraw();
	}
	override function UeMoveChk(x:Float, y:Float):Bool 
	{
		if ((x - 20) % 24 != 0)
		{
			if (Target.muki == 3)
			{
				direct.x =-1;
			}
			else
			{
				direct.x = 1;
			}
			return false;
		}
		Target.muki = 0;
		if ((y + 36) % 24 != 0)
		{
			return true;
		}
		return super.UeMoveChk(x, y);
	}
	override function MigiMoveChk(x:Float, y:Float):Bool 
	{
		if ((y + 36) % 24 != 0)
		{
			if (Target.muki == 0)
			{
				direct.y =-1;
			}
			else
			{
				direct.y = 1;
			}
			return false;
		}
		Target.muki = 1;
		if ((x - 20) % 24 != 0)
		{
			return true;
		}
		return super.MigiMoveChk(x, y);
	}
	override function ShitaMoveChk(x:Float, y:Float):Bool 
	{
		if ((x - 20) % 24 != 0)
		{
			if (Target.muki == 3)
			{
				direct.x =-1;
			}
			else
			{
				direct.x = 1;
			}
			return false;
		}
		Target.muki = 2;
		if ((y + 36) % 24 != 0)
		{
			return true;
		}
		return super.ShitaMoveChk(x, y);
	}
	override function HidariMoveChk(x:Float, y:Float):Bool 
	{
		if ((y + 36) % 24 != 0)
		{
			if (Target.muki == 0)
			{
				direct.y =-1;
			}
			else
			{
				direct.y = 1;
			}
			return false;
		}
		Target.muki = 3;
		if ((x - 20) % 24 != 0)
		{
			return true;
		}
		return super.HidariMoveChk(x, y);
	}
}