NAME	 	= "CNC4 Essential Tweaks"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNC4"
DESCRIPTION = ""
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

CodeInjected = false
function CodeInjection(self)
	if strfind(ObjectTeamName(self), "teamPlayer_") then --only human players
		ObjectSetModelCondition(self, "INVULNERABLE")		
		ObjectSetObjectStatus(self, "IGNORING_STEALTH")
		ObjectSetObjectStatus(self, "SKIRMISH_AI_DO_NOT_ATTACK")
		ObjectSetObjectStatus(self, "SHIELDED")
		ObjectSetObjectStatus(self, "REFLECTING")
		ObjectSetModelCondition(self, "INVISIBLE_STEALTH")
		ObjectSetObjectStatus(self, "STEALTHED")
		--ObjectSetObjectStatus(self, "UNATTACKABLE")
		for i=1,getn(CNC4_UPGRADE_LIST),1 do 
			ObjectGrantUpgrade(self, CNC4_UPGRADE_LIST[i])
		end	
	end
	if not CodeInjected then
		CodeInjected = true
		dofile("config.lua")
	end
end

CNC4_UPGRADE_LIST =
{
"BasePurchasableUpgrade", "GenericSalvageUpgradeLevel1", "GenericSalvageUpgradeLevel2", "Upgrade_Airborne_Rank01", "Upgrade_Airborne_Rank02", 
"Upgrade_Airborne_Rank03", "Upgrade_AlienFaction", "Upgrade_AllFactionUpgrade", "Upgrade_ArmoredCorps_Rank01", "Upgrade_ArmoredCorps_Rank02", 
"Upgrade_ArmoredCorps_Rank03", "Upgrade_AssaultJump", "Upgrade_AvatarBeamCannon", "Upgrade_AvatarFlamer", "Upgrade_AvatarFlamers", "Upgrade_AvatarInvisibility", 
"Upgrade_AvatarStealthDetect", "Upgrade_BackupSystems", "Upgrade_BlackDisciples_Rank01", "Upgrade_BlackDisciples_Rank02", "Upgrade_BlackDisciples_Rank03", 
"Upgrade_Bloodhounds_Rank01", "Upgrade_Bloodhounds_Rank02", "Upgrade_Bloodhounds_Rank03", "Upgrade_BrutalAIMultiPlayer", "Upgrade_Burrow", 
"Upgrade_Burrow_Mines_Rank1", "Upgrade_Burrow_Mines_Rank2", "Upgrade_Burrow_Mines_Rank3", "Upgrade_CallSupportUpgrade", "Upgrade_CannonFodder_Rank01", 
"Upgrade_CannonFodder_Rank02", "Upgrade_CannonFodder_Rank03", "Upgrade_Crate_Level1", "Upgrade_DefenseClass", "Upgrade_DeployNODVehicleM", 
"Upgrade_Desperation_Boost1", "Upgrade_Desperation_Boost2", "Upgrade_Desperation_Boost3", "Upgrade_Docked", "Upgrade_EasyAIMultiPlayer", 
"Upgrade_EasyAISinglePlayer", "Upgrade_EMP_Reset_Rank01", "Upgrade_EMP_Reset_Rank02", "Upgrade_EMP_Reset_Rank03", "Upgrade_FirstDeploy", 
"Upgrade_FortifyBuilding", "Upgrade_GDI_Defense_Accuracy", "Upgrade_GDI_Defense_CrawlerTech2", "Upgrade_GDI_Defense_CrawlerTech3", 
"Upgrade_GDI_Defense_Range", "Upgrade_GDI_Defense_Reload", "Upgrade_GDI_Defense_Speed", "Upgrade_GDI_Offense_Accuracy", "Upgrade_GDI_Offense_CrawlerTech2", 
"Upgrade_GDI_Offense_CrawlerTech3", "Upgrade_GDI_Offense_Range", "Upgrade_GDI_Offense_Reload", "Upgrade_GDI_Offense_Speed", "Upgrade_GDI_Support_Accuracy", 
"Upgrade_GDI_Support_CrawlerTech2", "Upgrade_GDI_Support_CrawlerTech3", "Upgrade_GDI_Support_Range", "Upgrade_GDI_Support_Reload", 
"Upgrade_GDI_Support_Speed", "Upgrade_GDIAircraftDMassRepair", "Upgrade_GDIAircraftFArmorUp", "Upgrade_GDIAircraftODampen", 
"Upgrade_GDIAircraftQBerzerkerAbility", "Upgrade_GDIAircraftSPhase1", "Upgrade_GDIAircraftSPhase2", "Upgrade_GDIAircraftSPhase3", 
"Upgrade_GDIAircraftSPhase4", "Upgrade_GDIArmoryDoubleGunsTech", "Upgrade_GDIArmoryRailgunTech", "Upgrade_GDIDefenseAdvancedShields", 
"Upgrade_GDIDefenseDozerBlades", "Upgrade_GDIDefenseEnhancedRepair", "Upgrade_GDIDefenseInfantryMedkit", "Upgrade_GDIDefenseStickyBombs", 
"Upgrade_GDIFaction", "Upgrade_GDIInfantryWEMP", "Upgrade_GDIMissileStorm", "Upgrade_GDIOffenseSelfResonator", "Upgrade_GDIStructureABubbleShield", 
"Upgrade_GDIStructureASightAndBuildability", "Upgrade_GDIStructureJSuperweapon_Level1", "Upgrade_GDIStructureJSuperweapon_Level3", 
"Upgrade_GDIStructureJSuperweapon_Level4", "Upgrade_GDIStructureJSuperweapon_Level5", "Upgrade_GDIStructureJSuperweapon_Level6", 
"Upgrade_GDIVehicleAJElectrolysis", "Upgrade_GDIVehicleAKGravityLaser", "Upgrade_GDIVehicleLDepthCharges", "Upgrade_HardAIMultiPlayer", 
"Upgrade_HardAISinglePlayer", "Upgrade_HeavyWalkers_Rank01", "Upgrade_HeavyWalkers_Rank02", "Upgrade_HeavyWalkers_Rank03", "Upgrade_HubAntiAir", 
"Upgrade_HubAntiInfantry", "Upgrade_MediumAIMultiPlayer", "Upgrade_MediumAISinglePlayer", "Upgrade_Mutant_Allies_Rank1", "Upgrade_Mutant_Allies_Rank2", 
"Upgrade_Mutant_Allies_Rank3", "Upgrade_Nod_Defense_Accuracy", "Upgrade_Nod_Defense_CrawlerTech2", "Upgrade_Nod_Defense_CrawlerTech3", 
"Upgrade_Nod_Defense_Range", "Upgrade_Nod_Defense_Reload", "Upgrade_Nod_Defense_Speed", "Upgrade_Nod_Offense_Accuracy", "Upgrade_Nod_Offense_CrawlerTech2", 
"Upgrade_Nod_Offense_CrawlerTech3", "Upgrade_Nod_Offense_Range", "Upgrade_Nod_Offense_Reload", "Upgrade_Nod_Offense_Speed", "Upgrade_Nod_Support_Accuracy", 
"Upgrade_Nod_Support_CrawlerTech2", "Upgrade_Nod_Support_CrawlerTech3", "Upgrade_Nod_Support_Range", "Upgrade_Nod_Support_Reload", "Upgrade_Nod_Support_Speed", 
"Upgrade_NODAircraftJDamageBuff", "Upgrade_NODAircraftMDrones", "Upgrade_NODAircraftNWeaponUpgrade", "Upgrade_NODAircraftOEnhancedResearch", "Upgrade_NODBlackHandUpgrade", 
"Upgrade_NodChargedParticleBeam", "Upgrade_NODCommandoAStealth", "Upgrade_NODConfessorUpgrade", "Upgrade_NODCyberneticLegs", "Upgrade_NODDefenseAdvancedShields", 
"Upgrade_NODDefenseEnhancedRepair", "Upgrade_NODDefenseImprovedStealth", "Upgrade_NODDefenseInfantryEquipment", "Upgrade_NODDefenseInfantryMedkit", 
"Upgrade_NODDefenseTransportBurrow", "Upgrade_NODDozerBlades", "Upgrade_NODEmpBlast", "Upgrade_NODEmpBurst", "Upgrade_NODFaction", "Upgrade_NODGideonsCrawlerShield", 
"Upgrade_NODGideonsCrawlerWeapon", "Upgrade_NODInfantryCVirus", "Upgrade_NODOffenseTrailOfFlame", "Upgrade_NodRedShadowSquadVeterancy", "Upgrade_NODSpiderTank_Tech2", 
"Upgrade_NODStructureAInvisBroadcast", "Upgrade_NODStructureASightAndBuildability", "Upgrade_NODStructureI_Shield_DummyUpgrade", 
"Upgrade_NODStructureJSuperweapon_Level1", "Upgrade_NODStructureJSuperweapon_Level2", "Upgrade_NODStructureJSuperweapon_Level3", 
"Upgrade_NodSuperChargedParticleBeam", "Upgrade_NODSupportImprovedStealth", "Upgrade_NODTechCenterLaserCapacitor", "Upgrade_NODTechCenterTibCoreMissiles", 
"Upgrade_NODVehicleEDefaultUpgrade", "Upgrade_NODVehicleEImprovedStealth", "Upgrade_NODVehicleLCatalystMissile", "Upgrade_NODVehicleLDefaultUpgrade", 
"Upgrade_NodVehicleOWeapons", "Upgrade_NODVehicleX_ShieldOn", "Upgrade_OffenseClass", "Upgrade_OrbitalStrike_Rank01", "Upgrade_OrbitalStrike_Rank02", 
"Upgrade_OrbitalStrike_Rank03", "Upgrade_Orca_Locomotor", "Upgrade_PlayerPower_Repair_Rank1", "Upgrade_PlayerPower_Repair_Rank2", "Upgrade_PlayerPower_Repair_Rank3", 
"Upgrade_PredatorSpam_Active", "Upgrade_ProductionVeterancy_ELITE", "Upgrade_ProductionVeterancy_HEROIC", "Upgrade_ProductionVeterancy_VETERAN", "Upgrade_Rally_Rank01", 
"Upgrade_Rally_Rank02", "Upgrade_Rally_Rank03", "Upgrade_RefractionArmor", "Upgrade_SalvageUser", "Upgrade_ScorpionSpam_Active", "Upgrade_ScorpionStrike_Rank01", 
"Upgrade_ScorpionStrike_Rank02", "Upgrade_ScorpionStrike_Rank03", "Upgrade_Sharpshooters_Rank01", "Upgrade_Sharpshooters_Rank02", "Upgrade_Sharpshooters_Rank03", 
"Upgrade_Supersonic_AirAttack_Rank01", "Upgrade_Supersonic_AirAttack_Rank02", "Upgrade_Supersonic_AirAttack_Rank03", "Upgrade_SupportClass", "Upgrade_Tech_Up_Rank0", 
"Upgrade_Tech_Up_Rank1", "Upgrade_Tech_Up_Rank2", "Upgrade_TiberiumInfusion", "Upgrade_TibVeinDetonation_Rank01", "Upgrade_TibVeinDetonation_Rank02", 
"Upgrade_TibVeinDetonation_Rank03", "Upgrade_Tier1_Aircraft_Rank2", "Upgrade_Tier1_Aircraft_Rank3", "Upgrade_Tier1_Aircraft_Rank4", "Upgrade_Tier1_Assault_Vehicle_Rank2", 
"Upgrade_Tier1_Defenders_Rank2", "Upgrade_Tier1_Defenders_Rank3", "Upgrade_Tier1_Defenders_Rank4", "Upgrade_Tier1_Support_Vehicle_Rank2", "Upgrade_Tier1_Vehicle_Rank2", 
"Upgrade_Tier1_Vehicle_Rank3", "Upgrade_Tier1_Vehicle_Rank4", "Upgrade_Tier2_Aircraft_Rank2", "Upgrade_Tier2_Aircraft_Rank3", "Upgrade_Tier2_Aircraft_Rank4", 
"Upgrade_Tier2_Defenders_Rank2", "Upgrade_Tier2_Defenders_Rank3", "Upgrade_Tier2_Defenders_Rank4", "Upgrade_Tier2_Vehicle_Rank2", "Upgrade_Tier2_Vehicle_Rank3", 
"Upgrade_Tier2_Vehicle_Rank4", "Upgrade_Tier3_Aircraft_Rank2", "Upgrade_Tier3_Aircraft_Rank3", "Upgrade_Tier3_Aircraft_Rank4", "Upgrade_Tier3_Vehicle_Rank2", 
"Upgrade_Tier3_Vehicle_Rank3", "Upgrade_Tier3_Vehicle_Rank4", "Upgrade_UrbanRenewal_01", "Upgrade_UrbanRenewal_02", "Upgrade_UrbanRenewal_03", "Upgrade_Veterancy_ELITE", 
"Upgrade_Veterancy_HEROIC", "Upgrade_Veterancy_VETERAN", "UpgradeGDIStructureB", "UpgradeGDIStructureC", "UpgradeGDIStructureD", "UpgradeGDIStructureE", 
"UpgradeGDIStructureF", "UpgradeGDIStructureG", "UpgradeNODBurrowingStructure", "UpgradeNODStructureB", "UpgradeNODStructureC", "UpgradeNODStructureD", 
"UpgradeNODStructureE", "UpgradeNODStructureF", "UpgradeNODStructureG"
}

TEAM = {
"/team",
"PlyrCivilian/teamPlyrCivilian",
"PlyrCreeps/teamPlyrCreeps",
"ReplayObserver/teamReplayObserver",
"Player_1/teamPlayer_1",
"Player_2/teamPlayer_2",
"Player_3/teamPlayer_3",
"Player_4/teamPlayer_4",
"Player_5/teamPlayer_5",
"Player_6/teamPlayer_6",
"Player_7/teamPlayer_7",
"Player_8/teamPlayer_8",
"Player_1/defaultSkirmishTeamPlayer_1",
"Player_2/defaultSkirmishTeamPlayer_2",
"Player_3/defaultSkirmishTeamPlayer_3",
"Player_4/defaultSkirmishTeamPlayer_4",
"Player_5/defaultSkirmishTeamPlayer_5",
"Player_6/defaultSkirmishTeamPlayer_6",
"Player_7/defaultSkirmishTeamPlayer_7",
"Player_8/defaultSkirmishTeamPlayer_8",
"SkirmishNeutral/teamSkirmishNeutral",
"SkirmishCivilian/teamSkirmishCivilian",
"SkirmishNull/teamSkirmishNull",
"TeamManager1/teamTeamManager1",
"TeamManager2/teamTeamManager2",
"Player/teamPlayer"
}

ALL_OBJECT_LIST = {
	["Object_List_Nod_D_Tier1"] = { "NODInfantryS", "NODInfantryU", "NODInfantryT", "NODInfantryR", "NODVehicleAE", "NODVehicleV", "NODStructureC", "NODStructureB", "NODStructureD", "NODStructureA" },
	["Object_List_Nod_D_Tier2"] = { "NODInfantryB", "NODVehicleM", "NODStructureF", "NODMegaliskObelisk", "NODMegaliskObelisk", "NODStructureE" },
	["Object_List_Nod_D_Tier3"] = { "NODVehicleAF", "NODVehicleI", "NODInfantryV", "NODStructureH", "NODStructureI", "NODStructureJ" },
	["Object_List_Nod_O_Tier1"] = { "NODVehicleC", "NODVehicleA", "NODVehicleB", "NODVehicleW", "NODVehicleT", "NODVehicleAB" },
	["Object_List_Nod_O_Tier2"] = { "NODCommandoA", "NODVehicleF", "NODVehicleE" },
	["Object_List_Nod_O_Tier3"] = { "NODVehicleAC", "NODVehicleAD", "NODVehicleL" },
	["Object_List_Nod_S_Tier1"] = { "NODAircraftL", "NODAircraftD", "NODAircraftJ", "NODVehicleAG" },
	["Object_List_Nod_S_Tier2"] = { "NODAircraftK", "NODInfantryC", "NODVehicleAH" },
	["Object_List_Nod_S_Tier3"] = { "NODAircraftM", "NODAircraftMDrone", "NODAircraftO", "NODAircraftN" },
	["Object_List_GDI_D_Tier1"] = { "GDIInfantryR", "GDIInfantryT", "GDIInfantryS", "GDIInfantryO", "GDIInfantryU", "GDIVehicleY", "GDIStructureC", "GDIStructureB", "GDIStructureD", "GDIStructureA" },
	["Object_List_GDI_D_Tier2"] = { "GDIVehicleM", "GDIInfantryV", "GDIStructureG", "GDIStructureF" },
	["Object_List_GDI_D_Tier3"] = { "GDIInfantryW", "GDIInfantryW", "GDIVehicleG", "GDIStructureH", "GDIStructureI", "GDIStructureJ" },
	["Object_List_GDI_O_Tier1"] = { "GDIVehicleAD", "GDIVehicleA", "GDIVehicleAC", "GDIVehicleV", "GDIVehicleAE", "GDIVehicleAB" },
	["Object_List_GDI_O_Tier2"] = { "GDICommandoA", "GDIVehicleP", "GDIVehicleH" },
	["Object_List_GDI_O_Tier3"] = { "GDIVehicleL", "GDIVehicleD", "GDIVehicleAF" },
	["Object_List_GDI_S_Tier1"] = { "GDIAircraftO", "GDIVehicleAH", "GDIAircraftC", "GDIAircraftA" },
	["Object_List_GDI_S_Tier2"] = { "GDIAircraftQ", "GDIAircraftH", "GDIVehicleAJ", "GDIAircraftP" },
	["Object_List_GDI_S_Tier3"] = { "GDIAircraftF", "GDIAircraftD", "GDIVehicleAK" }
}

CNC4_SPECIALPOWER_LIST =
{
"SpecialPower_AntiRocketMode", "SpecialPower_BuildHeavyMG", "SpecialPower_BuildLightBlast", "SpecialPower_BuildMediumMelee", "SpecialPower_BurrowFromUpgrade", 
"SpecialPower_BurrowStructure", "SpecialPower_BurrowVehicle", "SpecialPower_CancelStructureA", "SpecialPower_CrawlerImmediateUnpack", "SpecialPower_CrawlerPack", 
"SpecialPower_CrawlerSelfDestruct", "SpecialPower_CrawlerUnpack", "SpecialPower_DestroySelf", "SpecialPower_DetonateUpgradeCrystal", "SpecialPower_DropOffUpgradeCrystal", 
"SpecialPower_FireHolyWaterWeapon", "SpecialPower_FireMines", "SpecialPower_FireVirusWeapon", "SpecialPower_GDI_EMPMineDrop", "SpecialPower_GDI_EngineerElite", 
"SpecialPower_GDI_EnhanceConstruction", "SpecialPower_GDI_FirehawkStrike", "SpecialPower_GDI_MassPromotion", "SpecialPower_GDI_MirrorCoat", "SpecialPower_GDI_PersonalShields", 
"SpecialPower_GDI_RapidFire", "SpecialPower_GDI_RepairZone", "SpecialPower_GDI_Resonance", "SpecialPower_GDI_Restoration", "SpecialPower_GDI_ScoutDrone", 
"SpecialPower_GDI_SeismicDisturbance", "SpecialPower_GDI_SonicArtillery", "SpecialPower_GDI_SupplyDrop", "SpecialPower_GDIAircraftDMassRepair", 
"SpecialPower_GDIAircraftDWeaponDamageBuff", "SpecialPower_GDIAircraftDWeaponDamageDebuff", "SpecialPower_GDIAircraftFArmorUp", "SpecialPower_GDIAircraftH_ReturnToProducer", 
"SpecialPower_GDIAircraftODampenROFDebuff", "SpecialPower_GDIAircraftOPurgeBuffs", "SpecialPower_GDIAircraftOPurgeBuffsTrigger", "SpecialPower_GDIAircraftQBezerkAbility", 
"SpecialPower_GDIBuildStructureA", "SpecialPower_GDICommander_3_2_ToggleWeapons", "SpecialPower_GDICommander_3_2_TriggerJumpJets", "SpecialPower_GDICommando_TriggerJumpJets", 
"SpecialPower_GDICommandoASatchelCharge", "SpecialPower_GDIDefenseInfantry_Sprint", "SpecialPower_GDIDefenseInfantry_TriggerJumpJets", "SpecialPower_GDIInfantryTDeploy", 
"SpecialPower_GDIInfantryW_TriggerJumpJets", "SpecialPower_GDIStructureFRocketBarrage", "SpecialPower_GDIStructureGToggleEMP", "SpecialPower_GDIVehicleAGToggleDeploy", 
"SpecialPower_GDIVehicleAJElectrolysisAbility", "SpecialPower_GDIVehicleAJStaticFieldAbility", "SpecialPower_GDIVehicleLDepthCharges", "SpecialPower_GrantPackUpgrade", 
"SpecialPower_GrantUnpackUpgrade", "SpecialPower_Hijack", "SpecialPower_JumpJetPlaceSatchelCharge", "SpecialPower_LayMines", "SpecialPower_MissileStorm", 
"SpecialPower_NOD_BurrowMines", "SpecialPower_NOD_CloakingField", "SpecialPower_NOD_DecoyArmy", "SpecialPower_NOD_DecoyArmy_Target", "SpecialPower_NOD_Demoralize", 
"SpecialPower_NOD_EMPCounterMeasures", "SpecialPower_NOD_EyesOfPeople", "SpecialPower_NOD_FirestormIgnition", "SpecialPower_NOD_HackerElite", 
"SpecialPower_NOD_MarkOfKane", "SpecialPower_NOD_Megalisk", "SpecialPower_NOD_ObeliskOfLife", "SpecialPower_NOD_RadarJam", "SpecialPower_NOD_SubterraneanStrike", 
"SpecialPower_NOD_VoiceOfKane", "SpecialPower_NODAircraftC_ReturnToProducer", "SpecialPower_NODAircraftJDamageBuff", "SpecialPower_NODAircraftJPurgeBuffs", 
"SpecialPower_NODAircraftJPurgeBuffsTrigger", "SpecialPower_NODAircraftKPurify", "SpecialPower_NODAircraftNStasisFieldAbility", "SpecialPower_NodBuildStructureA", 
"SpecialPower_NODGideonsCrawler_StatisField", "SpecialPower_NODGideonsCrawlerBurrow", "SpecialPower_NodLayMines", "SpecialPower_NODManualReload", 
"SpecialPower_NODStructureCBurrow", "SpecialPower_NODStructureDBurrow", "SpecialPower_NODStructureIToggleStealth", "SpecialPower_NODVehicleAFDeploy", 
"SpecialPower_NODVehicleF_TrailOfFlame", "SpecialPower_NODVehicleMBurrow", "SpecialPower_NODVehicleMToggleDeploy", "SpecialPower_NODVehicleTGrab", "SpecialPower_NODVehicleTGrabStop", 
"SpecialPower_PackReplaceSelf", "SpecialPower_PlaceSatchelCharge", "SpecialPower_RecallAllAircraft", "SpecialPower_Redeployment", "SpecialPower_RefractionArmor", 
"SpecialPower_RepairStructure", "SpecialPower_SatchelCharge_Dispatch", "SpecialPower_SellSelf", "SpecialPower_StructureDeploy", "SpecialPower_StructureUndeploy", 
"SpecialPower_SupportPower_Rank1", "SpecialPower_SupportPower_Rank2", "SpecialPower_SupportPower_Rank3", "SpecialPower_SupportPower_Rank4", "SpecialPower_SupportPower_Rank5", 
"SpecialPower_SupportPowerBase", "SpecialPower_TechStructureE_Missiles", "SpecialPower_TechStructureIToggleGate", "SpecialPower_ToggleLocomotorMode", 
"SpecialPower_TriggerNeutralInfantryBLeap", "SpecialPowerCaptureControlPoint", "SpecialPowerPlantBarrel", "SpecialPowerPlantBarrelApproach", 
"SpecialPowerReturnToProducer", "SpecialPowerTemplate_GDIStructureJSuperweapon", "SpecialPowerTemplate_NODAircraftOHeal", "SpecialPowerTemplate_NODAircraftORocket", 
"SpecialPowerTemplate_NODStructureJSuperweapon", "SpecialPowerTemplate_StasisField"
}

SelectedUnits = 
{
"NOD_D1_Struct_Crawler_Crawler(Defense Crawler)", "NOD_O1_Struct_Crawler_Crawler(Offense Crawler)", "NOD_S1_Struct_Crawler_Crawler(Support Crawler)",
"GDI_D1_Struct_Crawler_Crawler(Defense Crawler)", "GDI_O1_Struct_Crawler_Crawler(Offense Crawler)", "GDI_S1_Struct_Crawler_Crawler(Support Crawler)",
"NOD_O3_Heavy_Cannon(Avatar)", 
"GDI_O3_Heavy_Laser(Refractor)", "GDI_O3_Heavy_Blast(Mastodon)", "GDI_S3_Heavy_Laser(Prism)",
"NEUTRAL_Struct_Generator(Monument Shield Generator)", "GDI_D3_Struct_Shield(Crystal Shield)"
}

GOAL_STRUCTURES = 
{
"NEUTRAL_Struct_Goal(Goal Structure)", "NEUTRAL_Struct_Goal_Destructible(Destructible Goal Structure)", "NEUTRAL_Struct_Goal_Dynamic(Dynamic Goal Structure)",  
"GoleStructureTier2", "GoleStructureWithDecal"
}

function SpawnUnit(OBJECT_TYPE, TEAM)
	local UNIT_REF = "object_" .. floor(99999999*GetRandomNumber()) 
	ExecuteAction("SET_REFERENCE_TO_RANDOM_TEAM_MEMBER", UNIT_REF, TEAM)
	ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_NAMED_OBJECT_LOCATION", OBJECT_TYPE, TEAM, UNIT_REF)
	local UNIT_REF2 = "object_" .. floor(99999999*GetRandomNumber()) 
	ExecuteAction("SET_REFERENCE_TO_LAST_SPAWNED_UNIT", UNIT_REF2)	
	--ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", "Object_" .. floor(GetRandomNumber()*999999), "NOD_O3_Heavy_Cannon(Avatar)", "Player/teamPlayer", "Player_1_Start")
	--ExecuteAction("CAPTURE_UPGRADE_CRYSTAL", UNIT, UNIT)
end

function EssentialTweaksCNC4()
	local PLAYER = "<All Human Players>" --"<All Players>"
	ExecuteAction("OVERRIDE_PLAYER_COMMAND_POINTS", PLAYER, 300, 500) --Original 80
	ExecuteAction("PLAYER_SET_BASE_POWER", "TeamManager1", 2000)
	ExecuteAction("PLAYER_SET_BASE_POWER", "TeamManager2", 2000)
	ExecuteAction("SET_CRYSTAL_UPGRADE_POINTS_OF_PLAYER", PLAYER, 120)
	ExecuteAction("GIVE_PLAYER_UPGRADE", PLAYER, "Upgrade_Tech_Up_Rank0")
	ExecuteAction("GIVE_PLAYER_UPGRADE", PLAYER, "Upgrade_Tech_Up_Rank1")
	ExecuteAction("GIVE_PLAYER_UPGRADE", PLAYER, "Upgrade_Tech_Up_Rank2")	
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_d_tier1", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_o_tier1", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_s_tier1", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_d_tier2", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_o_tier2", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_s_tier2", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_d_tier3", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_o_tier3", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_gdi_s_tier3", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_d_tier1", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_o_tier1", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_s_tier1", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_d_tier2", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_o_tier2", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_s_tier2", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_d_tier3", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_o_tier3", 1)
	ExecuteAction("ALLOW_DISALLOW_BUILDING_OBJECT_LIST", PLAYER, "objlist_nod_s_tier3", 1)
	--ExecuteAction("PLAYER_SET_MAX_PLAYER_POWER_POINTS", PLAYER, 777)
	ExecuteAction("SET_MAX_REDEPLOYMENT_COUNT", PLAYER, 10)
	ExecuteAction("SET_PLAYER_BUILDTIME_CHEAT", PLAYER, 10.0)
	for i,j in ALL_OBJECT_LIST do
	
		for n=1,getn(j),1 do 
			ExecuteAction("SET_OBJECT_ALLOWED_FOR_PLAYER", j[n], PLAYER)
		end
	end
	for i=1,getn(CNC4_UPGRADE_LIST),1 do 
		ExecuteAction("GIVE_PLAYER_UPGRADE", PLAYER, CNC4_UPGRADE_LIST[i])
	end	
	for i=1,getn(CNC4_SPECIALPOWER_LIST),1 do 
		ExecuteAction("PLAYER_GRANT_SPECIAL_POWER", CNC4_SPECIALPOWER_LIST[i], PLAYER)		
	end
	--ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", "Object_" .. floor(GetRandomNumber()*999999), "Player/teamPlayer", "Player_1_Start")
	--SpawnSuperUnit("NOD_O3_Heavy_Cannon(Avatar)", "Player/teamPlayer")
	--ExecuteAction("PLAYER_LOCK_PLAYER_TECH", PLAYER, "PlayerTech_Redeployment", 0)
	--ExecuteAction("PLAYER_ALLOWED_TOBE_COOPAI", "<1st Human Player's Allies>", true)
	--ExecuteAction("SET_COOP_AI_COMMAND_UI_ENABLED", true)
	--ExecuteAction("PLAYER_TOGGLE_RESOURCE_SHARING", "<All Players>", true)
	--ExecuteAction("MAP_REVEAL_ALL_PERM", "<1st Human Player>")
	--ExecuteAction("PLAYER_SET_MONEY", "<All Players>", 77777)
	ExecuteAction("SET_FPS_LIMIT", 60)
end