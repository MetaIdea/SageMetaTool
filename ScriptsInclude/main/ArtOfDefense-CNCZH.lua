NAME	 	= "Art Of Defense - CNCZH"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Defeat waves of enemies, endless mode"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

VEHICLE_SELECTION =
{
"AmericaTankCrusader",
"AmericaTankPaladin",
"AmericaVehicleHumvee",
"AmericaVehicleSentryDrone",
"ChinaTankBattleMaster",
"ChinaTankDragon",
"ChinaTankGattling",
"ChinaTankOverlord",
"Infa_ChinaVehicleTroopCrawler",
"GLATankMarauder",
"GLATankScorpion",
"GLAVehicleBombTruck",
"GLAVehicleCombatBike",
"GLAVehicleQuadCannon",
"GLAVehicleTechnical",
"GLAVehicleToxinTruck",
}

VEHICLE =
{
"AirF_AmericaTankAvenger",
"AirF_AmericaTankMicrowave",
"AirF_AmericaVehicleBattleDrone",
"AirF_AmericaVehicleHumvee",
"AirF_AmericaVehicleSentryDrone",
"AirF_AmericaVehicleTomahawk",
"AmericaTankAvenger",
"AmericaTankCrusader",
"AmericaTankMicrowave",
"AmericaTankPaladin",
"AmericaVehicleHumvee",
"AmericaVehicleSentryDrone",
"AmericaVehicleTomahawk",
"Boss_TankAvenger",
"Boss_TankDragon",
"Boss_TankGattling",
"Boss_TankOverlord",
"Boss_TankPaladin",
"Boss_VehicleCombatBikeTerrorist",
"Boss_VehicleHelix",
"Boss_VehicleRocketBuggy",
"Boss_VehicleSentryDrone",
"Boss_VehicleTomahawk",
"Chem_GLATankMarauder",
"Chem_GLATankScorpion",
"Chem_GLAVehicleBattleBus",
"Chem_GLAVehicleBombTruck",
"Chem_GLAVehicleCombatBike",
"Chem_GLAVehicleQuadCannon",
"Chem_GLAVehicleRocketBuggy",
"Chem_GLAVehicleScudLauncher",
"Chem_GLAVehicleTechnical",
"Chem_GLAVehicleToxinTruck",
"ChinaTankBattleMaster",
"ChinaTankDragon",
"ChinaTankECM",
"ChinaTankGattling",
"ChinaTankOverlord",
"ChinaVehicleHelix",
"ChinaVehicleInfernoCannon",
"ChinaVehicleListeningOutpost",
"ChinaVehicleNukeLauncher",
"ChinaVehicleTroopCrawler",
"Demo_GLATankMarauder",
"Demo_GLATankScorpion",
"Demo_GLAVehicleBattleBus",
"Demo_GLAVehicleBombTruck",
"Demo_GLAVehicleCombatBike",
"Demo_GLAVehicleQuadCannon",
"Demo_GLAVehicleRocketBuggy",
"Demo_GLAVehicleScudLauncher",
"Demo_GLAVehicleTechnical",
"Demo_GLAVehicleToxinTruck",
"GC_Chem_GLATankScorpion",
"GC_Chem_GLAVehicleBombTruck",
"GC_Chem_GLAVehicleQuadCannon",
"GC_Chem_GLAVehicleScudLauncher",
"GC_Chem_GLAVehicleToxinTruck",
"GC_Slth_GLAVehicleBattleBus",
"GC_Slth_GLAVehicleCombatBike",
"GC_Slth_GLAVehicleQuadCannon",
"GC_Slth_GLAVehicleTechnical",
"GLATankMarauder",
"GLATankScorpion",
"GLAVehicleBattleBus",
"GLAVehicleBombTruck",
"GLAVehicleCombatBike",
"GLAVehicleQuadCannon",
"GLAVehicleRocketBuggy",
"GLAVehicleScudLauncher",
"GLAVehicleTechnical",
"GLAVehicleToxinTruck",
"Infa_ChinaTankDragon",
"Infa_ChinaTankECM",
"Infa_ChinaTankGattling",
"Infa_ChinaVehicleHelix",
"Infa_ChinaVehicleInfernoCannon",
"Infa_ChinaVehicleListeningOutpost",
"Infa_ChinaVehicleNukeLauncher",
"Infa_ChinaVehicleTroopCrawler",
"Lazr_AmericaTankAvenger",
"Lazr_AmericaTankCrusader",
"Lazr_AmericaTankMicrowave",
"Lazr_AmericaTankPaladin",
"Lazr_AmericaVehicleHumvee",
"Lazr_AmericaVehicleSentryDrone",
"Nuke_ChinaTankBattleMaster",
"Nuke_ChinaTankDragon",
"Nuke_ChinaTankECM",
"Nuke_ChinaTankGattling",
"Nuke_ChinaTankOverlord",
"Nuke_ChinaVehicleHelix",
"Nuke_ChinaVehicleInfernoCannon",
"Nuke_ChinaVehicleListeningOutpost",
"Nuke_ChinaVehicleNukeLauncher",
"Nuke_ChinaVehicleTroopCrawler",
"Slth_GLAVehicleBattleBus",
"Slth_GLAVehicleBombTruck",
"Slth_GLAVehicleCombatBike",
"Slth_GLAVehicleQuadCannon",
"Slth_GLAVehicleRocketBuggy",
"Slth_GLAVehicleScudLauncher",
"Slth_GLAVehicleTechnical",
"Slth_GLAVehicleToxinTruck",
"SupW_AmericaTankAvenger",
"SupW_AmericaTankCrusader",
"SupW_AmericaTankMicrowave",
"SupW_AmericaTankPaladin",
"SupW_AmericaVehicleHumvee",
"SupW_AmericaVehicleSentryDrone",
"SupW_AmericaVehicleTomahawk",
"Tank_ChinaTankBattleMaster",
"Tank_ChinaTankDragon",
"Tank_ChinaTankECM",
"Tank_ChinaTankEmperor",
"Tank_ChinaTankGattling",
"Tank_ChinaVehicleTroopCrawler",
}

AIR = 
{
"AirF_AmericaJetAurora",
"AirF_AmericaJetRaptor",
"AirF_AmericaJetStealthFighter",
"AirF_AmericaVehicleBattleDrone",
"AirF_AmericaVehicleComanche",
"AirF_AmericaVehicleSentryDrone",
"AmericaJetAurora",
"AmericaJetRaptor",
"AmericaJetStealthFighter",
"AmericaVehicleComanche",
"AmericaVehicleSentryDrone",
"Boss_JetAurora",
"Boss_JetMIG",
"Boss_JetRaptor",
"Boss_VehicleHelix",
"Boss_VehicleSentryDrone",
"ChinaJetMIG",
"ChinaVehicleHelix",
"Infa_ChinaJetMIG",
"Infa_ChinaVehicleHelix",
"Lazr_AmericaJetAurora",
"Lazr_AmericaJetRaptor",
"Lazr_AmericaJetStealthFighter",
"Lazr_AmericaVehicleComanche",
"Lazr_AmericaVehicleSentryDrone",
"Nuke_ChinaJetMIG",
"Nuke_ChinaVehicleHelix",
"SupW_AmericaJetAurora",
"SupW_AmericaJetRaptor",
"SupW_AmericaJetStealthFighter",
"SupW_AmericaVehicleComanche",
"SupW_AmericaVehicleSentryDrone",
"Tank_ChinaJetMIG",
"Tank_ChinaVehicleHelix",
}

INFANTRY =
{
"AirF_AmericaInfantryColonelBurton",
"AirF_AmericaInfantryMissileDefender",
"AirF_AmericaInfantryPathfinder",
"AirF_AmericaInfantryRanger",
"AmericaInfantryBiohazardTech",
"AmericaInfantryColonelBurton",
"AmericaInfantryMissileDefender",
"AmericaInfantryPathfinder",
"AmericaInfantryRanger",
"Boss_InfantryAngryMobNexus",
"Boss_InfantryBlackLotus",
"Boss_InfantryColonelBurton",
"Boss_InfantryJarmenKell",
"Boss_InfantryPathfinder",
"Boss_InfantryRanger",
"Boss_InfantryTankHunter",
"Chem_GLAInfantryAngryMobNexus",
"Chem_GLAInfantryJarmenKell",
"Chem_GLAInfantryRebel",
"Chem_GLAInfantryTerrorist",
"Chem_GLAInfantryTunnelDefender",
"ChinaInfantryBlackLotus",
"ChinaInfantryRedguard",
"ChinaInfantryTankHunter",
"Demo_GLAInfantryAngryMobNexus",
"Demo_GLAInfantryHijacker",
"Demo_GLAInfantryJarmenKell",
"Demo_GLAInfantryRebel",
"Demo_GLAInfantryTerrorist",
"Demo_GLAInfantryTunnelDefender",
"GC_Chem_GLAInfantryHijacker",
"GC_Chem_GLAInfantryJarmenKell",
"GC_Chem_GLAInfantryRebel",
"GC_Chem_GLAInfantryTerrorist",
"GC_Chem_GLAInfantryTunnelDefender",
"GC_Slth_GLAInfantryHijacker",
"GC_Slth_GLAInfantryJarmenKell",
"GC_Slth_GLAInfantryRebel",
"GC_Slth_GLAInfantrySniper",
"GC_Slth_GLAInfantryTerrorist",
"GC_Slth_GLAInfantryTunnelDefender",
"GLAInfantryAngryMobNexus",
"GLAInfantryHijacker",
"GLAInfantryJarmenKell",
"GLAInfantryRebel",
"GLAInfantrySaboteur",
"GLAInfantryTerrorist",
"GLAInfantryTunnelDefender",
"Infa_ChinaInfantryBlackLotus",
"Infa_ChinaInfantryMiniGunner",
"Infa_ChinaInfantryTankHunter",
"Lazr_AmericaInfantryColonelBurton",
"Lazr_AmericaInfantryMissileDefender",
"Lazr_AmericaInfantryPathfinder",
"Lazr_AmericaInfantryRanger",
"Nuke_ChinaInfantryBlackLotus",
"Nuke_ChinaInfantryRedguard",
"Nuke_ChinaInfantryTankHunter",
"Slth_GLAInfantryAngryMobNexus",
"Slth_GLAInfantryHijacker",
"Slth_GLAInfantryJarmenKell",
"Slth_GLAInfantryRebel",
"Slth_GLAInfantrySaboteur",
"Slth_GLAInfantryTerrorist",
"Slth_GLAInfantryTunnelDefender",
"SupW_AmericaInfantryColonelBurton",
"SupW_AmericaInfantryMissileDefender",
"SupW_AmericaInfantryPathfinder",
"SupW_AmericaInfantryRanger",
"Tank_ChinaInfantryBlackLotus",
"Tank_ChinaInfantryRedguard",
"Tank_ChinaInfantryTankHunter",
}

WAVE = 1
UNITS = {}

NeutralPlayer 	= "" --yes it's void empty
NeutralTeam 	= "team"
CivilianPlayer 	= "PlyrCivilian"
CivilianTeam 	= "teamPlyrCivilian"

LocalPlayer 	= "player0"
LocalTeam 		= "teamplayer0"
LocalPlayerStart = "Player_1_Start"

EnemyPlayerStart = "Player_2_Start"

CurrentRoundLasts = 0

StartDelay = 30
TimeBetweenWaves = 60

function SpawnWave()
	print("SpawnWave")
	CurrentRoundLasts = CurrentRoundLasts + TimeBetweenWaves
	if CurrentRoundLasts >= 3*TimeBetweenWaves then
		UNITS = {}
		CurrentRoundLasts = 0
	end
	if not IsEnemyUnitAlive() then	
		ExecuteAction("DISPLAY_TEXT", "Next Wave: " .. WAVE)
		UNITS = {}
		local SPAWN_MULTIPLIER_INFANTRY = WAVE * 5
		local SPAWN_MULTIPLIER_VEHICLE = WAVE * 1
		local SPAWN_MULTIPLIER_AIR = WAVE * 1
		for i=1,SPAWN_MULTIPLIER_INFANTRY,1 do
			local UnitName = "object_" .. tostring(random(9999999))
			tinsert(UNITS, UnitName)
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, INFANTRY[random(getn(INFANTRY))], CivilianTeam, EnemyPlayerStart)
			--ExecuteAction("NAMED_SET_BOOBYTRAPPED", OBJECT_TYPE, UNIT)
		end
		if WAVE >= 3 then
			for i=1,SPAWN_MULTIPLIER_VEHICLE,1 do
				local UnitName = "object_" .. tostring(random(9999999))
				tinsert(UNITS, UnitName)
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, VEHICLE_SELECTION[random(getn(VEHICLE_SELECTION))], CivilianTeam, EnemyPlayerStart)
			end			
		end
		if WAVE >= 6 then
			for i=1,SPAWN_MULTIPLIER_AIR,1 do
				local UnitName = "object_" .. tostring(random(9999999))
				tinsert(UNITS, UnitName)
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, AIR[random(getn(AIR))], CivilianTeam, EnemyPlayerStart)
			end		
		end
		WAVE = WAVE + 1
	end
	AICoroutine()
end

function IsEnemyUnitAlive()
	for i=1,getn(UNITS),1 do
		if EvaluateCondition("NAMED_NOT_DESTROYED", UNITS[i]) == 1 then
			return 1
		end
	end
	return nil
end

function AICoroutine()
	ExecuteAction("MOVE_TEAM_TO", CivilianTeam, LocalPlayerStart)
	ExecuteAction("TEAM_HUNT", CivilianTeam) 
	ExecuteAction("TEAM_ATTACK_TEAM", CivilianTeam, LocalTeam)
end

function SetWaypoints()
	for i=1,8,1 do
		if EvaluateCondition("START_POSITION_IS", LocalPlayer, i) then
			LocalPlayerStart = "Player_" .. i .. "_Start"
			if i == 1 then
				EnemyPlayerStart = "Player_" .. i+1 .. "_Start"
			else
				EnemyPlayerStart = "Player_" .. i-1 .. "_Start"	
			end
			print(EnemyPlayerStart)
		end
	end	
end

function InitGamemode()
	print("Art of Defense Gamemode")
	SetWaypoints()
	ExecuteAction("PLAYER_RELATES_PLAYER", CivilianPlayer, LocalPlayer, RELATION_TYPE["Enemy"])
	ExecuteAction("PLAYER_RELATES_PLAYER", LocalPlayer, CivilianPlayer, RELATION_TYPE["Enemy"])
	SetScriptTimer(StartDelay,"SetScriptTimer(TimeBetweenWaves,SpawnWave,-1)",1)
end

InitGamemode()