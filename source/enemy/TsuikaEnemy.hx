package enemy;
import enums.CharacterSyu;

/**
 * ...
 * @author 
 */
class TsuikaEnemy
{
	public static var EnemyBorn:Array<{syu:CharacterSyu,x:Float,y:Float,m:Int,wait:Int}>;
	public static function Init():Void
	{
		TsuikaEnemy.EnemyBorn = new Array<{syu:CharacterSyu,x:Float,y:Float,m:Int,wait:Int}>();
		for (i in 0...100)
		{
			TsuikaEnemy.EnemyBorn[i] = {syu:CharacterSyu.No, x:0, y:0, m:99,wait:0};
		}
	}
	/**
	 * 
	 * @param	s  生み出す敵の種類 EnemySyu
	 * @param	px X座標
	 * @param	py Y座標
	 * @param	mu 向き
	 * @param   wa 何フレ後に出現
	 * @return     成功？失敗？
	 */
	public static function TsuikaEnemyTableSet(s:CharacterSyu,px:Float,py:Float,mu:Int,wa:Int):Bool
	{
		for (i in 0...100)
		{
			if (EnemyBorn[i].syu == CharacterSyu.No)
			{
				EnemyBorn[i] = {syu:s, x:px, y:py, m:mu,wait:wa};
				return true;
			}
		}
		return false;
	}
}