package;
import enemy.Enemy;
import enums.CharacterSyu;
import flixel.FlxG;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import floorfolder.Maze;

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
	public inline static function MigiTurn(m:Int):Int
	{
		m += 1;
		if (m > 3)
		{
			m = 0;
		}
		return m;
	}
	public inline static function HidariTurn(m:Int):Int
	{
		m -= 1;
		if (m < 0)
		{
			m = 3;
		}
		return m;
	}
}