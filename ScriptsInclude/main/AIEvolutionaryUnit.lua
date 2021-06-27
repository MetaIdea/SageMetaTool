NAME	 	= "AI Evolutionary Unit"
VERSION		= "1.0"
TYPE		= "DISABLED"--"MOD"
GAME		= "CNC3KW"
DESCRIPTION	= "This is an example gamemode template"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

--inspiration from bfme2 library map scripts:

-- *** IF ***
     -- Team '<This Team>' has Greater Than threat level 5.00 within radius 50.00
    -- *AND*  Player '<This Player>''s Team '<This Team>' are ready to use Ability 'Command_SpecialAbilityWizardBlast' (at least one member).
-- *** THEN ***
   -- Team '<This Team>' use Ability 'Command_SpecialAbilityWizardBlast'  on nearest enemy unit.
   
-- *** IF ***
    -- True.
-- *** THEN ***
   -- Team '<This Team>' stops.
  -- Set Team '<This Team>' to 'AI_RETREATING'.
  -- For all units in team Team '<This Team>' set object status Object Status is 'HUNT_WHEN_IDLE' to FALSE.
   -- Team '<This Team>' change their attitude to Peaceful
  -- Team Team '<This Team>' will move to the nearest object of type 'BaseDefenseNode5' that is owned by the player Player '<This Player>'.
   -- Team '<This Team>' change their attitude to Aggressive
  -- Set Team '<This Team>' to 'AI_DEFENDING'.
  
-- *** IF ***
    -- True.
-- *** THEN ***
   -- Team '<This Team>' stops.
   -- Team '<This Team>' use Ability 'Command_ToggleMounted'.
   -- Team '<This Team>' idles for  7  seconds.
   
-- *** IF ***
     -- Team '<This Team>' has Greater Than or Equal To threat level 10.00 within radius 100.00
    -- *AND*  Team '<This Team>' has the custom state 'AI_ROHIRRIM_ARCHER_FRM_2'
-- *** THEN ***
   -- Team '<This Team>' use Ability 'Command_ToggleFormationRohirrimArcher'.
   -- Team '<This Team>' set custom state 'AI_ROHIRRIM_ARCHER_FRM_1' to TRUE
   -- Team '<This Team>' set custom state 'AI_ROHIRRIM_ARCHER_FRM_2' to FALSE
   
   
ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", Object, GetObjectStatus("IGNORE_AI_COMMAND"), 1)

ExecuteAction("SHOW_MILITARY_CAPTION", "This is an empty example gamemode", 300)

ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS",...)
ExecuteAction("UNIT_AI_TRANSFER",...)
ExecuteAction("UNIT_AI_TRANSFER_ALL",...)
ExecuteAction("UNIT_ALLOW_AI_AUTOACQUIRE",...)
ExecuteAction("UNIT_ASSIMILATE_WITH_ARMY_BY_NAME",...)
ExecuteAction("UNIT_ASSIMILATE_WITH_FIRST_WALK_ON_ARMY",...)
ExecuteAction("UNIT_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE",...)
ExecuteAction("UNIT_CHANGE_OBJECT_STATUS",...)
ExecuteAction("UNIT_CLEAR_MODELCONDITION",...)
ExecuteAction("UNIT_CONTEXT_SENSITIVE_ATTACK",...)
ExecuteAction("UNIT_DESTROY_ALL_CONTAINED",...)
ExecuteAction("UNIT_ENABLE_HOUSE_COLOR",...)
ExecuteAction("UNIT_EXECUTE_SEQUENTIAL_SCRIPT",...)
ExecuteAction("UNIT_EXECUTE_SEQUENTIAL_SCRIPT_LOOPING",...)
ExecuteAction("UNIT_FORCE_EMOTION",...)
ExecuteAction("UNIT_GAIN_LEVEL",...)
ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",...)
ExecuteAction("UNIT_GIVE_EXPERIENCE_POINTS",...)
ExecuteAction("UNIT_GUARD_AREA",...)
ExecuteAction("UNIT_GUARD_AREA_FROM_POSITION",...)
ExecuteAction("UNIT_GUARD_FOR_FRAMECOUNT",...)
ExecuteAction("UNIT_GUARD_FOR_SECONDS",...)
ExecuteAction("UNIT_GUARD_NEAREST_KINDOF",...)
ExecuteAction("UNIT_GUARD_OBJECT",...)
ExecuteAction("UNIT_GUARD_POSITION",...)
ExecuteAction("UNIT_IDLE_FOR_FRAMECOUNT",...)
ExecuteAction("UNIT_IDLE_FOR_SECONDS",...)
ExecuteAction("UNIT_KILL_ALL_IN_AREA",...)
ExecuteAction("UNIT_MOVE_TOWARDS_NEAREST_OBJECT_TYPE",...)
ExecuteAction("UNIT_SET_EXPERIENCE_POINTS",...)
ExecuteAction("UNIT_SET_FLAME_STATUS",...)
ExecuteAction("UNIT_SET_HEALTH",...)
ExecuteAction("UNIT_SET_MAX_LEVEL",...)
ExecuteAction("UNIT_SET_MODELCONDITION",...)
ExecuteAction("UNIT_SET_MODELCONDITION_FOR_DURATION",...)
ExecuteAction("UNIT_SET_STANCE",...)
ExecuteAction("UNIT_SET_TEAM",...)
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",...)
ExecuteAction("UNIT_STAND_GROUND",...)
ExecuteAction("UNIT_STOP_SEQUENTIAL_SCRIPT",...)
ExecuteAction("UNIT_TELEPORT_TO_WAYPOINT",...)
ExecuteAction("NAME_SET_AUTO_ABILITY",...)
ExecuteAction("NAMED_ADD_SPECIAL_POWER_COUNTDOWN",...)
ExecuteAction("NAMED_APPLY_ATTACK_PRIORITY_SET",...)
ExecuteAction("NAMED_ATTACK_AREA",...)
ExecuteAction("NAMED_ATTACK_AREA_FOR_SECONDS",...)
ExecuteAction("NAMED_ATTACK_FOLLOW_WAYPOINTS",...)
ExecuteAction("NAMED_ATTACK_NAMED",...)
ExecuteAction("NAMED_ATTACK_TEAM",...)
ExecuteAction("NAMED_BASE_UNPACK",...)
ExecuteAction("NAMED_BASE_UNPACK_FREE",...)
ExecuteAction("NAMED_BUILD_STRUCTURE_AT_WAYPOINT",...)
ExecuteAction("NAMED_CUSTOM_COLOR",...)
ExecuteAction("NAMED_DAMAGE",...)
ExecuteAction("NAMED_DELETE",...)
ExecuteAction("NAMED_ENTER_NAMED",...)
ExecuteAction("NAMED_EXIT_ALL",...)
ExecuteAction("NAMED_EXIT_BUILDING",...)
ExecuteAction("NAMED_FACE_NAMED",...)
ExecuteAction("NAMED_FACE_WAYPOINT",...)
ExecuteAction("NAMED_FIRE_METAGAME_OP_INSTANT",...)
ExecuteAction("NAMED_FIRE_SPECIAL_POWER",...)
ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_NAMED",...)
ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_WAYPOINT",...)
ExecuteAction("NAMED_FIRE_WEAPON_FOLLOWING_WAYPOINT_PATH",...)
ExecuteAction("NAMED_FLASH",...)
ExecuteAction("NAMED_FLASH_WHITE",...)
ExecuteAction("NAMED_FOLLOW_WAYPOINTS",...)
ExecuteAction("NAMED_FOLLOW_WAYPOINTS_EXACT",...)
ExecuteAction("NAMED_GARRISON_NEAREST_BUILDING",...)
ExecuteAction("NAMED_GARRISON_SPECIFIC_BUILDING",...)
ExecuteAction("NAMED_GARRISON_SPECIFIC_BUILDING_INSTANTLY",...)
ExecuteAction("NAMED_GUARD",...)
ExecuteAction("NAMED_HIDE_SPECIAL_POWER_DISPLAY",...)
ExecuteAction("NAMED_HUNT",...)
ExecuteAction("NAMED_KILL",...)
ExecuteAction("NAMED_RECEIVE_UPGRADE",...)
ExecuteAction("NAMED_REMOVE_UPGRADE",...)
ExecuteAction("NAMED_SET_ATTITUDE",...)
ExecuteAction("NAMED_SET_CAMERA_FADING",...)
ExecuteAction("NAMED_SET_EMOTICON",...)
ExecuteAction("NAMED_SET_HELD",...)
ExecuteAction("NAMED_SET_REPULSOR",...)
ExecuteAction("NAMED_SET_SLEEP_STATUS",...)
ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN",...)
ExecuteAction("NAMED_SET_SPECIAL_WEAPONSET",...)
ExecuteAction("NAMED_SET_STEALTH_ENABLED",...)
ExecuteAction("NAMED_SET_STOPPING_DISTANCE",...)
ExecuteAction("NAMED_SET_STRICT_CONTROL_ENABLED",...)
ExecuteAction("NAMED_SET_TOPPLE_DIRECTION",...)
ExecuteAction("NAMED_SHOCK",...)
ExecuteAction("NAMED_SHOW_SPECIAL_POWER_DISPLAY",...)
ExecuteAction("NAMED_START_SPECIAL_POWER_COUNTDOWN",...)
ExecuteAction("NAMED_STOP",...)
ExecuteAction("NAMED_STOP_SPECIAL_POWER_COUNTDOWN",...)
ExecuteAction("NAMED_TOGGLE_CLOSE_RANGE_WEAPON",...)
ExecuteAction("NAMED_TRANSFER_OWNERSHIP_PLAYER",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_AT_WAYPOINT",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_ON_NAMED",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_BUILDING",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_BUILDING_CLASS",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_UNIT",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_GARRISONED_BUILDING",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_KINDOF",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_OBJECTTYPE",...)

RELEVANT:
ExecuteAction("UNIT_SET_STANCE",...)
ExecuteAction("NAME_SET_AUTO_ABILITY",...)
ExecuteAction("NAMED_APPLY_ATTACK_PRIORITY_SET",...)
ExecuteAction("UNIT_CONTEXT_SENSITIVE_ATTACK",...)
ExecuteAction("NAMED_SET_ATTITUDE",...)
ExecuteAction("NAMED_SET_SPECIAL_WEAPONSET",...)
ExecuteAction("UNIT_ALLOW_AI_AUTOACQUIRE",...)
ExecuteAction("NAMED_TOGGLE_CLOSE_RANGE_WEAPON",...)
ExecuteAction("NAMED_SET_STOPPING_DISTANCE",...)
ExecuteAction("NAMED_SET_STRICT_CONTROL_ENABLED",...)
ExecuteAction("NAMED_SET_TOPPLE_DIRECTION",...)

ExecuteAction("NAMED_ATTACK_NAMED",...)
ExecuteAction("NAMED_ATTACK_TEAM",...)

ExecuteAction("MOVE_NAMED_UNIT_TO",...)
ExecuteAction("ATTACK_MOVE_NAMED_UNIT_TO",...)
ExecuteAction("UNIT_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE",...)
ExecuteAction("UNIT_MOVE_TOWARDS_NEAREST_OBJECT_TYPE",...)

ExecuteAction("NAMED_GUARD",...)
ExecuteAction("UNIT_GUARD_AREA",...)
ExecuteAction("UNIT_GUARD_AREA_FROM_POSITION",...)
ExecuteAction("UNIT_GUARD_FOR_FRAMECOUNT",...)
ExecuteAction("UNIT_GUARD_FOR_SECONDS",...)
ExecuteAction("UNIT_GUARD_NEAREST_KINDOF",...)
ExecuteAction("UNIT_GUARD_OBJECT",...)
ExecuteAction("UNIT_GUARD_POSITION",...)

ExecuteAction("NAMED_ATTACK_FOLLOW_WAYPOINTS",...)
ExecuteAction("NAMED_FOLLOW_WAYPOINTS",...)
ExecuteAction("NAMED_FOLLOW_WAYPOINTS_EXACT",...)

ExecuteAction("UNIT_KILL_ALL_IN_AREA",...)
ExecuteAction("NAMED_ATTACK_AREA",...)
ExecuteAction("NAMED_ATTACK_AREA_FOR_SECONDS",...)

ExecuteAction("NAMED_HUNT",...)

ExecuteAction("NAMED_STOP",...)
ExecuteAction("UNIT_IDLE_FOR_FRAMECOUNT",...)
ExecuteAction("UNIT_IDLE_FOR_SECONDS",...)
ExecuteAction("NAMED_SET_SLEEP_STATUS",...)

ExecuteAction("NAMED_FACE_NAMED",...)
ExecuteAction("NAMED_FACE_WAYPOINT",...)
ExecuteAction("UNIT_FORCE_EMOTION",...)
ExecuteAction("NAMED_SET_EMOTICON",...)

ExecuteAction("NAMED_ENTER_NAMED",...)
ExecuteAction("NAMED_EXIT_ALL",...)
ExecuteAction("NAMED_EXIT_BUILDING",...)
ExecuteAction("NAMED_GARRISON_NEAREST_BUILDING",...)
ExecuteAction("NAMED_GARRISON_SPECIFIC_BUILDING",...)
ExecuteAction("NAMED_GARRISON_SPECIFIC_BUILDING_INSTANTLY",...)

ExecuteAction("NAMED_FIRE_METAGAME_OP_INSTANT",...)
ExecuteAction("NAMED_FIRE_SPECIAL_POWER",...)
ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_NAMED",...)
ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_WAYPOINT",...)
ExecuteAction("NAMED_FIRE_WEAPON_FOLLOWING_WAYPOINT_PATH",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_AT_WAYPOINT",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_ON_NAMED",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_BUILDING",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_BUILDING_CLASS",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_ENEMY_UNIT",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_GARRISONED_BUILDING",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_KINDOF",...)
ExecuteAction("NAMED_USE_COMMANDBUTTON_ON_NEAREST_OBJECTTYPE",...)

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


--ExecuteAction("NAMED_APPLY_ATTACK_PRIORITY_SET", thisobject, priorityset)

function UnitSelectionForAIMode(self)
	tinsert(GPOT[GetTeamName(self)]["UnitEvoAI"],GetSelectedUnitRef())
end

function EvoUnitAIProcess()
	for k=1,getn(HumanPlayerTable),1 do
		for i=1,getn(GPOT[HumanPlayerTable[k]]["UnitEvoAI"]),1 do
			--GPOT[HumanPlayerTable[k]]["UnitEvoAI"][i]
		end
	end
end  

function UnitMoveToPosition(Object,x,y)  
	local alpha = SpawnAtPosition(GenericDummy,NeutralTeam,x,y,0,0,0,0,1,1)
	--local MoveMode1 = function() ExecuteAction("UNIT_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE",%Object,GenericDummy) pop() end
	--push(MoveMode1)   
	local MoveMode2 = function() ExecuteAction("UNIT_GUARD_OBJECT",%Object,%alpha) pop() end
	push(MoveMode2)
	--local DeleteDummy = function() ExecuteAction("NAMED_DELETE",%alpha) pop() end
	--push(DeleteDummy)
end


UnitMove={}

function UnitMove.Up(unit,dist)
	UnitMoveToPosition(unit,GetObjectPosition(unit).x,GetObjectPosition(unit).y+dist) 
end

function UnitMove.Down(unit,dist)
	UnitMoveToPosition(unit,GetObjectPosition(unit).x,GetObjectPosition(unit).y-dist) 
end

function UnitMove.Left(unit,dist)
	UnitMoveToPosition(unit,GetObjectPosition(unit).x-dist,GetObjectPosition(unit).y) 
end

function UnitMove.Right(unit,dist)
	UnitMoveToPosition(unit,GetObjectPosition(unit).x+dist,GetObjectPosition(unit).y) 
end