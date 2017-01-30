package enemy;
import enums.CharacterSyu;
import typedefs.TsuikaEnemyTable;

/**
 * ...
 * @author 
 */


class TsuikaEnemy
{
	public static var EnemyBorn:List<TsuikaEnemyTable>;
	public static function Init():Void
	{
		TsuikaEnemy.EnemyBorn = new List<TsuikaEnemyTable>();
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
	public static function TsuikaEnemyTableSet(s:TsuikaEnemyTable):Void
	{
		EnemyBorn.add(s);
	}
}