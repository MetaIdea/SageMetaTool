NAME	 	= "Hero Solo"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Fight with an OP custom hero solo against other players (no base building for local player)"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function InitGamemode()
	OverwriteVictoryCondition("OnlyLocalPlayer")
	RemoveStartingUnits("OnlyLocalPlayer")
	ExecuteAction("PLAYER_SET_MONEY", LocalPlayer, 0)
	SpawnSuperHero()
	SetScriptTimer(5,LoseConditionCheck,-1)
end

function LoseConditionCheck()
	if EvaluateCondition("NAMED_DESTROYED", HERO) then
		ExecuteAction("PLAYER_KILL", LocalPlayer)
	end
end

function SpawnSuperHero()
	HERO = spawn("CreateAHero")
    HERO_ = GetObjectLuaRef(HERO)
	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS", HERO, 50000)
	ObjectGrantUpgrade(HERO_, "Upgrade_Veterancy_VETERAN")
    ObjectGrantUpgrade(HERO_, "Upgrade_Veterancy_ELITE")
    ObjectGrantUpgrade(HERO_, "Upgrade_Veterancy_HEROIC")
	ExecuteAction("SET_HERO_EXPERIENCE_SHARING", 1)
    --ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",Asset)
	return HERO
end

SetScriptTimer(1,InitGamemode,1)
--InitGamemode()