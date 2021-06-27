NAME	 	= "Art of Defense Advanced"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Defend yourself against waves of enemies"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

NULL = 0
CNCGEN = 1;
CNCZH = 2;
BFME1 = 3;
BFME2 = 4;
BFME2ROTWK = 5;
CNC3TW = 6;
CNC3KW = 7;
CNCRA3 = 8;
CNCRA3U = 9;
CNC4 = 10;

OBJECT_LIST = {
	[CNCZH] = 
	{
		{--RESERVED SPECIAL Level/DIFFICULTY UNIT TABLES
		
		},
		{--Level/DIFFICULTY 1 UNIT TABLES
			{"AmericaVehicleDozer","AirF_AmericaVehicleDozer","Lazr_AmericaVehicleDozer","SupW_AmericaVehicleDozer","ChinaVehicleDozer","Infa_ChinaVehicleDozer","Nuke_ChinaVehicleDozer","Tank_ChinaVehicleDozer","GLAVehicleRadarVan","Demo_GLAVehicleRadarVan","Slth_GLAVehicleRadarVan","Chem_GLAVehicleRadarVan"},
		},
		{--Level/DIFFICULTY 2 UNIT TABLES
			{"AmericaInfantryRanger","AirF_AmericaInfantryRanger","Lazr_AmericaInfantryRanger","SupW_AmericaInfantryRanger","AmericaInfantryMissileDefender","AirF_AmericaInfantryMissileDefender","Lazr_AmericaInfantryMissileDefender","SupW_AmericaInfantryMissileDefender","AmericaInfantryPilot","ChinaInfantryRedguard","Infa_ChinaInfantryMiniGunner","Nuke_ChinaInfantryRedguard","Tank_ChinaInfantryRedguard","ChinaInfantryTankHunter","Infa_ChinaInfantryTankHunter","Nuke_ChinaInfantryTankHunter","Tank_ChinaInfantryTankHunter","GLAInfantryRebel","Demo_GLAInfantryRebel","Slth_GLAInfantryRebel","Chem_GLAInfantryRebel","GLAInfantryHijacker","Demo_GLAInfantryHijacker","Slth_GLAInfantryHijacker","GLAInfantrySaboteur","Demo_GLAInfantrySaboteur","Slth_GLAInfantrySaboteur","GLAInfantryTunnelDefender","Demo_GLAInfantryTunnelDefender","Slth_GLAInfantryTunnelDefender","Chem_GLAInfantryTunnelDefender","GLAInfantryAngryMobPistol01","Demo_GLAInfantryAngryMobPistol01","Slth_GLAInfantryAngryMobPistol01","Chem_GLAInfantryAngryMobPistol01","GLAInfantryAngryMobPistol03","Demo_GLAInfantryAngryMobPistol03","Slth_GLAInfantryAngryMobPistol03","Chem_GLAInfantryAngryMobPistol03","GLAInfantryAngryMobPistol05","Demo_GLAInfantryAngryMobPistol05","Demo_GLAInfantryAngryMobPistol05","Chem_GLAInfantryAngryMobPistol05","GLAInfantryAngryMobRock02","Demo_GLAInfantryAngryMobRock02","Slth_GLAInfantryAngryMobRock02","Chem_GLAInfantryAngryMobRock02","GLAInfantryAngryMobRock04","Demo_GLAInfantryAngryMobRock04","Slth_GLAInfantryAngryMobRock04","Chem_GLAInfantryAngryMobRock04"},
			{"AmericaVehicleHumvee","AirF_AmericaVehicleHumvee","Lazr_AmericaVehicleHumvee","SupW_AmericaVehicleHumvee","ChinaTankGattling","Infa_ChinaTankGattling","Nuke_ChinaTankGattling","Tank_ChinaTankGattling","GLAVehicleQuadCannon","Demo_GLAVehicleQuadCannon","Slth_GLAVehicleQuadCannon","Chem_GLAVehicleQuadCannon"},
		},
		{--Level/DIFFICULTY 3 UNIT TABLES
			{"AmericaVehicleMedic","AirF_AmericaVehicleMedic","Lazr_AmericaVehicleMedic","SupW_AmericaVehicleMedic","ChinaVehicleTroopCrawler","Infa_ChinaVehicleTroopCrawler","Nuke_ChinaVehicleTroopCrawler","Tank_ChinaVehicleTroopCrawler","GLAVehicleTechnical","Demo_GLAVehicleTechnical","Slth_GLAVehicleTechnical","Chem_GLAVehicleTechnical","GLAVehicleBombTruck","Demo_GLAVehicleBombTruck","Slth_GLAVehicleBombTruck","Chem_GLAVehicleBombTruck","GLAVehicleBattleBus","Demo_GLAVehicleBattleBus","Slth_GLAVehicleBattleBus","Chem_GLAVehicleBattleBus","GLAVehicleCombatBike","Demo_GLAVehicleCombatBike","Slth_GLAVehicleCombatBike","Chem_GLAVehicleCombatBike"},	
		},
		{--Level/DIFFICULTY 4 UNIT TABLES
			{"AmericaTankCrusader","Lazr_AmericaTankCrusader","SupW_AmericaTankCrusader","AmericaTankPaladin","Lazr_AmericaTankPaladin","SupW_AmericaTankPaladin","AmericaTankAvenger","AirF_AmericaTankAvenger","Lazr_AmericaTankAvenger","SupW_AmericaTankAvenger","AmericaTankMicrowave","AirF_AmericaTankMicrowave","SupW_AmericaTankMicrowave","ChinaTankOverlord","Nuke_ChinaTankOverlord","Tank_ChinaTankEmperor","ChinaTankBattleMaster","Nuke_ChinaTankBattleMaster","Tank_ChinaTankBattleMaster","ChinaTankDragon","Infa_ChinaTankDragon","Nuke_ChinaTankDragon","Tank_ChinaTankDragon","ChinaTankGattling","Infa_ChinaTankGattling","Nuke_ChinaTankGattling","Tank_ChinaTankGattling","ChinaTankECM","Infa_ChinaTankECM","Nuke_ChinaTankECM","Tank_ChinaTankECM","GLATankScorpion","Demo_GLATankScorpion","Slth_GLATankScorpion","Chem_GLATankScorpion","GLATankMarauder","Demo_GLATankMarauder","Slth_GLATankMarauder","Chem_GLATankMarauder","GLAVehicleToxinTruck","Demo_GLAVehicleToxinTruck","Slth_GLAVehicleToxinTruck","Chem_GLAVehicleToxinTruck"},
			{"AmericaJetRaptor","AirF_AmericaJetRaptor","SupW_AmericaJetRaptor","AmericaJetStealthFighter","AirF_AmericaJetStealthFighter","Lazr_AmericaJetStealthFighter","SupW_AmericaJetStealthFighter","AmericaJetAurora","AirF_AmericaJetAurora","SupW_AmericaJetAurora","AmericaVehicleComanche","AirF_AmericaVehicleComanche","Lazr_AmericaVehicleComanche","SupW_AmericaVehicleComanche","ChinaJetMIG","Infa_ChinaJetMIG","Nuke_ChinaJetMIG","Tank_ChinaJetMIG","ChinaVehicleHelix","Infa_ChinaVehicleHelix","Nuke_ChinaVehicleHelix","Tank_ChinaVehicleHelix"},
			{"AmericaInfantryColonelBurton","AirF_AmericaInfantryColonelBurton","Lazr_AmericaInfantryColonelBurton","SupW_AmericaInfantryColonelBurton","ChinaInfantryBlackLotus","Infa_ChinaInfantryBlackLotus","Nuke_ChinaInfantryBlackLotus","Tank_ChinaInfantryBlackLotus","GLAInfantryJarmenKell","Demo_GLAInfantryJarmenKell","Slth_GLAInfantryJarmenKell","Chem_GLAInfantryJarmenKell","AmericaInfantryPathfinder","AirF_AmericaInfantryPathfinder","Lazr_AmericaInfantryPathfinder","SupW_AmericaInfantryPathfinder","AmericaVehicleSentryDrone","AirF_AmericaVehicleSentryDrone","Lazr_AmericaVehicleScoutDrone","SupW_AmericaVehicleSentryDrone","ChinaVehicleListeningOutpost","Infa_ChinaVehicleListeningOutpost","Nuke_ChinaVehicleListeningOutpost","Tank_ChinaVehicleListeningOutpost"},		
		},
		{--Level/DIFFICULTY 5 UNIT TABLES
			{"AmericaVehicleTomahawk","AirF_AmericaVehicleTomahawk","Lazr_AmericaVehicleTomahawk","SupW_AmericaVehicleTomahawk","ChinaVehicleInfernoCannon","Infa_ChinaVehicleInfernoCannon","Nuke_ChinaVehicleInfernoCannon","ChinaVehicleNukeLauncher","Infa_ChinaVehicleNukeLauncher","Nuke_ChinaVehicleNukeLauncher","GLAVehicleRocketBuggy","Demo_GLAVehicleRocketBuggy","Slth_GLAVehicleRocketBuggy","Chem_GLAVehicleRocketBuggy","GLAVehicleScudLauncher","Demo_GLAVehicleScudLauncher","Slth_GLAVehicleScudLauncher","Chem_GLAVehicleScudLauncher"},
		},
	},
	[BFME2ROTWK] = 
	{
		{--RESERVED SPECIAL Level/DIFFICULTY UNIT TABLES
		
		},
		{--Level/DIFFICULTY 1 UNIT TABLES
			{"DwarvenPorter","ElvenPorter","IsengardPorter","MenPorter","MordorPorter","WildPorter"},
		},
		{--Level/DIFFICULTY 2 UNIT TABLES
			{"GondorFighterHorde","GondorFighterHordeBlock","GondorFighterArcherComboHorde","GondorFighterRangerComboHorde","GondorFighterTrebuchetComboHorde","RohanPeasantHorde","RohanPeasantArcherComboHorde","IsengardFighterHorde","IsengardFighterHordeBlock","IsengardFighterCrossbowComboHorde","IsengardFighterLadderComboHorde","IsengardFighterPikemanComboHorde","IsengardBeserker","MordorFighterHorde","MordorFighterArcherComboHorde","MordorFighterTowerComboHorde","MordorHaradrimHorde","MordorHaradrimHordeWedge","MordorEasterlingHorde","MordorEasterlingPorcupineHorde","MordorGoblinFighterHorde","GondorBarracks","IsengardUrukPit","MordorOrcPit","MordorHaradrimPalace","RohanFarm"},
			{"GondorArcherHorde","GondorArcherHordeWedgeFormation","GondorFighterArcherComboHorde","GondorTowerShieldGuardHorde","GondorTowerShieldGuardHordeWallFormation","GondorTowerArcherComboHorde","GondorKnightTowerShieldGuardComboHorde","GondorTowerRangerComboHorde","GondorTowerTrebuchetComboHorde","GondorRangerHorde","GondorRangerHordeAmbushFormation","GondorFighterRangerComboHorde","IsengardUrukCrossbowHorde","IsengardUrukCrossbowHordeWedgeFormation","IsengardFighterCrossbowComboHorde","IsengardCrossbowPikemanComboHorde","IsengardPikemanHorde","IsengardPikemanHordePorcupine","IsengardFighterPikemanComboHorde","MordorArcherHorde","MordorFighterArcherComboHorde","MordorGoblinArcherHorde","RohanArcherHorde","RohanArcherHordeSkirmishFormation","RohanPeasantArcherComboHorde","RohanElvenWarriorHorde","RohanElvenWarriorHorde_Summoned","RohanElvenWarriorDoubleHorde"},
		},
		{--Level/DIFFICULTY 3 UNIT TABLES
			{"GondorArcherHorde","GondorFighterHorde","GondorTowerShieldGuardHorde","GondorKnightHorde","GondorRangerHorde","IsengardUrukCrossbowHorde","IsengardBallista","IsengardFighterHorde","IsengardPikemanHorde","IsengardWargRiderHorde","MordorArcherHorde","MordorCatapult","MordorCaveTroll","MordorEasterlingHorde","MordorFighterHorde","MordorHaradrimHorde","MordorMumakil","MordorSiegeTower","RohanArcherHorde","RohanRohirrimHorde","RohanElvenWarriorHorde","RohanPeasantHorde"},
			{"MordorWitchKingOnFellBeast","MordorFellBeast","GondorGwaihir"},
			{"GondorArcherHorde","GondorFighterHorde","GondorTowerShieldGuardHorde","GondorKnightHorde","GondorRangerHorde","IsengardUrukCrossbowHorde","IsengardFighterHorde","IsengardPikemanHorde","IsengardWargRiderHorde","MordorArcherHorde","MordorEasterlingHorde","MordorFighterHorde","MordorHaradrimHorde","RohanArcherHorde","RohanRohirrimHorde","RohanElvenWarriorHorde","RohanPeasantHorde"},

		},
		{--Level/DIFFICULTY 4 UNIT TABLES
			{"GondorBoromir","GondorAragorn","GondorAragornMP","GondorGandalfWhite","GondorGandalfCavalry","RohanFrodo","RohanGimli","RohanLegolas","RohanMerry","RohanPippin","RohanSam"},
			{"GiantSpider","GiantSpider_Slaved","GiantSpider_Small","MordorGoblinSwordsman_Slaved","MordorGoblinArcher_Slaved","CaveTroll_Slaved","IsengardWargRider_Slaved","CaveTrollLair","MoriarGoblinLair","WargLair","NeutralWarg"},
			{"GondorKnightHorde","GondorKnightHordeWedgeFormation","GondorKnightFighterComboHorde","GondorKnightTowerShieldGuardComboHorde","IsengardWargRiderHorde","IsengardWargRiderHordeLineFormation","MordorCaveTroll","MordorMountainTroll","MordorDrummerTroll","MordorMumakil","RohanRohirrimHorde","RohanRohirrimHordeWedgeFormation","RohanRohirrimPeasantComboHorde","RohanRohirrimArcherHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimArcherPeasantComboHorde","GondorKnightHorde","GondorKnightHordeWedgeFormation","GondorKnightFighterComboHorde","GondorKnightTowerShieldGuardComboHorde","IsengardWargRiderHorde","IsengardWargRiderHordeLineFormation","MordorCaveTroll","MordorMountainTroll","MordorDrummerTroll","MordorMumakil","RohanRohirrimHorde","RohanRohirrimHordeWedgeFormation","RohanRohirrimPeasantComboHorde","RohanRohirrimArcherHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimArcherPeasantComboHorde"},
			{"MordorSiegeTower","MordorBatteringRam","IsengardBatteringRam","IsengardExplosiveMine","IsengardSiegeLadder","RohanEntBirch","RohanEntBirch_Summoned","RohanEntFir","RohanEntFir_Summoned","RohanTreeBerd","MordorSiegeWorks","IsengardSiegeWorks","EntMoot"},
			{"GondorTrebuchet","GondorTrebuchet","IsengardBallista","IsengardBallista","MordorCatapult","MordorCatapult","GondorWorkshop","IsengardSiegeWorks","MordorSiegeWorks"},
		},
		{--Level/DIFFICULTY 5 UNIT TABLES
			{"MordorWitchKingOnFellBeast","MordorFellBeast","IsengardLurtz","IsengardSaruman","GondorAragorn","GondorAragornMP","GondorBoromir","GondorFaramir","GondorGandalfWhite","GondorGandalfCavalry","RohanEomer","RohanEomerCavalry","RohanEowyn","RohanEowynDisguised","RohanFrodo","RohanGimli","RohanLegolas","RohanMerry","RohanPippin","RohanSam","RohanTheoden","RohanTheodenCavalry","RohanTreeBerd"},
			{"MordorSiegeTower","MordorBatteringRam","IsengardBatteringRam","IsengardExplosiveMine","IsengardSiegeLadder","RohanEntBirch","RohanEntBirch_Summoned","RohanEntFir","RohanEntFir_Summoned","RohanTreeBerd"},
			{"MordorDrummerTroll","MordorFellBeast","MordorMountainTroll","MordorMumakil","MordorWitchKingOnFellBeast","RohanTreeBerd","RohanEntAsh","RohanEntBirch","RohanEntFir"},
		},
	},
	[CNC3TW] = 
	{
		{--RESERVED SPECIAL Level/DIFFICULTY UNIT TABLES
		
		},
		{--Level/DIFFICULTY 1 UNIT TABLES
			{ "GDIRig", "AlienAssimilator","GDIEngineer","NODSaboteur" },
		},
		{--Level/DIFFICULTY 2 UNIT TABLES
			{ "GDIAPC", "NODScorpionBuggy" },	
			{ "NODAttackBike", "NODScorpionBuggy", "GDIPitbull", "NODRaiderTank", "AlienGunWalker", "AlienSeekerTank", "GDIAPC" },
			{ "GDIRifleSoldierSquad", "GDIMissileSoldierSquad", "NODMilitantSquad", "NODMilitantRocketSquad", "AlienBuzzers", "AlienRazorDroneSquad" },
			{ "GDIPitbull","NODStealthTank","AlienSeekerTank" },
		},
		{--Level/DIFFICULTY 3 UNIT TABLES
			{ "AlienAssimilator","AlienShockTrooperSquad", "NODBlackHandSquad", "NODShadowSquad", "NodFanaticSquad", "GDIZoneTrooperSquad","GDIGrenadeSoldierSquad" },
			{ "NODStealthTank", "GDIPredator", "AlienDevourerTank", "AlienCorrupter" },
			{ "NODVenom", "GDIV35Ox", "Traveler59Stormrider", "GDIOrca", "AlienStormrider" },
		},
		{--Level/DIFFICULTY 4 UNIT TABLES
			{ "AlienMastermind", "NODCommando", "GDICommando" },
			{ "NODAvatar","AlienAnnihilatorTripod","GDIMammoth","GDIJuggernaught" },
			{ "AlienDevastatorWarship","AlienPlanetaryAssaultCarrier", "GDIFireHawk", "NODVertigo"},
			{ "NODBeamCannon","GDIJuggernaught","AlienDevastatorWarship"},
		},
		{--Level/DIFFICULTY 5 UNIT TABLES
			{ "AlienMothership" },
		},
	},
	[CNC3KW] = 
	{
		{--RESERVED SPECIAL Level/DIFFICULTY UNIT TABLES
		
		},
		{--Level/DIFFICULTY 1 UNIT TABLES
			{ "GDIRig","SteelTalonsRepairAPC", "AlienAssimilator","GDIEngineer","NODSaboteur" },
		},
		{--Level/DIFFICULTY 2 UNIT TABLES
			{ "GDIRifleSoldierSquad", "GDIMissileSoldierSquad", "NODMilitantSquad", "NODMilitantRocketSquad", "BlackHandConfessorSquad", "AlienBuzzers", "AlienRazorDroneSquad" },
			{ "NODAttackBike", "AlienCustomizableVehicle","NODScorpionBuggy", "SteelTalonsWolverine", "GDIPitbull", "SteelTalonsAPC", "NODRaiderTank", "AlienGunWalker", "Reaper17ShardWalker","AlienSeekerTank" },
			{ "SteelTalonsAAScout","NODStealthTank","AlienSeekerTank" },
			{ "SteelTalonsWolverine", "NODScorpionBuggy" },
		},
		{--Level/DIFFICULTY 3 UNIT TABLES
			{ "MarkedOfKaneVenom", "ZOCOMHammerhead", "Traveler59Stormrider", "GDIFireHawk","GDIOrca","NODVertigo", "GDIV35Ox" },
			{ "MarkedOfKaneBeamCannon", "BlackHandFlameTank", "NODStealthTank", "GDIPredator", "SteelTalonsTitan", "AlienDevourerTank", "AlienCorrupter","ZOCOMImprovedSonicTank" },
			{ "AlienShockTrooperSquad", "Traveler59Stalker", "BlackHandBlackHandSquad", "NODShadowSquad", "NodFanaticSquad","ZOCOMZoneRaiderSquad", "GDIZoneTrooperSquad","GDIGrenadeSoldierSquad","MarkedOfKaneImprovedCyborgInfantrySquad" },
		},
		{--Level/DIFFICULTY 4 UNIT TABLES
			{ "Traveler59DevastatorWarship", "Traveler59PlanetaryAssaultCarrier" },
			{ "BlackHandMobileArtillery","GDIJuggernaught","SteelTalonsBehemoth", "Traveler59DevastatorWarship", "NODBeamCannon"},
			{ "NODAvatar", "BlackHandCustomWarmech","Reaper17AnnihilatorTripod","SteelTalonsMammoth","GDIJuggernaught","SteelTalonsBehemoth" },
			{ "AlienMastermind", "NODCommando", "GDICommando" },
		},
		{--Level/DIFFICULTY 5 UNIT TABLES
			{ "NodMetaUnit", "SteelTalonsMARV", "AlienEradicatorHexapod","AlienMothership" },
		},
	},
	[CNCRA3] = 
	{
		{--RESERVED SPECIAL Level/DIFFICULTY UNIT TABLES
		
		},
		{--Level/DIFFICULTY 1 UNIT TABLES
			{"AlliedMiner", "SovietMCV", "JapanMiner"},
		},
		{--Level/DIFFICULTY 2 UNIT TABLES
			{"AlliedAntiInfantryInfantry","AlliedAntiVehicleInfantry","AlliedCommandoTech1","AlliedEngineer","AlliedInfiltrationInfantry","AlliedScoutInfantry","AlliedLegionnaireInfantry"},
			{"JapanAntiInfantryInfantry","JapanAntiVehicleInfantry","JapanAntiVehicleInfantryTech3","JapanCommandoTech1","JapanEngineer","JapanInfiltrationInfantry","JapanScoutInfantry","JapanArcherInfantry"},
			{"SovietAntiInfantryInfantry","SovietAntiVehicleInfantry","SovietCommandoTech1","SovietEngineer","SovietHeavyAntiVehicleInfantry","SovietScoutInfantry","SovietDesolatorInfantry","SovietChiefEngineer"},
		},
		{--Level/DIFFICULTY 3 UNIT TABLES
			--["AIR_1"] = 
			{"AlliedAntiGroundAircraft","AlliedBomberAircraft","AlliedFighterAircraft","AlliedSupportAircraft","AlliedGunshipAircraft", "SovietAntiGroundAircraft","SovietBomberAircraft","SovietFighterAircraft"},
			--["NAVY"]  = 
			{"AlliedAntiAirShip","AlliedAntiNavalScout","AlliedAntiNavyShipTech1","AlliedAntiStructureShip","AlliedMCV_Naval","AlliedMiner_Naval","AlliedAntiInfantryVehicle","AlliedArtilleryVehicle","SovietAntiAirShip","SovietAntiNavyShipTech1","SovietAntiNavyShipTech2","SovietAntiStructureShip","SovietMCV_Naval","SovietMiner_Naval","SovietSurveyor_Naval","JapanAntiAirShip","JapanAntiStructureShip","JapanAntiVehicleShip","JapanMCV_Naval","JapanMiner_Naval","JapanNavyScoutShip","JapanFortressShip"},
		},
		{--Level/DIFFICULTY 4 UNIT TABLES
			{"AlliedAntiAirVehicleTech1","AlliedAntiStructureVehicle","AlliedAntiVehicleVehicleTech1","AlliedAntiVehicleVehicleTech3","AlliedMCV","AlliedAntiInfantryVehicle_Ground","AlliedArtilleryVehicle","AlliedFutureTank"},
			{"SovietAntiInfantryVehicle","SovietAntiStructureVehicle","SovietAntiVehicleVehicleTech1","SovietAntiVehicleVehicleTech3","SovietMCV","SovietMiner","SovietScoutVehicle","SovietSurveyor","SovietGrinderVehicle","SovietHeavyWalkerVehicle","SovietMortarcycle"},
			{"JapanAntiAirVehicleTech1","JapanAntiInfantryVehicle","JapanAntiStructureVehicle","JapanAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech3","JapanLightTransportVehicle","JapanMCV","JapanMiner","JapanSentinelVehicle"},
		},
		--{--Level/DIFFICULTY 5 UNIT TABLES

		--},
	},
	[CNCRA3U] = 
	{
		{--RESERVED SPECIAL Level/DIFFICULTY UNIT TABLES
		
		},
		{--Level/DIFFICULTY 1 UNIT TABLES
			{"AlliedMiner", "SovietMCV", "JapanMiner"},
		},
		{--Level/DIFFICULTY 2 UNIT TABLES
			{"AlliedAntiInfantryInfantry","AlliedAntiVehicleInfantry","AlliedCommandoTech1","AlliedEngineer","AlliedInfiltrationInfantry","AlliedScoutInfantry","AlliedLegionnaireInfantry"},
			{"JapanAntiInfantryInfantry","JapanAntiVehicleInfantry","JapanAntiVehicleInfantryTech3","JapanCommandoTech1","JapanEngineer","JapanInfiltrationInfantry","JapanScoutInfantry","JapanArcherInfantry"},
			{"SovietAntiInfantryInfantry","SovietAntiVehicleInfantry","SovietCommandoTech1","SovietEngineer","SovietHeavyAntiVehicleInfantry","SovietScoutInfantry","SovietDesolatorInfantry","SovietChiefEngineer"},
		},
		{--Level/DIFFICULTY 3 UNIT TABLES
			--["AIR_1"] = 
			{"AlliedAntiGroundAircraft","AlliedBomberAircraft","AlliedFighterAircraft","AlliedSupportAircraft","AlliedGunshipAircraft", "SovietAntiGroundAircraft","SovietBomberAircraft","SovietFighterAircraft"},
			--["NAVY"]  = 
			{"AlliedAntiAirShip","AlliedAntiNavalScout","AlliedAntiNavyShipTech1","AlliedAntiStructureShip","AlliedMCV_Naval","AlliedMiner_Naval","AlliedAntiInfantryVehicle","AlliedArtilleryVehicle","SovietAntiAirShip","SovietAntiNavyShipTech1","SovietAntiNavyShipTech2","SovietAntiStructureShip","SovietMCV_Naval","SovietMiner_Naval","SovietSurveyor_Naval","JapanAntiAirShip","JapanAntiStructureShip","JapanAntiVehicleShip","JapanMCV_Naval","JapanMiner_Naval","JapanNavyScoutShip","JapanFortressShip"},
		},
		{--Level/DIFFICULTY 4 UNIT TABLES
			{"AlliedAntiAirVehicleTech1","AlliedAntiStructureVehicle","AlliedAntiVehicleVehicleTech1","AlliedAntiVehicleVehicleTech3","AlliedMCV","AlliedAntiInfantryVehicle_Ground","AlliedArtilleryVehicle","AlliedFutureTank"},
			{"SovietAntiInfantryVehicle","SovietAntiStructureVehicle","SovietAntiVehicleVehicleTech1","SovietAntiVehicleVehicleTech3","SovietMCV","SovietMiner","SovietScoutVehicle","SovietSurveyor","SovietGrinderVehicle","SovietHeavyWalkerVehicle","SovietMortarcycle"},
			{"JapanAntiAirVehicleTech1","JapanAntiInfantryVehicle","JapanAntiStructureVehicle","JapanAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech3","JapanLightTransportVehicle","JapanMCV","JapanMiner","JapanSentinelVehicle"},
		},
		{--Level/DIFFICULTY 5 UNIT TABLES
			{"AlliedFutureTank","AlliedArtilleryVehicle","AlliedLegionnaireInfantry","AlliedGunshipAircraft"},
			{"JapanFortressShip","JapanYurikoTech3","JapanSentinelVehicle","JapanIzumi","JapanArcherInfantry"},
			{"SovietDesolatorInfantry","SovietGrinderVehicle","SovietHeavyWalkerVehicle","SovietMortarcycle"},
		},
	}
}
OBJECT_LIST[BFME2] = OBJECT_LIST[BFME2ROTWK] 

WAVE = 1
CurrentRoundLasts = 0
StartDelay = 3--30
TimeBetweenWaves = 10--60
UNITS = {}

SpawnMultiplier = 
{
	["LevelSPECIAL"] = 3,
	["Level1"] = 1.3,
	["Level2"] = 1.1,
	["Level3"] = 1.1,
	["Level4"] = 1.1,
	["Level5"] = 1.1,
}

WAVE_TIMER_TEXT = 
{
	[BFME2] = "SCRIPT:MGErebor_Wavetimer",
	[BFME2ROTWK] = "SCRIPT:MGErebor_Wavetimer",
	[CNC3TW] = "NAME:NextTurn",
	[CNC3KW] = "NAME:NextTurn",
	[CNCRA3] = "NAME:NextTurn",
	[CNCRA3U] = "NAME:NextTurn",
}

WAVE_TEXT = 
{
	[BFME2] = "APT:StrategicHUDTurnNumber",
	[BFME2ROTWK] = "APT:StrategicHUDTurnNumber",
	[CNC3TW] = "MG:Turn",
	[CNC3KW] = "MG:Turn",
	[CNCRA3] = "MG:Turn",
	[CNCRA3U] = "MG:Turn",
}

ENEMIES_TEXT = 
{
	[BFME2] = "",
	[BFME2ROTWK] = "",
	[CNC3TW] = "",
	[CNC3KW] = "",
	[CNCRA3] = "",
	[CNCRA3U] = "",
}

CoroutineTimerActive = false

function RetriggerCoroutine()
	LoseConditionCheck()
	CurrentRoundLasts = CurrentRoundLasts + 1
	if not CoroutineTimerActive then
		if not IsEnemyUnitAlive() or CurrentRoundLasts >= 3*TimeBetweenWaves then
			UNITS = {}
			if SAGE_GAME > CNCZH and not WAVE == 1 then
				SetTimerCounter(TimeBetweenWaves, WAVE_TIMER_TEXT[SAGE_GAME], "WaveTimer")
				SetCounter("CurrentWaveCounter", WAVE, WAVE_TEXT[SAGE_GAME])
			end
			SetScriptTimer(TimeBetweenWaves,Coroutine,1)
			CoroutineTimerActive = true
		end
	end
end

function Coroutine()
	ExecuteAction("DISPLAY_TEXT", "Next Wave: " .. WAVE)
	CoroutineTimerActive = false
	CurrentRoundLasts = 0
	UNITS = {}	
	local LevelSpawner = function(LevelIndex, Multiplier)
		if WAVE >= 0 then
			if not LevelIndex then LevelIndex = 2 end
			if not Multiplier then Multiplier = 1 end
			local RandomSubList = OBJECT_LIST[SAGE_GAME][LevelIndex][random(getn(OBJECT_LIST[SAGE_GAME][LevelIndex]))]
			for i=1,WAVE*Multiplier,1 do
				local RandomUnitType = RandomSubList[random(getn(RandomSubList))]
				local UnitName = "object_" .. tostring(random(9999999))
				tinsert(UNITS, UnitName)
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, RandomUnitType, EnemyTeam, EnemyPlayerWaypoint)
				if SAGE_GAME >= CNC3KW then
					ExecuteAction("UNIT_SET_STANCE", UnitName, 1)
				end
				--ExecuteAction("NAMED_SET_BOOBYTRAPPED", OBJECT_TYPE, UNIT)
			end
		end
	end
	if WAVE >= 0 then LevelSpawner(2, SpawnMultiplier.Level1) end
	if WAVE >= 3 then LevelSpawner(3, SpawnMultiplier.Level2) end
	if WAVE >= 6 then LevelSpawner(4, SpawnMultiplier.Level3) end
	if WAVE >= 8 then LevelSpawner(5, SpawnMultiplier.Level4) end
	if WAVE >= 10 then LevelSpawner(6, SpawnMultiplier.Level5) end
	WAVE = WAVE + 1
	if SAGE_GAME > CNCZH then
		ExecuteAction("SCREEN_SHAKE", SHAKE_INTENSITY["CINE_INSANE"]) 
	end
	AICoroutine()
end

function IsEnemyUnitAlive()
	for i=1,getn(UNITS),1 do
		if not EvaluateCondition("NAMED_DESTROYED", UNITS[i]) then
			return 1
		end
	end
	return false
end

function AICoroutine()
	ExecuteAction("TEAM_HUNT", EnemyTeam) 
	ExecuteAction("MOVE_TEAM_TO", EnemyTeam, LocalPlayerWaypoint)
	ExecuteAction("TEAM_ATTACK_TEAM", EnemyTeam, LocalTeam)
end

function LoseConditionCheck()
	-- if EvaluateCondition("PLAYER_HAS_N_OR_FEWER_BUILDINGS", LocalPlayer, 0) then
		-- ExecuteAction("PLAYER_KILL", LocalPlayer)
	-- end
end

function InitGamemode()
	print("Art of Defense Gamemode")
	if SAGE_GAME <= CNCZH then
		LocalPlayer 	= "player0"
		LocalTeam 		= "teamplayer0"
		LocalPlayerWaypoint = "Player_1_Start"
		EnemyPlayer = "PlyrCivilian"
		EnemyTeam = "teamPlyrCivilian"
		EnemyPlayerWaypoint = "Player_2_Start"
		ExecuteAction("PLAYER_RELATES_PLAYER", EnemyPlayer, LocalPlayer, RELATION_TYPE["Enemy"])
		ExecuteAction("PLAYER_RELATES_PLAYER", LocalPlayer, EnemyPlayer, RELATION_TYPE["Enemy"])
		--set proper waypoints
		for i=0,7,1 do
			if EvaluateCondition("START_POSITION_IS", "player0", i+1) == 1 then
				LocalPlayerWaypoint = "Player_" .. i+1 .. "_Start"
				if i+1 == 1 then
					EnemyPlayerWaypoint = "Player_2_Start"
				else
					EnemyPlayerWaypoint = "Player_" .. i+2 .. "_Start"
				end
				print(EnemyPlayerWaypoint)
			end
		end	
	else
		LocalPlayerWaypoint = GetPlayerStartWaypointByTeam(LocalTeam)
		EnemyPlayer = CreepsPlayer
		EnemyTeam = CreepsTeam
		EnemyPlayerWaypoint = GetFarthestWaypoint(LocalTeam)
		SetTimerCounter(StartDelay+TimeBetweenWaves, WAVE_TIMER_TEXT[SAGE_GAME], "WaveTimer")
		SetCounter("CurrentWaveCounter", WAVE, WAVE_TEXT[SAGE_GAME])
	end
	SetScriptTimer(StartDelay,"SetScriptTimer(1,RetriggerCoroutine,-1)",1)
end

SetScriptTimer(5,InitGamemode,1)