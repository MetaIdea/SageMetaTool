NAME	 	= "Art of Defense - Hero Solo"
VERSION		= "1.00"
TYPE		= "GAMEMODE"
GAME		= "BFME2,BFME2ROTWK"
DESCRIPTION = "Fight with an OP custom hero solo against waves of enemies"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

StartDelay = 0
TimeBetweenWaves = 10

WAVE = 1
UNITS = {}
EnemyTeam = CreepsTeam
EnemyWaypoint = "Player_1_Start"

OBJECT_TYPE_LIST_HERO = {
"AngmarHwaldar",
"AngmarKarsh",
"AngmarMorgramir",
"AngmarRogash",
"AngmarShadeWolf",
"ArnorArgeleb",
"ArnorArvedui",
"ArnorArveleg",
"ArnorCaptain",
"ArnorCaptainStealthless",
"CreateAHero",
"CreateAHeroTornado_Level1",
"CreateAHeroTornado_Level2",
"CreateAHeroTornado_Level3",
"Crebain",
"Drogoth",
"DwarvenCaptainofDale",
"DwarvenDain",
"DwarvenGloin",
"DwarvenGloin_Temp",
"ElrondWhirlwind",
"ElvenArwen",
"ElvenElrond",
"ElvenGaladriel",
"ElvenGlorfindel",
"ElvenHaldir",
"ElvenThranduil",
"EvilMenBlackRider",
"EyeOfSauron",
"GaladrielTornado",
"GondorAragorn",
"GondorBoromir",
"GondorDamrod",
"GondorEarnur",
"GondorFaramir",
"GondorGandalf",
"GondorGandalfWhite_H",
"GondorGandalfWhite_L",
"GondorGandalfWhite_M",
"GondorGwaihir",
"GondorIsildur",
"IsengardLurtz",
"IsengardMurderOfCrows",
"IsengardSaruman",
"IsengardSharku",
"IsengardWormTongue",
"Marker",
"MordorBalrog",
"MordorFellBeastInterface",
"MordorGothmog",
"MordorMouthOfSauron",
"MordorSauron",
"MordorShelob",
"MordorWitchKing",
"NeutralGollum",
"OrcChief01",
"OrcChief02",
"OrcChief03",
"OrcChief04",
"OrcChief05",
"RohanEomer",
"RohanEowyn",
"RohanFrodo",
"RohanGamling",
"RohanGimli",
"RohanHobbitHorde",
"RohanLegolas",
"RohanMerry",
"RohanPippin",
"RohanSam",
"RohanTheoden",
"RohanTreeBerd",
"SummonedDragon",
"TomBombadil",
"WildAzog",
"WildBatCloud",
"WildGoblinKing",
"WildShelob",
"Wyrm"
}

OBJECT_TYPE_LIST_INFANTRY_HORDE= {
"AngmarDarkDunedainHorde",
"AngmarDarkRangerHorde",
"AngmarDireWolfHorde",
"AngmarHillTrollHorde",
"AngmarNecromancerHorde",
"AngmarOrcWarriors",
"AngmarRhudaurSlingers",
"AngmarRhudaurSpearmen",
"ArnorArcherHorde",
"ArnorFighterHorde",
"ArnorRangerHorde",
"ArnorTowerShieldGuardHorde",
"DwarvenAxeThrowerHorde",
"DwarvenGuardianHorde",
"DwarvenMenOfDaleHorde",
"DwarvenPhalanxHorde",
"DwarvenZerkerHorde",
"ElvenLorienArcherHorde",
"ElvenLorienWarriorHorde",
"ElvenMirkwoodArcherHorde",
"ElvenMithlondSentryHorde",
"GoblinArcherHorde",
"GoblinFighterHorde",
"GondorArcherHorde",
"GondorCivilianFemaleHorde",
"GondorCivilianMaleHorde",
"GondorFighterHorde",
"GondorRangerHorde",
"GondorTowerShieldGuardHorde",
"HobbitCivilianHorde",
"ImladrisWarriorHorde",
"IsengardBerserkerHorde",
"IsengardFighterHorde",
"IsengardPikemanHorde",
"IsengardUrukCrossbowHorde",
"IsengardWargPackHorde",
"IsengardWildmanAxeHorde",
"IsengardWildmanHorde",
"LindonWarriorHorde",
"MordorArcherHorde",
"MordorBlackOrcHorde",
"MordorCorsairsOfUmbarHorde",
"MordorEasterlingHorde",
"MordorEasterlingHordeObsolete",
"MordorFighterHorde",
"MordorGoblinFighterHorde",
"MordorHaradrimArcherHorde",
"MordorHaradrimHordeObsolete",
"MordorHaradrimLancerHordeObsolete",
"MordorOrcScout_Horde",
"NoldorWarriorHorde",
"RohanArcherHorde",
"RohanElvenWarriorHorde",
"RohanHobbitFriendsHorde",
"RohanHobbitHorde",
"RohanHobbitNoHeroHorde",
"RohanOathbreakerHorde",
"RohanPeasantHorde",
"RohanSpearmenHorde",
"WildMarauderHorde",
"WildMarauderSwordHorde",
"WildSpiderlingHorde"
}

OBJECT_TYPE_LIST_ARCHER_HORDE = {
"AngmarDarkRangerHorde",
"AngmarNecromancerHorde",
"AngmarRhudaurSlingers",
"ArnorArcherHorde",
"ArnorRangerHorde",
"DwarvenAxeThrowerHorde",
"DwarvenMenOfDaleHorde",
"ElvenLorienArcherHorde",
"ElvenMirkwoodArcherHorde",
"GoblinArcherHorde",
"GoblinSpiderRiderHorde",
"GondorArcherHorde",
"GondorRangerHorde",
"ImladrisWarriorHorde",
"IsengardUrukCrossbowHorde",
"IsengardWildmanAxeHorde",
"LindonWarriorHorde",
"MordorArcherHorde",
"MordorHaradrimArcherHorde",
"MordorHaradrimHordeObsolete",
"MordorHaradrimLancerHordeObsolete",
"NoldorWarriorHorde",
"RohanArcherHorde",
"RohanElvenWarriorHorde",
"RohanHobbitFriendsHorde",
"RohanHobbitHorde"
}

OBJECT_TYPE_LIST_MACHINE = {
"BalrogOPT",
"DwarvenCatapult",
"DwarvenDemolisher",
"IsengardBatteringRam",
"IsengardSiegeLadder",
"MordorBalrog_NOFIRE",
"MordorCatapult",
"MordorCatapult_Celduin",
"MordorGrond",
"MordorSiegeTower"
}

OBJECT_TYPE_LIST_CAVALRY = {
"AngmarBannerSnowTroll",
"AngmarBannerWolfRider",
"AngmarSnowTroll",
"AngmarSnowTrollHorde",
"AngmarThrallMasterWolfBanner",
"AngmarWolfRider",
"AngmarWolfRiders",
"ArnorCavalry",
"ArnorCavalryBanner",
"ArnorKnightHorde",
"ElvenRivendellArcher",
"ElvenRivendellArcherHorde",
"ElvenRivendellLancer",
"ElvenRivendellLancerBanner",
"ElvenRivendellLancerHorde",
"GoblinSpiderRider",
"GoblinSpiderRiderBanner",
"GoblinSpiderRiderHorde",
"GondorCavalry",
"GondorCavalryBanner",
"GondorCavalryDeadRiderB",
"GondorCavalryDeadRiderD",
"GondorDeadRiderDEDA",
"GondorKnightHorde",
"GondorKnightsofDol",
"GondorKnightsofDolHorde",
"IsengardSharku",
"IsengardWargPack",
"IsengardWargPackHorde",
"IsengardWargRider",
"IsengardWargRiderBanner",
"IsengardWargRiderHorde",
"MordorBlackRider",
"MordorBlackRiderHorde",
"MordorGothmogWarg",
"MordorHaradrimRider",
"MordorHaradrimRiderBanner",
"MordorHaradrimRiderHorde",
"MordorWargHorde",
"NeutralDireWolf",
"NeutralWarg",
"RohanBanner",
"RohanOathbreakersCavalry",
"RohanRohirrim",
"RohanRohirrimBannerRider",
"RohanRohirrimHorde",
"RohanRohirrimHordeObsolete",
"RohanRoyalGuardHorde",
"RohirrimDeadRider",
"WargDeadRider",
"WargSentry",
"WildBabyDrakeHorde",
"WildBannerSpiderRider"
}

OBJECT_TYPE_LIST_BIG_MONSTER = {
"AngmarShadeWolf",
"MordorBalrog",
"RohanEntBase",
"RohanGenericEnt",
"RohanTreeBerd",
"WildMountainGiant"
}

OBJECT_TYPE_LIST_TOP = {
"MordorBalrog",
"AngmarShadeWolf",
"WildMountainGiant",
"AngmarRogash",
"AngmarSnowTroll",
"ElvenFortressEagle",
"Drogoth",
"SummonedDragon",
"SummonedDragonEgg",
"GoblinCaveTroll",
"WildFireDrake",
"MordorAttackTroll",
"RohanEntBase",
"RohanEntBirch",
"MordorShelrob",
"IsengardSharku",
"WatcherHead",
"Wyrm",
"Idle_Drogoth_WH"
}

OBJECT_TYPE_LIST_SUMMONED =
{
"AngmarShadeWolf",
"CreateAHeroFamiliar_Base",
"Crebain",
"DwarvenSummonedCitadelKeep",
"MordorBalrog",
"RohanOathbreakerHorde",
"SummonedDragon",
"WatcherHead",
"Wyrm"
}

OBJECT_TYPE_LIST_NO_FREEWILL_ENTER = {
"AngmarShadeWolf",
"Drogoth",
"GoblinCaveTroll",
"GondorGwaihir",
"IsengardSharku",
"MordorAttackTroll",
"MordorBalrog",
"MordorCaveTroll",
"MordorDrummerTroll",
"MordorDrummerTroll_Temp",
"MordorFellBeastInterface",
"MordorMountainTroll",
"SpellBookDragonStrikeDragon",
"WatcherHead",
"WildMountainGiant"
}

OBJECT_TYPE_LIST_ORC = {
"AngmarBannerOrcWarrior",
"AngmarOrcWarrior",
"AngmarOrcWarriors",
"MordorArcher",
"MordorArcherHorde",
"MordorBlackOrc",
"MordorBlackOrcHorde",
"MordorFighter",
"MordorFighterHorde",
"MordorGoblinArcher",
"MordorGoblinFighterHorde",
"MordorGoblinSwordsman",
"MordorWorker",
"WildLaborer"
}

OBJECTS = {}
OBJECTS["TIER1"] = {OBJECT_TYPE_LIST_INFANTRY_HORDE, OBJECT_TYPE_LIST_ARCHER_HORDE}
OBJECTS["TIER2"] = {OBJECT_TYPE_LIST_CAVALRY, OBJECT_TYPE_LIST_MACHINE}
OBJECTS["TIER3"] = {OBJECT_TYPE_LIST_SUMMONED, OBJECT_TYPE_LIST_NO_FREEWILL_ENTER, OBJECT_TYPE_LIST_TOP, OBJECT_TYPE_LIST_BIG_MONSTER, OBJECT_TYPE_LIST_HERO}

function SpawnWave()
	--ExecuteAction("DISPLAY_NOTIFICATION_BOX", "Generic", "\n\nWAVE: " .. WAVE .. "\n\n", 3)
	--ExecuteAction("DISPLAY_TEXT", "\n\nWave: " .. WAVE)
	ExecuteAction("SHOW_MILITARY_CAPTION", "\n\Wave: " .. WAVE .. "\n", 7)
	UNITS = {}
	local SPAWN_MULTIPLIER = ceil(WAVE * sqrt(WAVE))
	for i=1,SPAWN_MULTIPLIER,1 do
		local UnitName = GetUnitName()
		tinsert(UNITS, UnitName)
		local SpawnList = OBJECTS["TIER1"][random(getn(OBJECTS["TIER1"]))]
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, SpawnList[random(getn(SpawnList))], EnemyTeam, EnemyWaypoint)
	end
	if WAVE > 5 and random(100) < 50 then
		local UnitName = GetUnitName()
		tinsert(UNITS, UnitName)
		local SpawnList = OBJECTS["TIER2"][random(getn(OBJECTS["TIER2"]))]
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, SpawnList[random(getn(SpawnList))], EnemyTeam, EnemyWaypoint)
	end
	if WAVE > 10 and random(100) < 30 then
		local UnitName = GetUnitName()
		tinsert(UNITS, UnitName)
		local SpawnList = OBJECTS["TIER3"][random(getn(OBJECTS["TIER3"]))]
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, SpawnList[random(getn(SpawnList))], EnemyTeam, EnemyWaypoint)
	end	
	ExecuteAction("SCREEN_SHAKE", SHAKE_INTENSITY["CINE_INSANE"]) 
	SetCounter("CurrentWaveCounter", WAVE, "APT:StrategicHUDTurnNumber")
	ExecuteAction("UNIT_SET_HEALTH", HERO, 100)
	--ExecuteAction("STORE_OBJECT_KILL_COUNT_TO_COUNTER", HERO, "KILLCOUNTER")
	--ExecuteAction("DISPLAY_COUNTER", "KILLCOUNTER", "GUI:TotalKills")
	--SetCounter("EnemyCounter", CountAllObjectsOfTeam(EnemyTeam), "APT:EnemyArmyInfo")
	WAVE = WAVE + 1
	SetScriptTimer(1,IsEnemyUnitAlive,1)
end

function IsEnemyUnitAlive()
	for i=1,getn(UNITS),1 do
		--EvaluateCondition("NAMED_CREATED", UNIT)
		if not EvaluateCondition("NAMED_DESTROYED", UNITS[i]) then
			SetScriptTimer(1,IsEnemyUnitAlive,1)
			return true
		end
	end
	SetTimerCounter(TimeBetweenWaves, "SCRIPT:MGErebor_Wavetimer", "WaveTimer") 
	SetScriptTimer(TimeBetweenWaves,SpawnWave,1)
	return false
end

function AICoroutine()
	ExecuteAction("TEAM_ATTACK_NAMED", EnemyTeam, HERO)
end

function InitGamemode()
	ExecuteAction("DISPLAY_TEXT", "APT:GameMode")
	ExecuteAction("SHOW_MILITARY_CAPTION", "APT:GameMode", 7)
	OverwriteVictoryCondition("OnlyLocalPlayer")
	RemoveStartingUnits("OnlyLocalPlayer")
	ExecuteAction("PLAYER_SET_MONEY", LocalPlayer, 0)
	SpawnSuperHero()
	EnemyWaypoint = GetFarthestWaypoint(LocalTeam)
	SetScriptTimer(5,LoseConditionCheck,-1)
	SetScriptTimer(5,AICoroutine,-1)
	SetScriptTimer(StartDelay,SpawnWave,1)
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

SetScriptTimer(3,InitGamemode,1)
