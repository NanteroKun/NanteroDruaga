package enemy.knight;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author 
 */
class Gil extends Knight
{
	private var direct:FlxPoint = FlxPoint.get(0, 0);
	public function new(s:Character) 
	{
		super(s);
		Target.loadGraphic("assets/images/gil/Gil.png",true,16,16);
		Target.animation.add("idle0", [0], 30, false);
		Target.animation.add("idle1", [2], 30, false);
		Target.animation.add("idle2", [4], 30, false);
		Target.animation.add("idle3", [6], 30, false);
		Target.setPosition(20, 36);
		Target.speed = 1;
		Target.muki = 2;
	}
	override public function Move() 
	{
		direct.set();
		if(FlxG.keys.pressed.LEFT) {
            direct.x=-1;
        }
        if(FlxG.keys.pressed.UP) {
            direct.y =-1;
        }
        if(FlxG.keys.pressed.RIGHT) {
            direct.x = 1;
        }
        if(FlxG.keys.pressed.DOWN) {
            direct.y = 1;
        }
		Target.x += direct.x * Target.speed; 
		Target.y += direct.y * Target.speed;
		Reg.GilPos.x = Target.x; 
		Reg.GilPos.y = Target.y;
	}
}