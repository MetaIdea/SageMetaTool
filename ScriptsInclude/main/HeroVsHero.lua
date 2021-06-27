NAME	 	= "Hero vs. Hero"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Defeat all enemy heroes/epics to win. Random crates spawn on map. This gamemode is inspired by the LodR Battle for Middle Earth Xbox exclusive gamemode"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

GAMEMODE = "HEROVSHERO"

ExecuteAction("SHOW_MILITARY_CAPTION", "APT:Hero", 10) --GUI:versus
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

if SAGE_GAME <= CNCZH then
	HERO = "AmericaInfantryColonelBurton"
	UnitSelectionList = {"AmericaInfantryColonelBurton","AirF_AmericaInfantryColonelBurton","Lazr_AmericaInfantryColonelBurton","SupW_AmericaInfantryColonelBurton","ChinaInfantryBlackLotus","Infa_ChinaInfantryBlackLotus","Nuke_ChinaInfantryBlackLotus","Tank_ChinaInfantryBlackLotus","GLAInfantryJarmenKell","Demo_GLAInfantryJarmenKell","Slth_GLAInfantryJarmenKell"}
elseif SAGE_GAME <= BFME2ROTWK then
	HERO = "CreateAHero"
	UnitSelectionList = 
	{ 
		--"CreateAHero",
		"AngmarHwaldar","AngmarKarsh","AngmarMorgramir","AngmarRogash","AngmarShadeWolf","ArnorArgeleb","ArnorArvedui","ArnorArveleg","ArnorCaptain","ArnorCaptainStealthless","CreateAHeroTornado_Level1","CreateAHeroTornado_Level2","CreateAHeroTornado_Level3","Crebain","Drogoth","DwarvenCaptainofDale","DwarvenDain","DwarvenGloin","DwarvenGloin_Temp","ElrondWhirlwind","ElvenArwen","ElvenElrond","ElvenGaladriel","ElvenGlorfindel","ElvenHaldir","ElvenThranduil","EvilMenBlackRider","EyeOfSauron","GaladrielTornado","GondorAragorn","GondorBoromir","GondorDamrod","GondorEarnur","GondorFaramir","GondorGandalf","GondorGandalfWhite_H","GondorGandalfWhite_L","GondorGandalfWhite_M","GondorGwaihir","GondorIsildur","IsengardLurtz","IsengardMurderOfCrows","IsengardSaruman","IsengardSharku","IsengardWormTongue","Marker","MordorBalrog","MordorFellBeastInterface","MordorGothmog","MordorMouthOfSauron","MordorSauron","MordorShelob","MordorWitchKing","NeutralGollum","OrcChief01","OrcChief02","OrcChief03","OrcChief04","OrcChief05","RohanEomer","RohanEowyn","RohanFrodo","RohanGamling","RohanGimli","RohanHobbitHorde","RohanLegolas","RohanMerry","RohanPippin","RohanSam","RohanTheoden","RohanTreeBerd","SummonedDragon","TomBombadil","WildAzog","WildBatCloud","WildGoblinKing","WildShelob","Wyrm",
		"MordorBalrog","AngmarShadeWolf","WildMountainGiant","AngmarRogash","AngmarSnowTroll","ElvenFortressEagle","Drogoth","SummonedDragon","SummonedDragonEgg","GoblinCaveTroll","WildFireDrake","MordorAttackTroll","RohanEntBase","RohanEntBirch","MordorShelrob","IsengardSharku","WatcherHead","Wyrm","Idle_Drogoth_WH",
		"BarrowWight",	
	}
elseif SAGE_GAME <= CNC3KW then
	HERO = "NodMetaUnit"
	UnitSelectionList = { "NODAvatar", "AlienAnnihilatorTripod", "SteelTalonsMammoth", "SteelTalonsBehemoth","NodMetaUnit", "SteelTalonsMARV", "AlienEradicatorHexapod", "AlienMastermind", "NODCommando", "GDICommando" }
elseif SAGE_GAME <= CNCRA3U then
	HERO = "AlliedCommandoTech1"--"JapanYurikoTech3"
	UnitSelectionList = { "AlliedAntiVehicleVehicleTech3", "AlliedCommandoTech1", "JapanCommandoTech1", "SovietCommandoTech1" }
elseif SAGE_GAME == CNC4 then

end

ROUNDS = 3
FOLLOW_UNIT = false

HEROES = {}
ScoreList = {}
HeroAliveState = {}

function RestartGamemode()
	ExecuteAction("SHOW_MILITARY_CAPTION", "NAME:NextTurn", 10)
	CURRENT_ROUND = CURRENT_ROUND + 1
	HeroesAlive = getn(Players)
	for i=1,getn(Teams),1 do
		local UnitName = GetUnitName()
		if Teams[i] == HumanTeams[1] then
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, HERO, Teams[i], GetPlayerStartWaypointByTeam(Teams[i]))   
		else 
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, UnitSelectionList[random(getn(UnitSelectionList))], Teams[i], GetPlayerStartWaypointByTeam(Teams[i])) 		
		end
		HEROES[GetPlayerByTeam(Teams[i])] = UnitName
		HeroAliveState[GetPlayerByTeam(Teams[i])] = true
	end
	if FOLLOW_UNIT and getn(HumanPlayer) <= 1 then 
		ExecuteAction("CAMERA_FOLLOW_NAMED", "MainUnit_" .. HumanPlayers[1], 0, "340")
		ExecuteAction("LOCK_CAMERA_ANGLE_AND_HEIGHT",0)	 
	end
	SetScriptTimer(2,'SetInfoCounters()')
	SetScriptTimer(2,'ExecuteAction("PLAY_SOUND_EFFECT", "Aeva_UnitReady")')
end

function InitGamemode()
	OverwriteVictoryCondition()
	for i=1,getn(Players),1 do
		ExecuteAction("PLAYER_SET_BASE_POWER", Players[i], 10000)
		ExecuteAction("PLAYER_SET_MONEY", Players[i], 0)
		ScoreList[Players[i]] = 0
	end
	if SAGE_GAME >= CNC3TW then
		for ObjectIndex,Object in globals() do
			if strfind(ObjectIndex, "ObjID") and strfind(ObjectDescription(Object), "BASE_FLAG") then
				ExecuteAction("NAMED_DELETE", Object) 		  
			end
		end	
	else 
		RemoveStartingUnits()	
	end
	--Alternative:
	-- for i=1,getn(Players),1 do
		-- local BaseRef = GetUnitName
		-- ExecuteAction("FIND_HOME_BASE_OF_PLAYER", Players[i], BaseRef, 0)
		-- ExecuteAction("NAMED_DELETE", UNIT_REF)
	-- end
	CURRENT_ROUND = 0
	RestartGamemode()
	SetScriptTimer(5,HeroVsHero_Coroutine,-1)
end

function AICoroutine()
	for i=1,getn(AITeams),1 do
		--ExecuteAction("ATTACK_MOVE_TEAM_TO", AITeams[i], GetPlayerStartWaypointByTeam(AITeams[random(getn(AITeams))]))
		--ExecuteAction("TEAM_ATTACK_TEAM", AITeams[i], AITeams[random(getn(AITeams))])
		--ExecuteAction("TEAM_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", AITeams[i], Unit_vs_Unit_Selection)		  
		ExecuteAction("TEAM_HUNT", AITeams[i]) 
	end
end

function GetBoolNum(var)
	if var then return 1 else return 0 end
end

function SetInfoCounters()
	for i=getn(Players),1,-1 do 
		--SetCounter("HEALTH_COUNTER_" .. Players[i], GetHealth(HEROES[Players[i]]), "TOOLTIP:MaxHealth")
		SetCounter("ALIVESTATE_COUNTER_" .. Players[i], GetBoolNum(HeroAliveState[Players[i]]), "GUI:PlayerAlive")
		SetCounter("SCORE_COUNTER_" .. Players[i], ScoreList[Players[i]], "GUI:Score")
		SetCounter("PLAYER_INDEX_COUNTER_" .. Players[i], GetPlayerIndex(Players[i]), "GUI:Players:")
	end
	SetCounter("CURRENT_ROUND_COUNTER", CURRENT_ROUND, "MG:Turn")
end

function RandomCrateSpawner()
	Harms = { "GDIMine", "MarkedOfKaneMagneticMine", "NODExplosiveCharge", "NODTechBuildingBoobyTrap" }
	Crates = { "HealCrateMP", "MoneyCrateMP", "VeterancyCrateMP" } --"HealCrate", "SalvageCrate", "ShroudCrate", "UnitCrate", "VeterancyCrate" }
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), Crates[random(getn(Crates))], NeutralTeam, {random(MapSizeX*0.1,MapSizeX*0.9),random(MapSizeY*0.1,MapSizeY*0.9),MAP_HEIGHT}, 0) 
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), Harms[random(getn(Harms))], NeutralTeam, {random(MapSizeX*0.1,MapSizeX*0.9),random(MapSizeY*0.1,MapSizeY*0.9),MAP_HEIGHT}, 0) 
end

function HeroVsHero_Coroutine()
	for i=1,getn(Players),1 do
		if HeroAliveState[Players[i]] and not EvaluateCondition("NAMED_NOT_DESTROYED", HEROES[Players[i]]) then
			HeroAliveState[Players[i]] = false
			HeroesAlive = HeroesAlive - 1
			SetInfoCounters()
		end 
	end
	if HeroesAlive <= 1 then
		for i=1,getn(Players),1 do 
			for i=1,getn(Players),1 do 
				if HeroAliveState[Players[i]] then
					ScoreList[Players[i]] = ScoreList[Players[i]] + 1
					ExecuteAction("NAMED_DELETE", HEROES[Players[i]])
				end
			end		
			if ScoreList[Players[i]] >= 3 then
				SetWinnerPlayer(Players[i])
				DeleteScriptTimerAction(HeroVsHero_Coroutine)
				return
			end
		end
		RestartGamemode()
	end
	AICoroutine()
	RandomCrateSpawner()
end

InitGamemode()