package enemy;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class TsuikaEnemy
{
	public static var EnemyBorn:Array<{syu:CharacterSyu,x:Float,y:Float,m:Int}>;
	public static var TsuikaEnemyStarCnt:Int = 0;
	public static function Init():Void
	{
		TsuikaEnemy.EnemyBorn = new Array<{syu:CharacterSyu,x:Float,y:Float,m:Int}>();
		for (i in 0...100)
		{
			TsuikaEnemy.EnemyBorn[i] = {syu:CharacterSyu.No, x:0, y:0, m:99};
		}
	}
	/**
	 * 
	 * @param	s  生み出す敵の種類 EnemySyu
	 * @param	px X座標
	 * @param	py Y座標
	 * @param	mu 向き
	 * @return     成功？失敗？
	 */
	public static function TsuikaEnemyTableSet(s:CharacterSyu,px:Float,py:Float,mu:Int):Bool
	{
		for (i in TsuikaEnemyStarCnt...100)
		{
			if (EnemyBorn[i].syu == CharacterSyu.No)
			{
				EnemyBorn[i] = {syu:s, x:px, y:py, m:mu};
				return true;
			}
			TsuikaEnemyStarCnt++;
		}
		return false;
	}
	
}