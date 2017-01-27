package;

import disp.GamenUpDisp;
import disp.Time;
import enemy.Enemy;
import enemy.TsuikaEnemy;
import enums.EnemySyu;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.graphics.frames.FlxBitmapFont;
import flixel.group.FlxGroup.FlxTypedGroup;
import floor.Floor;
import gil.Gil;

class PlayState extends FlxState
{
	private var floorcnt:Int;
	private var background:FlxObject;
	private var gil:Gil;
	private var enemygroup:FlxTypedGroup<Enemy>;
	private var cam:FlxCamera;
	private var GamenUp:GamenUpDisp;
	private var ZanTime:Time;
	override public function create():Void
	{
		super.create();
		FlxG.debugger.visible = true;
		FlxG.debugger.drawDebug = true;
		Reg.font = FlxBitmapFont.fromXNA("assets/images/font/NamcoFont.png", " 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.@,;?!");
		GamenUp = new GamenUpDisp();
		add(GamenUp);
		ZanTime = new Time();
		add(ZanTime);
		background = new Floor();
		add(background);
		gil = new Gil();
		add(gil);
		enemygroup = new FlxTypedGroup<Enemy>();
		enemygroup = Enemy.Init(100);
		add(enemygroup);
		cam = FlxG.camera;
		cam.setPosition(0, 0);
		cam.width = 464;
		cam.height = 288;
		FlxG.worldBounds.set(0, 0, 464, 288);
		floorcnt = 0;
		Reg.zantime = 2000;
		TsuikaEnemy.Init();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		TsuikaEnemy.TsuikaEnemyStarCnt = 0;
		floorcnt++;
		Reg.gamecount++;
		cam.x = (-gil.x -8)* Reg.GamenSize + 112 * Reg.GamenSize;
		cam.x = Reg.clamp(cam.x, -240 * Reg.GamenSize, 0);
		Reg.score+= 531;
		Reg.zantime-= 1;
		switch (floorcnt)
		{
			case 50:EnemySet(Reg.floor);
		}
		if (FlxG.keys.pressed.ESCAPE){FlxG.resetState(); }
		EnemyTsuika();
	}
	override public function draw():Void 
	{
		super.draw();
	}
	private function EnemyTsuika()
	{
		for (i in 0...100)
		{
			if (TsuikaEnemy.EnemyBorn[i].syu != EnemySyu.No)
			{
				EnemyUmu(TsuikaEnemy.EnemyBorn[i].syu, TsuikaEnemy.EnemyBorn[i].x, TsuikaEnemy.EnemyBorn[i].y, TsuikaEnemy.EnemyBorn[i].m);
				TsuikaEnemy.EnemyBorn[i].syu = EnemySyu.No;
			}
		}
	}
	private function EnemyUmu(syu:EnemySyu, x:Float, y:Float, m:Int):Void
	{
		var temp:Enemy;
		temp = enemygroup.getFirstDead();
		if (temp != null)
		{
			temp.setPosition(x, y);
			temp.muki = m;
			temp.Set(syu);
			temp.revive();
		}
	}
	private function EnemySet(floor:Int):Void
	{
		for (i in 0...50)
		{
			var temp:Enemy;
			temp = enemygroup.getFirstDead();
			if (temp != null)
			{
				var s = enums.EnemySyu.RedWispFast;
				var k:Int = FlxG.random.int(0, 6);
				//k = 10;
				switch(k)
				{
					case 0:temp.Set(enums.EnemySyu.RedSlime);
					case 1:temp.Set(enums.EnemySyu.BlackSlime);
					case 2:temp.Set(enums.EnemySyu.GreenSlime);
					case 3:temp.Set(enums.EnemySyu.BlueSlime);
					case 4:temp.Set(enums.EnemySyu.DarkGreenSlime);
					case 5:temp.Set(enums.EnemySyu.DarkYellowSlime);
					
					case 6:temp.Set(enums.EnemySyu.BlueWispFast);
					case 7:temp.Set(enums.EnemySyu.BlueWispSlow);
					case 8:temp.Set(enums.EnemySyu.RedWispFast);
					case 9:temp.Set(enums.EnemySyu.RedWispSlow);
					case 10:temp.Set(enums.EnemySyu.BlueKnight);
				}
				temp.revive();
			}
		}
	}
}