NAME	 	= "Capture the Flag"
VERSION		= "1.0"
TYPE		= "DISABLED"--"GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "This is an example gamemode template"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

------------------------------------------------------------------
----------------------SCRIPT SECTION------------------------------
------------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "This is an empty example gamemode", 300)

EvaluateCondition("PLAYER_LOST_OBJECT_TYPE", PLAYER, OBJECT_TYPE)

function CaptureControlPointGamemode()
end

function ControlPointGamemodeSetup()
	if CCP_Initialized==0 then 
		CCP_Initialized=1
		ControlPointStringRef=RandomString(3)
		SpawnAtPosition("ControlPointX_OCL",NeutralTeam,MapSize.x/2,MapSize.y/2,0,ControlPointRef)
	end
end

function ControlPointXCreated(self)
    ControlPointTableRef=self
	ObjectHideSubObjectPermanently( self, "TB_CP_ALN", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_GDI", true )
	ObjectHideSubObjectPermanently( self, "TB_CP_NOD", true )
	ObjectHideSubObjectPermanently( self, "LIGHTSF01", true )
	ObjectHideSubObjectPermanently( self, "100", false)
	ObjectHideSubObjectPermanently( self, "75", false)
	ObjectHideSubObjectPermanently( self, "50", false)
	ObjectHideSubObjectPermanently( self, "25", false )
end

function ControlPointEnemyNear(self)
	print("ControlPoint near")
end

function ControlPointEnemyAway(self)
	print("ControlPoint far")
end

function ControlPointCAPTURED()
	print("captured")
end

function ControlPointCAPTURE_100()
	print("captured 100")
end

function ControlPointCAPTURE_75()
	print("captured 75")
end

function ControlPointCAPTURE_50()
	print("captured 50")
end

function ControlPointCAPTURE_25()
	print("captured 25")
end

function ControlPointCAPTURE_0()
	print("captured 0")
end

function ControlPointTest()
	ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Neva_YouHaveFlag", team)	
	ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_FlagCaptured", team)	
	ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Neva_FlagHasBeenTak", team)	
end



function OnCaptureFlagGenericEvent(self,data)
	local str = ObjectCapturingObjectPlayerSide(self)
	if str == nil then
		str = ObjectPlayerSide(self)
	end


	ObjectHideSubObjectPermanently( self, "FLAG_ISENGARD", true)
	ObjectHideSubObjectPermanently( self, "FLAG_MORDOR", true)
	ObjectHideSubObjectPermanently( self, "FLAG_WILD", true)
	ObjectHideSubObjectPermanently( self, "FLAG_MEN", true)
	ObjectHideSubObjectPermanently( self, "FLAG_ELVES", true)
	ObjectHideSubObjectPermanently( self, "FLAG_DWARVES", true)

	if str == "Isengard" then
		ObjectHideSubObjectPermanently( self, "FLAG_ISENGARD", false)
	elseif str == "Mordor" then
		ObjectHideSubObjectPermanently( self, "FLAG_MORDOR", false)
	elseif str == "Men" then
		ObjectHideSubObjectPermanently( self, "FLAG_MEN", false)
	elseif str == "Dwarves" then
		ObjectHideSubObjectPermanently( self, "FLAG_DWARVES", false)
	elseif str == "Elves" then
		ObjectHideSubObjectPermanently( self, "FLAG_ELVES", false)
	elseif str == "Wild" then
		ObjectHideSubObjectPermanently( self, "FLAG_WILD", false)
	else
		ObjectHideSubObjectPermanently( self, "FLAG_NEUTRAL", false)
	end
end

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

-CaptureFlag -Inn -ShipWright -Outpost -SignalFire -ShireGreenDragon