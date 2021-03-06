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
		Target.muki = Reg.RandomMuki();
	}
	override public function GraphicSet() 
	{
		super.GraphicSet();
	}
	override public function Move(e:Float) 
	{
		super.Move(e);
	}
}