package disp;
import flixel.FlxObject;
import flixel.text.FlxBitmapText;

/**
 * ...
 * @author 
 */
class Time extends FlxObject
{
	private var dispzantime:FlxBitmapText;
	private var zantime:FlxBitmapText;
	public function new() 
	{
		super();
		dispzantime = new FlxBitmapText(Reg.font);
		dispzantime.setPosition(184, 272);
		dispzantime.text = "TIME";
		dispzantime.color = 0xc90000;
		zantime = new FlxBitmapText(Reg.font);
		zantime.setPosition(184, 280);
		zantime.text = Reg.fillSpace(Reg.zantime, 4, " ") + "0";
		zantime.color = 0xc9c9f2;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	override public function draw():Void 
	{
		super.draw();
		var tempcam = camera;
		dispzantime.x = -tempcam.x / Reg.GamenSize + 184;
		zantime.x = -tempcam.x / Reg.GamenSize + 184;
		zantime.text = Reg.fillSpace(Reg.zantime, 4, " ") + "0";
		dispzantime.draw();
		zantime.draw();
	}
}