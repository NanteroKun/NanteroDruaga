package disp;

import flixel.FlxObject;
import flixel.text.FlxBitmapText;

/**
 * ...
 * @author                                                      
 */
class GamenUpDisp extends FlxObject
{
	private var dispScore:FlxBitmapText;
	private var dispHighScore:FlxBitmapText;
	private var oneup:FlxBitmapText;
	private var hige:FlxBitmapText;
	public function new() 
	{
		super();
		oneup = new FlxBitmapText(Reg.font);
		oneup.setPosition(3 * 8, 0);
		oneup.text = "1UP";
		oneup.color = 0xc90000;
		hige = new FlxBitmapText(Reg.font);
		hige.setPosition(10 * 8, 0);
		hige.text = "HIGH SCORE";
		hige.color = 0x00c900;
		dispScore = new FlxBitmapText(Reg.font);
		dispScore.setPosition(0, 8);
		dispScore.text = Reg.fillSpace(Reg.score, 6, " ") + "0";
		dispScore.color = 0xc9c9f2;
		dispHighScore = new FlxBitmapText(Reg.font);
		dispHighScore.setPosition(88, 8);
		dispHighScore.text = Reg.fillSpace(Reg.highscore, 6, " ") + "0";
		dispHighScore.color = 0xc9c900;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	override public function draw():Void 
	{
		super.draw();
		var tempcam = camera;
		oneup.x = -tempcam.x / Reg.GamenSize + 24;
		hige.x = -tempcam.x / Reg.GamenSize + 80;
		dispScore.text = Reg.fillSpace(Reg.score,6, " ") + "0";
		dispScore.x = -tempcam.x / Reg.GamenSize;
		dispHighScore.text = Reg.fillSpace(Reg.highscore, 6, " ") + "0";
		dispHighScore.x = -tempcam.x / Reg.GamenSize +88;
		if (Reg.gamecount % 32 > 16)
		{
			oneup.draw();
		}
		hige.draw();
		dispScore.draw();
		dispHighScore.draw();
	}
}