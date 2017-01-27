package enemy.wisp;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Wisp extends CharacterMovePattern
{
	public function new(s:Enemy)                  
	{
		super(s);
		s.setPosition(Reg.XposSet(), Reg.YposSet());
		s.muki = FlxG.random.int(0, 3);
	}
	override public function GraphicSet(s:Enemy) 
	{
		super.GraphicSet(s);
	}
	override public function Move(s:Enemy) 
	{
		super.Move(s);
		switch (s.muki)
		{
			case 0:s.y -= s.speed;
			case 1:s.x += s.speed;
			case 2:s.y += s.speed;
			case 3:s.x -= s.speed;
		}
	}
}