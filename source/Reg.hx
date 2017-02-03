package;
import enums.CharacterSyu.Muki;
import flixel.FlxG;
import flixel.graphics.frames.FlxBitmapFont;

/**
 * ...
 * @author 
 */
class Reg
{
	public function new() 
	{
		
	}
	public static var GamenSize:Int = 3;
	public static var font:FlxBitmapFont;
	public static var floor:Int;
	public static var gamecount:Int = 0;
	public static var zanki:Int;
	public static var zantime:Int;
	public static var score(default, set):Int = 0;
	public static var GilPos:Character;
	private static function set_score(value:Int):Int
	{
		score = value;
		if (score > 999999)
		{
			score = 999999;
		}
		if (score > highscore)
		{
			highscore = score;
		}
		return score;
	}
	public static var highscore(default, set):Int = 5000;
	private static function set_highscore(value:Int):Int
	{
		highscore = value;
		return highscore;
	}
	public inline static function XposSet():Int
	{
		var x = FlxG.random.int(0, 17);
		x = x * 24 + 20;
		return x;
	}
	public inline static function YposSet():Int
	{
		var y = FlxG.random.int(0, 8);
		y = y * 24 + 36;
		return y;
	}
	public inline static function clamp(value:Float, min:Float, max:Float):Float
	{
		if (value < min){
			return min;
		}
		else
		{
			if (value > max)
			{
				return max;
			}
			else 
			{
				return value;
			}
		}
	}
	public inline static function intclamp(value:Int, min:Int, max:Int):Int
	{
		if (value < min){
			return min;
		}
		else
		{
			if (value > max)
			{
				return max;
			}
			else 
			{
				return value;
			}
		}
	}
	public inline static function fillSpace(n:Int, digit:Int,?ume:String=" "):String 
	{
		var str:String = "" + n;
		return StringTools.lpad(str, ume, digit);
	}
	public inline static function MigiTurn(m:Muki):Muki
	{
		var ret:Muki = Muki.ue;
		switch (m)
		{
			case Muki.ue:ret= Muki.migi;
			case Muki.migi:ret= Muki.shita;
			case Muki.shita:ret= Muki.hidari;
			case Muki.hidari:ret = Muki.ue;
			default:trace("MUKIERROR");
		}
		return ret;
	}
	public inline static function HidariTurn(m:Muki):Muki
	{
		var ret:Muki = Muki.ue;
		switch (m)
		{
			case Muki.ue:ret= Muki.hidari;
			case Muki.migi:ret= Muki.ue;
			case Muki.shita:ret= Muki.migi;
			case Muki.hidari:ret = Muki.shita;
			default:trace("MUKIERROR");
		}
		return ret;
	}
	public inline static function MukiToInt(m:Muki):Int
	{
		var ret:Int = 0;
		switch (m)
		{
			case Muki.ue:ret= 0;
			case Muki.migi:ret= 1;
			case Muki.shita:ret= 2;
			case Muki.hidari:ret = 3;
			default:trace("MUKIERROR");
		}
		return ret;
	}
	/*
	public inline static function IntToMuki(m:Int):Muki
	{
		var ret:Muki = Muki.ue;
		switch (m)
		{
			case 0:ret = Muki.ue;
			case 1:ret = Muki.migi;
			case 2:ret = Muki.shita;
			case 3:ret = Muki.hidari;
			default:trace("MUKIERROR");
		}
		return ret;
	}
	*/
	public inline static function RandomMuki():Muki
	{
		var ret:Muki = Muki.ue;
		var r:Int = FlxG.random.int(0, 3);
		switch (r)
		{
			case 0:ret = Muki.ue;
			case 1:ret = Muki.migi;
			case 2:ret = Muki.shita;
			case 3:ret = Muki.hidari;
			default:trace("MUKIERROR");
		}
		return ret;
	}
}