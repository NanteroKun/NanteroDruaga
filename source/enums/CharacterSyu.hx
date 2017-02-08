package enums;

/**
 * @author 
 */
enum CharacterSyu 
{
	No; 
	Gil;
	EnemySyu(enemy:EnemySyu);
	SpellSyu(jumon:SpellSyu);
	Sonota(sonota:Sonota);
}
enum EnemySyu
{
	BlueWispSlow; BlueWispFast; RedWispSlow; RedWispFast;
	GreenSlime; BlackSlime; RedSlime; BlueSlime; DarkGreenSlime; DarkYellowSlime;
	Mage; Druid; Sorcerer; Wizard;
	MageGhost; DruidGhost; SorcererGhost; WizardGhost;
	BlueKnight; BlackKnight; MirrorKnight; HyperKnight; LizardMan; RedKnight; HyperKnightSuper;
}
enum SpellSyu
{
	WhiteSpell; BlueSpell; RedSpell; GreenSpell; FireElement;
}
enum Sonota
{
	Key; Door; Treasure;
	FakeKey; FakeDoor; FakeTreasure;
}
enum Muki
{
	ue; migi; shita; hidari;
}

