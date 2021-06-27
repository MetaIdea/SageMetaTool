NAME	 	= "AI Advanced"
VERSION		= "1.0"
TYPE		= "DISABLED"--"MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION	= "Advanced AI system"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "This is an empty example gamemode", 300)

AreaTable =
{
	"SiegeGameplayBarrier", "CombatZone", "Water Grid", 
	"InnerPerimeter1", "InnerPerimeter2", "InnerPerimeter3", "InnerPerimeter4", "InnerPerimeter5", "InnerPerimeter6", "InnerPerimeter7", "InnerPerimeter8", 
	"OuterPerimeter1", "OuterPerimeter2", "OuterPerimeter3", "OuterPerimeter4", "OuterPerimeter5", "OuterPerimeter6", "OuterPerimeter7", "OuterPerimeter8", 
	"[Skirmish]EnemyInnerPerimeter", "[Skirmish]EnemyOuterPerimeter", "[Skirmish]MyInnerPerimeter", "[Skirmish]MyOuterPerimeter"
}

function EnableLocalPlayerAI()
	local PLAYER = LocalPlayer
	ExecuteAction("PLAYER_TOGGLE_SKIRMISH_AI", PLAYER, 1)
	ExecuteAction("SKIRMISH_AI_START", PLAYER)
	ExecuteAction("SKIRMISH_AI_TRANSFER_ALL", PLAYER, 1)
	ExecuteAction("SKIRMISH_AI_MAKE_BASE", PLAYER, "Player_1_Start")
	ExecuteAction("PLAYER_AI_CHANGEBASEBUILDER", PLAYER, 1)
	ExecuteAction("PLAYER_AI_CHANGESCIENCEUPGRADER", PLAYER, 1)
	ExecuteAction("PLAYER_AI_CHANGETACTICAL", PLAYER, 1)
	ExecuteAction("PLAYER_AI_CHANGETEAMBUILDER", PLAYER, 1)
	ExecuteAction("PLAYER_AI_CHANGEUNITBUILDER", PLAYER, 1)
	ExecuteAction("PLAYER_AI_CHANGEUNITUPGRADER", PLAYER, 1)
	ExecuteAction("PLAYER_AI_CHANGEWALLBUILDER", PLAYER, 1)
	ExecuteAction("PLAYER_ALLOW_AI_AUTOACQUIRE", PLAYER, 1)
	ExecuteAction("SKIRMISH_AI_USE_REBUILD_SYSTEM", PLAYER, 1)
	ExecuteAction("SKIRMISH_AI_USE_REPAIRS", PLAYER, 1)
	ExecuteAction("SKIRMISH_AI_USE_DEFAULT_AUTOMATIC_ENEMY_PLAYER_PRIORITY_SCHEME", PLAYER)
	ExecuteAction("SKIRMISH_AI_REBUILD_SYSTEM_SCAN", PLAYER)
	ExecuteAction("TOGGLE_AUTO_BUILD", PLAYER, 1)
end EnableLocalPlayerAI()

function AddNewAIPlayer()
	local PLAYER = "<1st Human Player>"
	ExecuteAction("PLAYER_TOGGLE_SKIRMISH_AI", PLAYER, true)
	ExecuteAction("SKIRMISH_AI_START", PLAYER)
	ExecuteAction("SKIRMISH_AI_TRANSFER_ALL", PLAYER, true)
	ExecuteAction("PLAYER_TOGGLE_SKIRMISH_AI", PLAYER, true)
	ExecuteAction("SKIRMISH_AI_START", PLAYER)
	ExecuteAction("SKIRMISH_AI_TRANSFER_ALL", PLAYER, true)
	ExecuteAction("SKIRMISH_AI_MAKE_BASE", PLAYER, "Player_1_Start")
	ExecuteAction("PLAYER_AI_CHANGEBASEBUILDER", PLAYER, true)
	ExecuteAction("PLAYER_AI_CHANGESCIENCEUPGRADER", PLAYER, true)
	ExecuteAction("PLAYER_AI_CHANGETACTICAL", PLAYER, true)
	ExecuteAction("PLAYER_AI_CHANGETEAMBUILDER", PLAYER, true)
	ExecuteAction("PLAYER_AI_CHANGEUNITBUILDER", PLAYER, true)
	ExecuteAction("PLAYER_AI_CHANGEUNITUPGRADER", PLAYER, true)
	ExecuteAction("PLAYER_AI_CHANGEWALLBUILDER", PLAYER, true)
	ExecuteAction("PLAYER_ALLOW_AI_AUTOACQUIRE", PLAYER, true)
	ExecuteAction("SKIRMISH_AI_USE_REBUILD_SYSTEM", PLAYER, true)
	ExecuteAction("SKIRMISH_AI_USE_REPAIRS", PLAYER, true)
	ExecuteAction("SKIRMISH_AI_USE_DEFAULT_AUTOMATIC_ENEMY_PLAYER_PRIORITY_SCHEME", PLAYER)
	ExecuteAction("SKIRMISH_AI_REBUILD_SYSTEM_SCAN", PLAYER)
	--ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT_WITH_ORIENTATION", "MoneyCrate", "/team", "Player_1_Start", 0)	
	
	ExecuteAction("SKIRMISH_AI_CLEAR_ALL_ENEMY_PLAYERS_PRIORITIES", PLAYER)
	ExecuteAction("SKIRMISH_AI_CLEAR_ENEMY_PLAYER_PRIORITY", PLAYER, PLAYER)
	ExecuteAction("SKIRMISH_AI_CONSIDER_ALL_ENEMIES_WHEN_BUILDING", PLAYER)
	ExecuteAction("SKIRMISH_AI_CONSIDER_ENEMY_WHEN_BUILDING", PLAYER, PLAYER)
	ExecuteAction("SKIRMISH_AI_DONT_CONSIDER_ANY_ENEMIES_WHEN_BUILDING", PLAYER)
	ExecuteAction("SKIRMISH_AI_DONT_CONSIDER_ENEMY_WHEN_BUILDING", PLAYER, PLAYER)
	ExecuteAction("SKIRMISH_AI_MAKE_BASE", PLAYER, WAYPOINT)
	ExecuteAction("SKIRMISH_AI_REBUILD_SYSTEM_SCAN", PLAYER)
	ExecuteAction("SKIRMISH_AI_SET_ALL_ENEMY_PLAYERS_PRIORITIES", PLAYER, INT)
	ExecuteAction("SKIRMISH_AI_SET_ENEMY_PLAYER_PRIORITY", PLAYER, PLAYER, INT)
	ExecuteAction("SKIRMISH_AI_SET_FAVORED_ENEMY", PLAYER, PLAYER)
	ExecuteAction("SKIRMISH_AI_START", PLAYER)
	ExecuteAction("SKIRMISH_AI_TRANSFER_ALL", PLAYER, BOOL)
	ExecuteAction("SKIRMISH_AI_USE_AUTOMATIC_ENEMY_PLAYER_PRIORITY_SCHEME", PLAYER, ENEMY_SORTING_METHOD)
	ExecuteAction("SKIRMISH_AI_USE_DEFAULT_AUTOMATIC_ENEMY_PLAYER_PRIORITY_SCHEME", PLAYER)
	ExecuteAction("SKIRMISH_AI_USE_REBUILD_SYSTEM", PLAYER, BOOL)
	ExecuteAction("SKIRMISH_AI_USE_REPAIRS", PLAYER, BOOL)
	ExecuteAction("SKIRMISH_FIRE_SPECIAL_POWER_AT_MOST_COST", PLAYER, SPECIAL_POWER)
	
	ExecuteAction("TOGGLE_AUTO_BUILD", PLAYER, BOOLEAN)
	ExecuteAction("UNIT_AI_TRANSFER_ALL", PLAYER, BOOL)
	
EvaluateCondition("PLAYER_HAS_ANY_OBJECT_ENTITLEMENT", PLAYER, OBJECT_TYPE_LIST)
end

	EvaluateCondition("IS_NUM_OF_UNITS_BELONGING_TO_PLAYER_NEAR_EVA_EVENT_LAST_PLAYED_LOCATION_COMPARISON_INT", PLAYER, REAL, EVA_EVENT, COMPARISON, INT)
EvaEventTable={
	"AircraftOutOfAmmoDamage","AlliedIonCannonActivated","AlliedIonCannonActivated","AlliedIonCannonDetected","AlliedNuclearMissileLaunched","AlliedRiftGeneratorActivated",
	"AlliedTempleOfNodDetected","AllyCampDestroyed","AllyDefeated","BeaconPlacedAlly","BeaconPlacedPlayer","BridgeRepaired","BuildCancelled","BuildingBeingStolen","BuildingConstructionComplete",
	"BuildingConstructionStarted","BuildingManuallyPoweredDown","BuildingManuallyPoweredUp","BuildingRepaired","BuildingStolen","BuildOnHold","BuildQueuePausedDueToCPLimit",
	"BuildQueuePausedDueToFunds","CampDestroyed","CannotBuildDueToCPLimit","CannotRepairDueToFunds","CannotUsePowerDueToFunds","CastleBreached","CompletedBonusMissionObjective",
	"CompletedMissionObjective","ControlPointCaptured","ControlPointHasBeenCaptured","ControlPointLost","Countdown01","Countdown02","Countdown03","Countdown04","Countdown05",
	"Countdown06","Countdown07","Countdown08","Countdown09","Countdown10MinsInGame","Countdown10SecsInGame","Countdown15MinsInGame","Countdown1MinsInGame",
	"Countdown20MinsInGame","Countdown30SecsInGame","Countdown3MinsInGame","Countdown5MinsInGame","CTFEnemyCapturedFlag","CTFEnemyDroppedFlag","CTFEnemyHasFlag","CTFFlagCaptured",
	"CTFFlagDropped","CTFYouHaveFlag","DamagedByTiberium","DefaultEvaEvent","EmptyEva","EnemyBuildingCaptured","EnemyCampDestroyed","EnemyCampSighted","EnemyCommandoDetected",
	"EnemyDefeated","EnemyEngineerDetected","EnemyIonCannonActivated","EnemyIonCannonDetected","EnemyNuclearMissileLaunched","EnemyRiftGeneratorActivated","EnemyRiftGeneratorDetected",
	"EnemyStealthUnitDiscovered","EnemyTempleOfNodDetected","GeneralLevelUp","GenericEnemyUnitSighted","GenericUnitBeingBurned","HarvesterLost","HarvesterUnderAttack","HuskRepaired",
	"IncomingRadarTransmission","IncomingTransmission","IntelDatabaseEntryReceived","IonCannonReady","LiquidTiberiumBombReady","LocalPlayerDefeated","LocalPlayerVictorious","LowPower",
	"Meva_AutoResolve","Meva_AutoResolveBattleLost","Meva_AutoResolveBattleWon","Meva_BuildBase","Meva_BuildSF","Meva_Cancel","Meva_DecBase","Meva_DecSF","Meva_MoveSF",
	"Meva_Patrola","Meva_Patrolb","Meva_RepairBase","Meva_RepairSF","Meva_UpgBaseDef","Meva_UpgBasePow","Meva_UpgBaseTier","Meva_UpgSF","Meva_YouFiredIC","Meva_YouFiredNuke",
	"Meva_YouFiredRift","MothershipDeployed","NewBonusObjective","NewConstructionOptions","NewMissionObjective","NuclearMissileReady","ObservedPlayerDefeated","OwnIonCannonActivated",
	"OwnLiquidTiberiumBombLaunched","OwnNuclearMissileLaunched","OwnRiftGeneratorActivated","ReinforcementsReady","RiftGeneratorReady","SelectDecoyUnit","SelectSpecialPowerTarget",
	"SelectUnit","SelectWormholeLocation","SiegeBarrierDisengaged","SiegeBarrierEngaged","SiegeCountdown10Mins","SiegeCountdown10Secs","SiegeCountdown15Mins","SiegeCountdown1Mins",
	"SiegeCountdown20Mins","SiegeCountdown30Secs","SiegeCountdown3Mins","SiegeCountdown5Mins","SilosNeeded","StructureCannotBuildDueToFullBuildQueue","StructurePlacementFailed",
	"StructureRepairing","StructureSold","StructureUnderAttack","TiberiumFieldDepleted","UnitAmbushed","UnitConstructionStarted","UnitLost","UnitPromoted","UnitUnderAttack",
	"UnitUnderAttackFromShroudedUnit","UpgradeComplete","WallsBeingClimbed","WarningMothershipDeployed","WorldMustBattle","WorldMustChooseOwner","WorldMustRetreat","WorldRegionLostUncontested"	
}

ExecuteAction("PLAYER_SELECT_SKILLSET", PLAYER, INT)



function EnemyAIBoostActivation(self)
	spawn("MetaControlDummyAIBoostActivator",GetTeamName(self))
end

function AlliedAIBoostActivation(self)
	spawn("MetaControlDummyAIBoostAlliesActivator",GetTeamName(self))
end

function AdaptiveAIBoost()
	for i=1,getn(GlobalTeamTable),1 do
		if TeamRelations[HumanPlayerTable[1]][GlobalTeamTable[i]] == 0 then
			if (CountTeamsKindOf(GlobalTeamTable[i],"VEHICLE") + CountTeamsKindOf(GlobalTeamTable[i],"AIRCRAFT"))/(CountTeamsKindOf(HumanPlayerTable[1],"VEHICLE") + CountTeamsKindOf(HumanPlayerTable[1],"AIRCRAFT"))<0.5 then
				GiveMoney(GlobalTeamTable[i],AI_Boost_Cash_Ammount_PerSec*NAOD.PeriodTime)  
				if AI_Boost_Unit_Spawner == 1 then spawn(MenuTable["spawn"][random(17)],GlobalTeamTable[i],random(3,5)) end
				--elseif CountTeamsKindOf(GlobalTeamTable[i],"STRUCTURE")
			end		 
		end
	end
end

function AIUltraBoostToggle(team)
	ToggleObjectTypeExistence("InfiniteProductionSpeedDummy",team)
	ToggleObjectTypeExistence("BuildAnywhereDummy",team)
	ToggleObjectTypeExistence("InfiniteEnergyDummy",team)
	--GiveMoney(team,1000000)
	--ToggleAIBuilder(team)
end