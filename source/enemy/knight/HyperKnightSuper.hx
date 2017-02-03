package enemy.knight;
import enums.CharacterSyu.Muki;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author 
 */
class HyperKnightSuper extends Knight
{
	public function new(s:Character) 
	{
		sword = new Sword();
		shield = new FlxSprite();
		super(s);
		s.speed = 1;
		s.hitpoint = 96;
		recovery1 = 48;
		recovery2 = 0;
		s.getscore = 0;
	}
	override function GraphicSet() 
	{
		Target.loadGraphic("assets/images/enemy/knight/hyperknight/HyperKnight.png", true, 16, 16);
		sword.loadGraphic("assets/images/enemy/knight/hyperknight/HyperKnightSword.png", true, 32, 32);
		shield.loadGraphic("assets/images/enemy/knight/hyperknight/HyperKnightShield.png", true, 16, 16);
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
	override private function RoperTypeMove():Void
	{
		Target.speed = 1;
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
						//Target.muki = FlxG.random.int(0, 3);
						Target.speed = 0;
						return;
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
						//Target.muki = FlxG.random.int(0, 3);
						Target.speed = 0;
						return;
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
						//Target.muki = FlxG.random.int(0, 3);
						Target.speed = 0;
						return;
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
						//Target.muki = FlxG.random.int(0, 3);
						Target.speed = 0;
						return;
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
}