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
	public function new(s:Character)                  
	{
		super(s);
		Target.setPosition(Reg.XposSet(), Reg.YposSet());
		Target.muki = FlxG.random.int(0, 3);
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
	}
	override public function Move() 
	{
		super.Move();
	}
}