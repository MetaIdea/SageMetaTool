NAME	 	= "Art of Defense Advanced"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Defend yourself against waves of enemies - contains evolutionary self learning AI mechanisms"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "APT:GameMode", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

NativeArtOfDefense            = no
NativeArtOfDefense_RoundBased = no
Max_Waves                     = 7
No_Wave_Limit                 = yes
First_Wave_Delay              = 20
Wave_Delay                    = 20
AlliedPlayersNextToEachOther  = no

--remainings from the original meta mod
Savegames = false
MetaCreditSystem = false
MetaCreditShop_AlwaysOff = 1

NAOD={}
NAOD.UnitTable = {}
NativeArtOfDefense_Initialized = 0

---------------------------------------------------------------------------
-------------------NATIVE ART OF DEFENSE SYSTEM----------------------------
---------------------------------------------------------------------------
--victory condition all humanplayer team enemy to naodenemy team need to survive
NAOD={}
NAOD.SpawnFactor = 1
NAOD.AdaptFactor = 1	
NAOD.MemoryTable = {}
NAOD.DifficultyFactor = 1.0

NAOD.Team = "PlyrCreeps/teamPlyrCreeps"
NAOD.TeamObjectRef = nil
-- NAOD.EnemyTeamOjectRef=nil
NAOD.EnemyTeamTable={}
NAOD.CurrentTeamToAttack=""
NAOD.NextRoundIndicator = 0
NAOD.TeamObjectCount=0
NAOD.RemainingUnitsLimit = 0
NAOD.AttackActionLock=false
NAOD.PeriodTime = 10
NAOD.SpawnWaypoint=""
NAOD.TimerTime = 60
NAOD.Time = 0   
NAOD.Wave = 0
NAOD.TimerStatus=0
NAOD.Distance = 1
NAOD.TempValue=0
NAOD.MapIntegration=0
NAOD.TempTable = {}
NAOD.XpAndMoneyReceived=1
NAOD.TeamObjectCountInitial=0
NAOD.StaticSpawnFactorRounds=0
NAOD.FollowWaypointCommandIssued = false
NAOD.PreAttackActionsIssued = false
NAOD.TeamObjectList={}
NAOD.TeamObjectListRefreshed=false
NAOD.Tower = "METAMOD_TOWERDEFENSE_OBJECT"
NAOD.TowerDistanceForAttackCommand = 650
NAOD.GameOverState = false
NAOD.MoneyReceiveLimit=30000
NAOD.TowerDefenseEnemyStance = "HOLD_POSITION" --"HOLD_FIRE" 
NAOD.AreaRestriction = true
NAOD.AIAlliedTeamTable={}

function NAOD.InitializeNativeArtOfDefense()
	if NativeArtOfDefense_Initialized ~= 1 then
		NativeArtOfDefense_Initialized = 1
		if MetaCreditShop_AlwaysOff~=1 then EnableMetaCreditShop() end
		if NativeArtOfDefense_RoundBased == 0 then 
			SetTimerCounter(max(First_Wave_Delay,Wave_Delay), "NAME:NextTurn", "WaveTimer")  
		else 
			RemoveAllTiberium()
			for z=1,getn(HumanTeams),1 do
				spawn("MetaControlDummyTakeMoney",HumanTeams[z],5)
				spawn("MetaControlDummyNAODRoundBasedHelper",HumanTeams[z],1,"NAODRoundBasedHelper" .. tostring(z))
				GiveMoney(HumanTeams[z],10000)
			end
		end
		SetCounter("CurrentWaveCounter", 0, "MG:Turn")
		--Diplomacy_System = 0
		if No_Wave_Limit==1 then 
			if Savegames and SavegameTable[GetTeamsDescriptiveName(HumanTeams[1])]["NAOD_highscore"]>3 then 
				Max_Waves=tonumber(SavegameTable[GetTeamsDescriptiveName(HumanTeams[1])]["NAOD_highscore"]) 
			else 
				Max_Waves=30 
			end 
		end
		ExecuteAction("TEAM_AI_TRANSFER",NAOD.Team,1)
		ExecuteAction("TEAM_SET_AI_RECRUITABLE_FLAG",NAOD.Team,1)
		ExecuteAction("SET_IGNORE_SKIRMISH_VICTORY_CONDITIONS", 0)
		--ExecuteAction("DISABLE_SCORING")
		if (NAOD.MapIntegration==1 or NAOD.MapIntegration==3) and NAOD.AreaRestriction then  ExecuteAction("HUMAN_IMPASSABLE_AREA", "SiegeGameplayBarrier", 1) end   --"CombatZone"
		NAOD.CurrentTeamToAttack=HumanTeams[1]
		for i=1,getn(HumanTeams),1 do
			tinsert(NAOD.EnemyTeamTable,HumanTeams[i])
			for j=1,getn(AITeams),1 do
				if Relation[HumanTeams[i]][AITeams[j]]==2 then --GPOT[Teams[i]]["ai"] == 1
					tinsert(NAOD.EnemyTeamTable,AITeams[j])
					tinsert(NAOD.AIAlliedTeamTable,AITeams[j])			
					ExecuteAction("TEAM_SET_ATTITUDE",AITeams[j],Behaviour["Agressive"])		  
					ExecuteAction("TEAM_GUARD_TEAM",AITeams[j],NAOD.CurrentTeamToAttack)
					else
					ExecuteAction("TEAM_SET_ATTITUDE", Teams[i], Behaviour["Passive"])
					DisableObject(GetBaseRef(AITeams[j]))
				end
			end
		end
		if AlliedPlayersNextToEachOther==1 then
			local MainPosition = GetObjectPosition(GetBaseRef(NAOD.EnemyTeamTable[1]))
			local mindist = 70
			local count=1
			for i=1,getn(Teams),1 do
				if Relation[NAOD.EnemyTeamTable[1]][Teams[i]]==2 and Teams[i]~=NAOD.EnemyTeamTable[1] then
					SpawnAtPosition(GetObj.Type(GetBaseRef(Teams[i])),Teams[i],MainPosition.x+(mindist*count),MainPosition.y+(mindist*count),0,"BASE_FLAG" .. "_" .. Teams[i],0,0,1,1)	    
					local DeleteOldBase = function() delete(GetBaseRef(Teams[%i])) pop() end
					push(DeleteOldBase)
					count=count+1
				end
			end
		end
		NAOD.MemoryTable.RoundType={}
		NAOD.MemoryTable.EventType={}
		NAOD.MemoryTable.SpawnFactor={}
		NAOD.MemoryTable.AllTeams={}
		NAOD.MemoryTable.AllTeams.EnemyTeamUnitCount={}
		NAOD.MemoryTable.AllTeams.DefenseStructureCount={}
		NAOD.MemoryTable.AllTeams.StructureCount={}
		NAOD.MemoryTable.AllTeams.VehicleCount={}
		NAOD.MemoryTable.AllTeams.AircraftCount={}
		NAOD.MemoryTable.AllTeams.InfantryCount={}
		NAOD.MemoryTable.AllTeams.VehicleAircraftCount={}
		NAOD.MemoryTable.AllTeams.AllUnitsCount={}
		NAOD.MemoryTable.AllTeams.ThreadLevel={}
		for i=1,getn(NAOD.EnemyTeamTable),1 do
			if PartOf(HumanTeams,NAOD.EnemyTeamTable[i]) then
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]]={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].DefenseStructureCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].StructureCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AircraftCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleAircraftCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].InfantryCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AllUnitsCount={}
				NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].ThreadLevel={}
			end
		end
		WaypointTable = GetWaypointTable()
		if IsEntryInTable(WaypointTable,"METAMOD_NAOD_SPAWN_WAYPOINT") or EvaluateCondition("COUNTER_COUNTER","METAMOD_NAOD",CompareTable["EQ"],CounterTable[1]) then NAOD.MapIntegration=1
		elseif IsEntryInTable(WaypointTable,"METAMOD_NAOD_SPAWN_WAYPOINT_OPTIONAL") then NAOD.MapIntegration=3 end 
		if EvaluateCondition("NAMED_NOT_DESTROYED", GetObjectStringRef("METAMOD_TOWERDEFENSE_OBJECT")) or EvaluateCondition("COUNTER_COUNTER","METAMOD_NAOD",CompareTable["EQ"],CounterTable[2]) then NAOD.MapIntegration=2 end
		if IsEntryInTable(WaypointTable,"METAMOD_NAOD_SPAWN_WAYPOINT_OPTIONAL") then
			NAOD.SpawnWaypoint="METAMOD_NAOD_SPAWN_WAYPOINT_OPTIONAL"
			elseif IsEntryInTable(WaypointTable,"METAMOD_NAOD_SPAWN_WAYPOINT") then 
			NAOD.SpawnWaypoint="METAMOD_NAOD_SPAWN_WAYPOINT"
			elseif IsEntryInTable(WaypointTable,"METAMOD_NAOD_WAYPOINT_PATH_START") then
			NAOD.SpawnWaypoint="METAMOD_NAOD_WAYPOINT_PATH_START"
			elseif IsEntryInTable(WaypointTable,"METAMOD_NAOD_WAYPOINT_PATH") then  --backup
			NAOD.SpawnWaypoint="METAMOD_NAOD_WAYPOINT_PATH"
			else 
			NAOD.SpawnWaypoint=GetFarthestWaypoint(NAOD.EnemyTeamTable[1])   --GetFarthestWaypointNotFromAllied GetClosestWaypointNotFromAllied 	    
		end
		if EvaluateCondition("COUNTER_COUNTER","METAMOD_NAOD_WAYPOINT_DISTANCE",CompareTable["GT"],CounterTable[0]) then
			NAOD.Distance=GetCounterValue("METAMOD_NAOD_WAYPOINT_DISTANCE")
			else
			--NAOD.Distance=WaypointDistanceTable[NAOD.SpawnWaypoint][NAOD.EnemyTeamTable[1]]  
		end	  
		if NAOD.MapIntegration==2 then NAOD.Tower = "METAMOD_TOWERDEFENSE_OBJECT"
			elseif NAOD.MapIntegration==4 then NAOD.Tower = "METAMOD_TOWERDEFENSE_OBJECT_OPTIONAL"
		end
		-- "PlyrCreeps/teamPlyrCreeps"
		--spawn(GENERIC,NAOD.Team,1,"CreepsTeamReferenceDummy",NAOD.SpawnWaypoint)
		spawn(MAIN_ANCHOR,NAOD.Team,1,"CreepsTeamReferenceDummy",NAOD.SpawnWaypoint)
		NAOD.TeamObjectRef=GetObjectLuaRef("CreepsTeamReferenceDummy")
		-- spawn("NAODTeamReferenceDummy",NAOD.EnemyTeamTable[1],1,"NAODEnemyTeamReferenceDummy",NAOD.SpawnWaypoint)
		-- NAOD.EnemyTeamOjectRef=GetObjectLuaRef("NAODEnemyTeamReferenceDummy")
		NAOD.CreatePersonality()
		if NAOD.MapIntegration==2 or NAOD.MapIntegration==4 then 
			--ExecuteAction("SHOW_MILITARY_CAPTION", "NATIVE_TOWER_DEFENSE_GAMEMODE_ACTIVE", 5) 
		else 
			--ExecuteAction("SHOW_MILITARY_CAPTION", "NATIVE_ART_OF_DEFENSE_GAMEMODE_ACTIVE", 5) 
		end
		--ExecuteAction("MOVIE_PLAY_RADAR", "NAODGAMEMODE")
	end	
end

function NAOD.RemoveTeamFromTablesIfDead()
	--tremove(
end

function NAOD.CreatePersonality()
	NAOD.Personality={}
	local CountTypes = { "DefenseStructureCount","StructureCount","VehicleCount","AircraftCount","InfantryCount","VehicleAircraftCount","AllUnitsCount","ThreadLevel" }
	if random(100)>10 then NAOD.Personality.AdaptFocus = "DefenseStructureCount" 
	else NAOD.Personality.AdaptFocus = CountTypes[random(getn(CountTypes))] end
	NAOD.ApplyAttackPrioritySetHandling()
end

function NAOD.EvolvePersonality()
	NAOD.Personality={}
	local CountTypes = { "DefenseStructureCount","VehicleCount","AircraftCount","StructureCount","InfantryCount","VehicleAircraftCount","AllUnitsCount","ThreadLevel" }
	NAOD.Personality.AdaptFocus = NextTableElement(CountTypes,NAOD.Personality.AdaptFocus)
	--NAOD.DynamicAttackPrioritySetHandling()
end

function NAOD.GetNegativeCountChangeMaximumWave(CountTable)
	if getn(CountTable)>1 then 
		local CountChangeTable={}
		CountChangeTable[1]=1
		for i=2,getn(CountTable),1 do
			CountChangeTable[i]=GTZero(CountTable[i])/GTZero(CountTable[i-1])
		end
		return GetIndexOfTableElement(CountChangeTable,GetMinValue(CountChangeTable))
	else return 1 end
end

function NAOD.GetNegativeCountChangeMaximum(CountTable)
	if getn(CountTable)>1 then 
		local CountChangeTable={}
		CountChangeTable[1]=1
		for i=2,getn(CountTable),1 do
			CountChangeTable[i]=GTZero(CountTable[i])/GTZero(CountTable[i-1])
		end
		return GetMinValue(CountChangeTable)
	else return 1 end
end

function NAOD.GetPositiveCountChangeMaximumWave(CountTable)
	if getn(CountTable)>1 then 
		local CountChangeTable={}
		CountChangeTable[1]=1
		for i=2,getn(CountTable),1 do
			CountChangeTable[i]=GTZero(CountTable[i])/GTZero(CountTable[i-1])
		end
		return GetIndexOfTableElement(CountChangeTable,GetMaxValue(CountChangeTable))
	else return 1 end
end

function NAOD.GetLastRoundCountChange(CountTable)
	if getn(CountTable)>1 then return GTZero(CountTable[getn(CountTable)])/GTZero(CountTable[getn(CountTable)-1])
	else return 1 end
end

function NAOD.ApplyAttackPrioritySetHandling()
	local AttackPrioritySet1="AttackPrioritySet1"
	local Priority=10
	ExecuteAction("SET_ATTACK_PRIORITY_THING",AttackPrioritySet1,"FarAttackerUnitList",10)
	ExecuteAction("SET_ATTACK_PRIORITY_KIND_OF",AttackPrioritySet1,"FS_BASE_DEFENSE",8)
	ExecuteAction("SET_DEFAULT_ATTACK_PRIORITY",AttackPrioritySet1,Priority)
	ExecuteAction("TEAM_APPLY_ATTACK_PRIORITY_SET",NAOD.TEAM,AttackPrioritySet1)
end   

function NAOD.DynamicAttackPrioritySetHandling()
end 

function NAOD.AdaptiveIntelligenceCore()
	--NAOD.MemoryTable.RoundType[NAOD.Wave]=NAOD.CurrentRoundType
    tinsert(NAOD.MemoryTable.RoundType,NAOD.CurrentRoundType)
	tinsert(NAOD.MemoryTable.SpawnFactor,NAOD.SpawnFactor)
	tinsert(NAOD.MemoryTable.AllTeams.EnemyTeamUnitCount,ObjectCountNearbyEnemies(NAOD.TeamObjectRef,13000)) 
	tinsert(NAOD.MemoryTable.AllTeams.DefenseStructureCount,0)
	tinsert(NAOD.MemoryTable.AllTeams.StructureCount,0)
	tinsert(NAOD.MemoryTable.AllTeams.VehicleCount,0)
	tinsert(NAOD.MemoryTable.AllTeams.AircraftCount,0)
	tinsert(NAOD.MemoryTable.AllTeams.InfantryCount,0)
	tinsert(NAOD.MemoryTable.AllTeams.VehicleAircraftCount,0)
	tinsert(NAOD.MemoryTable.AllTeams.AllUnitsCount,0)  
	tinsert(NAOD.MemoryTable.AllTeams.ThreadLevel,0)	
    for i=1,getn(NAOD.EnemyTeamTable),1 do
		if PartOf(HumanTeams,NAOD.EnemyTeamTable[i]) then
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].DefenseStructureCount,CountTeamsKindOf((NAOD.EnemyTeamTable[i]),"FS_BASE_DEFENSE"))
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].StructureCount,CountTeamsKindOf((NAOD.EnemyTeamTable[i]),"STRUCTURE") - NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].DefenseStructureCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].DefenseStructureCount)])
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleCount,CountTeamsKindOf((NAOD.EnemyTeamTable[i]),"VEHICLE"))
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AircraftCount,CountTeamsKindOf((NAOD.EnemyTeamTable[i]),"AIRCRAFT"))
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].InfantryCount,CountTeamsKindOf((NAOD.EnemyTeamTable[i]),"INFANTRY"))
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleAircraftCount, GetLastTableElement(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleCount) + GetLastTableElement(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AircraftCount))
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AllUnitsCount,( GetLastTableElement(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleCount) + GetLastTableElement(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AircraftCount) + GetLastTableElement(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].InfantryCount) ) )
			tinsert(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].ThreadLevel,GetTeamThreadLevel((NAOD.EnemyTeamTable[i])))
			NAOD.MemoryTable.AllTeams.DefenseStructureCount[getn(NAOD.MemoryTable.AllTeams.DefenseStructureCount)]=NAOD.MemoryTable.AllTeams.DefenseStructureCount[getn(NAOD.MemoryTable.AllTeams.DefenseStructureCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].DefenseStructureCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].DefenseStructureCount)]
			NAOD.MemoryTable.AllTeams.StructureCount[getn(NAOD.MemoryTable.AllTeams.StructureCount)]=NAOD.MemoryTable.AllTeams.StructureCount[getn(NAOD.MemoryTable.AllTeams.StructureCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].StructureCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].StructureCount)]
			NAOD.MemoryTable.AllTeams.VehicleCount[getn(NAOD.MemoryTable.AllTeams.VehicleCount)]=NAOD.MemoryTable.AllTeams.VehicleCount[getn(NAOD.MemoryTable.AllTeams.VehicleCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleCount)]
			NAOD.MemoryTable.AllTeams.AircraftCount[getn(NAOD.MemoryTable.AllTeams.AircraftCount)]=NAOD.MemoryTable.AllTeams.AircraftCount[getn(NAOD.MemoryTable.AllTeams.AircraftCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AircraftCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AircraftCount)]
			NAOD.MemoryTable.AllTeams.InfantryCount[getn(NAOD.MemoryTable.AllTeams.InfantryCount)]=NAOD.MemoryTable.AllTeams.InfantryCount[getn(NAOD.MemoryTable.AllTeams.InfantryCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].InfantryCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].InfantryCount)]
			NAOD.MemoryTable.AllTeams.VehicleAircraftCount[getn(NAOD.MemoryTable.AllTeams.VehicleAircraftCount)]=NAOD.MemoryTable.AllTeams.VehicleAircraftCount[getn(NAOD.MemoryTable.AllTeams.VehicleAircraftCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleAircraftCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].VehicleAircraftCount)]
			NAOD.MemoryTable.AllTeams.AllUnitsCount[getn(NAOD.MemoryTable.AllTeams.AllUnitsCount)]=NAOD.MemoryTable.AllTeams.AllUnitsCount[getn(NAOD.MemoryTable.AllTeams.AllUnitsCount)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AllUnitsCount[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].AllUnitsCount)]
			NAOD.MemoryTable.AllTeams.ThreadLevel[getn(NAOD.MemoryTable.AllTeams.ThreadLevel)]=NAOD.MemoryTable.AllTeams.ThreadLevel[getn(NAOD.MemoryTable.AllTeams.ThreadLevel)]+NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].ThreadLevel[getn(NAOD.MemoryTable[NAOD.EnemyTeamTable[i]].ThreadLevel)]
		end
	end  
	if NAOD.Wave > 7 then if NAOD.GetNegativeCountChangeMaximum(NAOD.MemoryTable.AllTeams[NAOD.Personality.AdaptFocus]) > 0.9 then NAOD.EvolvePersonality() end end
	if mod(NAOD.Wave,14)==0 and NAOD.GetNegativeCountChangeMaximum(NAOD.MemoryTable.AllTeams[NAOD.Personality.AdaptFocus]) > 0.97 then NAOD.SpawnFormula=NAOD.SpawnFormulaBrutal end
	if NAOD.Wave>Max_Waves and NAOD.GetNegativeCountChangeMaximum(NAOD.MemoryTable.AllTeams[NAOD.Personality.AdaptFocus]) > 0.80 then NAOD.SpawnFormula=NAOD.SpawnFormulaMain2 end
	if NAOD.Wave > 2 then NAOD.AdaptFactor = NAOD.GetLastRoundCountChange(NAOD.MemoryTable.AllTeams.DefenseStructureCount)*(0.5) + NAOD.GetLastRoundCountChange(NAOD.MemoryTable.AllTeams.VehicleAircraftCount)*(0.4) + NAOD.GetLastRoundCountChange(NAOD.MemoryTable.AllTeams.InfantryCount)*(0.1) end
    if NAOD.Wave > 1 and NAOD.StaticSpawnFactorRounds<=0 then 
		if NAOD.AdaptFactor>0.75 and NAOD.AdaptFactor<0.85 then NAOD.StaticSpawnFactorRounds=random(2,3) NAOD.SpawnFactor=NAOD.MemoryTable.SpawnFactor[getn(NAOD.MemoryTable.SpawnFactor)] --NAOD.SpawnFormula=NAOD.SpawnFormula2
			else if NAOD.AdaptFactor>0 then NAOD.SpawnFactor = round(NAOD.SpawnFormula(NAOD.AdaptFactor)) else NAOD.SpawnFactor = round(NAOD.SpawnFormula(1)) end 
		end	  
		else NAOD.StaticSpawnFactorRounds=NAOD.StaticSpawnFactorRounds-1
	end
	--out("WAVE:" .. NAOD.Wave .. " AdaptFactor:" .. NAOD.AdaptFactor .. " SpawnFactor:" .. NAOD.SpawnFactor .. " LastRoundType:" .. NAOD.CurrentRoundType .. " PersonalityFocus:" .. NAOD.Personality.AdaptFocus)
end

function NAOD.WaveTimeDifficultyFactor() if NativeArtOfDefense_RoundBased==1 then return NAOD.Wave*NAOD.DifficultyFactor else return (NAOD.Time/180)*NAOD.DifficultyFactor end end
function NAOD.BaseFormula() return (Max_Waves/(1+1*exp(-((1/(Max_Waves/7))*(NAOD.WaveTimeDifficultyFactor()-(Max_Waves/2)))))) end	 --logistic growth
function NAOD.BaseFormula2() return 1+(16*log(NAOD.WaveTimeDifficultyFactor()/2)) end	 --logarithmic growth
function NAOD.SpawnFormulaMain(AdaptFactor) if NAOD.Wave<8 then if AdaptFactor<1 then return NAOD.BaseFormula()*AdaptFactor*(random(98,102)/100) else return NAOD.BaseFormula()*(random(98,102)/100) end else return NAOD.BaseFormula()*AdaptFactor*(random(98,102)/100) end end
function NAOD.SpawnFormulaMain2(AdaptFactor) if NAOD.Wave<8 then if AdaptFactor<1 then return NAOD.BaseFormula2()*AdaptFactor*(random(98,102)/100) else return NAOD.BaseFormula2()*(random(98,102)/100) end else return NAOD.BaseFormula2()*AdaptFactor*(random(98,102)/100) end end
function NAOD.SpawnFormulaBrutal(AdaptFactor) return NAOD.BaseFormula()*ceil(AdaptFactor )*1.2 end

function NAOD.SpawnFormulaLin1(AdaptFactor) return (NAOD.SpawnFactor+1) * AdaptFactor * (random(85,115)/100) end 
function NAOD.SpawnFormulaLin2(AdaptFactor) return (NAOD.SpawnFactor+1) * AdaptFactor * (random(98,102)/100) end   
function NAOD.SpawnFormulaLin3(AdaptFactor) return (1 + (NAOD.Wave/3) + (NAOD.Time/210) + (NAOD.Wave/Max_Waves)*0.8) * AdaptFactor * (random(98,102)/100) end 
function NAOD.SpawnFormulaExtra1(AdaptFactor) return (1 + NAOD.Wave + NAOD.Time/210 + (NAOD.Wave/Max_Waves)*1.5^(round(NAOD.Wave/14))) * AdaptFactor * (random(98,102)/100) end
function NAOD.SpawnFormulaDynamic(AdaptFactor) return (NAOD.SpawnFactor+random(2,3)) * AdaptFactor * (random(85,115)/100) end  
function NAOD.SpawnFormulaLGG(AdaptFactor) return (50/(1+1*e^(-0.05*(NAOD.Wave-40))))*AdaptFactor end  

NAOD.SpawnFormulaTable = { NAOD.SpawnFormulaMain,NAOD.SpawnFormulaMain2,NAOD.SpawnFormulaLin1,NAOD.SpawnFormulaLin2,NAOD.SpawnFormulaLin3,NAOD.SpawnFormulaExtra1,NAOD.SpawnFormulaDynamic,NAOD.SpawnFormulaLGG }

NAOD.SpawnFormula = NAOD.SpawnFormulaMain

NAOD.Scalar={}
NAOD.Scalar.Infantry1	= 3.0
NAOD.Scalar.Vehicle1	= 2.15
NAOD.Scalar.Infantry2	= 2.0
NAOD.Scalar.Vehicle2	= 2.0
NAOD.Scalar.Air1		= 2.0
NAOD.Scalar.Infantry3	= 0.2 
NAOD.Scalar.Vehicle3	= 2.0
NAOD.Scalar.Air2		= 2.0
NAOD.Scalar.Vehicle4	= 0.2
NAOD.Scalar.StormriderSwarm			= 5.5
NAOD.Scalar.FanaticSquadSwarm		= 7.0
NAOD.Scalar.LowHealthAvatarSwar		= 8.0
NAOD.Scalar.BoostedAvatarsSwarm		= 0.35
NAOD.Scalar.AlienCustomizableVehicleSwarm	= 5.0
NAOD.Scalar.RandomUnitCategorySwarm			= 2.0
NAOD.Scalar.HammerheadZoneRaiderSwarm		= 5.0
--NAOD.Scalar.Endboss                     = 0.1
NAOD.Scalar.Tier1				= 3.0
NAOD.Scalar.Tier2				= 2.1
NAOD.Scalar.Tier3				= 2.0
NAOD.Scalar.Tier4				= 0.2
NAOD.Scalar.AntiAir				= 3.0
NAOD.Scalar.AntiInfantry		= 3.0
NAOD.Scalar.Distance			= 3.0

--unused MoneyDistribution (now in reward table)
function NAOD.MonetaryDistribution() return min(3000,500*NAOD.BaseFormula()) end   --for round based mode
function NAOD.MonetaryDistributionBase() return min(2000*NAOD.BaseFormula()^(0.9),NAOD.MoneyReceiveLimit) end        --for both, timed and round based modes

NAOD.UnitTableCategories = {"Infantry1","Infantry2","Infantry3","Vehicle1","Vehicle2","Vehicle3","Vehicle4","Air1","Air2","AntiAir","AntiInfantry","Distance"}
NAOD.UnitTable = {}
NAOD.UnitTable.Infantry1 = { "GDIRifleSoldierSquad", "GDIMissileSoldierSquad", "NODMilitantSquad", "NODMilitantRocketSquad", "BlackHandConfessorSquad", "AlienBuzzers", "AlienRazorDroneSquad" } 
NAOD.UnitTable.Infantry2 = { "AlienShockTrooperSquad", "Traveler59Stalker", "BlackHandBlackHandSquad", "NODShadowSquad", "NodFanaticSquad","ZOCOMZoneRaiderSquad", "GDIZoneTrooperSquad","GDIGrenadeSoldierSquad","MarkedOfKaneImprovedCyborgInfantrySquad" }  --"GDISniperSquad","Traveler59Cultist"
NAOD.UnitTable.Infantry3 = { "AlienMastermind", "NODCommando", "GDICommando" }
NAOD.UnitTable.Vehicle1  = { "NODAttackBike", "AlienCustomizableVehicle","NODScorpionBuggy", "SteelTalonsWolverine", "GDIPitbull", "SteelTalonsAPC", "NODRaiderTank", "AlienGunWalker", "Reaper17ShardWalker","AlienSeekerTank" }
NAOD.UnitTable.Vehicle2  = { "MarkedOfKaneBeamCannon", "BlackHandFlameTank", "NODStealthTank", "BlackHandMobileArtillery","GDIPredator", "SteelTalonsTitan", "AlienDevourerTank", "AlienCorrupter","ZOCOMImprovedSonicTank" } 
NAOD.UnitTable.Vehicle3  = { "NODAvatar", "BlackHandCustomWarmech","Reaper17AnnihilatorTripod","SteelTalonsMammoth","GDIJuggernaught","SteelTalonsBehemoth" }
NAOD.UnitTable.Vehicle4  = { "NodMetaUnit", "SteelTalonsMARV", "AlienEradicatorHexapod","AlienMothership" }
NAOD.UnitTable.Air1      = { "MarkedOfKaneVenom", "ZOCOMHammerhead", "Traveler59Stormrider", "GDIFireHawk","GDIOrca","NODVertigo" }
NAOD.UnitTable.Air2      = { "Traveler59DevastatorWarship", "Traveler59PlanetaryAssaultCarrier" }
NAOD.UnitTable.AntiAir   = { "SteelTalonsAAScout","NODStealthTank","AlienSeekerTank" }
NAOD.UnitTable.AntiInfantry = { "SteelTalonsWolverine", "NODScorpionBuggy" }
NAOD.UnitTable.Distance  = { "BlackHandMobileArtillery","GDIJuggernaught","SteelTalonsBehemoth", "Traveler59DevastatorWarship"}
NAOD.UnitTable.Engineers = { "AlienAssimilator","GDIEngineer","NODSaboteur" } 
NAOD.UnitTable.Misc      = { "GDIRig","SteelTalonsRepairAPC" } 

--TW-PORT overwritings
function TWPort_NAODUnits()
	NAOD.UnitTableCategories = {"Infantry1","Infantry2","Infantry3","Vehicle1","Vehicle2","Vehicle3","Vehicle4","Air1","Air2","AntiAir","AntiInfantry","Distance"}
	NAOD.UnitTable = {}
	NAOD.UnitTable.Infantry1 = { "GDIRifleSoldierSquad", "GDIMissileSoldierSquad", "NODMilitantSquad", "NODMilitantRocketSquad", "AlienBuzzers", "AlienRazorDroneSquad" } 
	NAOD.UnitTable.Infantry2 = { "AlienAssimilator","AlienShockTrooperSquad", "NODBlackHandSquad", "NODShadowSquad", "NodFanaticSquad", "GDIZoneTrooperSquad","GDIGrenadeSoldierSquad" }  --"GDISniperSquad","Traveler59Cultist"
	NAOD.UnitTable.Infantry3 = { "AlienMastermind", "NODCommando", "GDICommando" }
	NAOD.UnitTable.Vehicle1  = { "NODAttackBike", "NODScorpionBuggy", "GDIPitbull", "NODRaiderTank", "AlienGunWalker", "AlienSeekerTank", "GDIAPC" }
	NAOD.UnitTable.Vehicle2  = { "NODStealthTank", "GDIPredator", "AlienDevourerTank", "AlienCorrupter" } 
	NAOD.UnitTable.Vehicle3  = { "NODAvatar","AlienAnnihilatorTripod","GDIMammoth","GDIJuggernaught" }
	NAOD.UnitTable.Vehicle4  = { "AlienMothership" } 
	NAOD.UnitTable.Air1      = { "NODVenom", "GDIV35Ox", "Traveler59Stormrider","GDIOrca", "AlienStormrider" }
	NAOD.UnitTable.Air2      = { "AlienDevastatorWarship","AlienPlanetaryAssaultCarrier", "GDIFireHawk", "NODVertigo"}
	NAOD.UnitTable.AntiAir   = { "GDIPitbull","NODStealthTank","AlienSeekerTank" }
	NAOD.UnitTable.AntiInfantry = { "GDIAPC", "NODScorpionBuggy" }
	NAOD.UnitTable.Distance  = { "NODBeamCannon","GDIJuggernaught","AlienDevastatorWarship"}
	NAOD.UnitTable.Engineers = { "AlienAssimilator","GDIEngineer","NODSaboteur" } 
	NAOD.UnitTable.Misc      = { "GDIRig" } 
end

function NAOD.GetActionOnObjectTable(...)
	local ActionsOnObject={}
	local ind = 1
	if type(arg[1])=="table" then ActionsOnObject=arg[1] ind=2
	elseif arg[1]==nil then ind=2 end
	for i=ind,getn(arg),1 do if arg[i]~=nil then tinsert(ActionsOnObject,arg[i]) end end
	return ActionsOnObject
end

function NAOD.StandardUnitAttributes(object)
	ExecuteAction("UNIT_ENABLE_HOUSE_COLOR",object,0)
	ExecuteAction("NAMED_CUSTOM_COLOR",object,UnitColorTable.white)
	if not NAOD.MapIntegration==2 and not NAOD.MapIntegration==4 then ExecuteAction("UNIT_SET_STANCE", object, STANCE_TYPE["AGGRESSIVE"]) 
	else ExecuteAction("UNIT_SET_STANCE", object, STANCE_TYPE[NAOD.TowerDefenseEnemyStance]) end
	--ExecuteAction("NAMED_SET_STEALTH_ENABLED",object,0)
	--ExecuteAction("NAMED_SET_SPECIAL_WEAPONSET",object,1)  
	--ExecuteAction("UNIT_SET_FLAME_STATUS",object,1)
end

function NAOD.VariabelAttributesBoost(object,boostlevel) --unused
	NAOD.StandardUnitAttributes(object)
 	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS", object,boostlevel*1000)
	ExecuteAction("UNIT_SET_HEALTH", object,100)
	ExecuteAction("NAMED_FLASH_WHITE", object, 5)
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS",GetObjectLuaRef(object),"UNATTACKABLE",1)
	ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",object,GetObj.Type(object) .. "ExperienceLevel_" .. 4)
	ObjectSetObjectStatus(GetObjectLuaRef(object),"UNATTACKABLE")
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Indestructible", 1)
end

function NAOD.BoostAvatar(object)
    object=GetObjectLuaRef(object)
	ObjectHideSubObjectPermanently(object,"NUBEAM", false )
	ObjectHideSubObjectPermanently(object,"FLAMETANK", false )
	ObjectHideSubObjectPermanently(object,"S_DETECTOR", false )
	ObjectHideSubObjectPermanently(object,"S_GENERATOR", false )
	ObjectGrantUpgrade(object,"Upgrade_AvatarBeamCannon")
	ObjectGrantUpgrade(object,"Upgrade_AvatarStealthDetect")
	ObjectGrantUpgrade(object,"Upgrade_AvatarFlamer")
	ObjectGrantUpgrade(object,"Upgrade_AvatarStealthDetect")
	ObjectGrantUpgrade(object,"Upgrade_AvatarInvisibility")
	ObjectGrantUpgrade(object,"Upgrade_Veterancy_VETERAN")
	ObjectGrantUpgrade(object,"Upgrade_Veterancy_ELITE")
	ObjectGrantUpgrade(object,"Upgrade_Veterancy_HEROIC")
	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS",object,50000)  
	ExecuteAction("UNIT_SET_HEALTH",object,100)
end

function NAOD.AlienCustomizableVehicleSetModules(object)
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddShardModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddShardModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddDiskModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddDiskModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddRazorModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddRazorModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddTioxinModule")
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER",object,"SpecialPower_MechapedeAddTioxinModule")
end

function NAOD.Veterancy0(object) ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",object,GetObj.Type(object) .. "ExperienceLevel_" .. 1) end
function NAOD.Veterancy1(object) ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",object,GetObj.Type(object) .. "ExperienceLevel_" .. 2) end
function NAOD.Veterancy2(object) ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",object,GetObj.Type(object) .. "ExperienceLevel_" .. 3) end
function NAOD.Veterancy3(object) ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",object,GetObj.Type(object) .. "ExperienceLevel_" .. 4) ExecuteAction("UNIT_SET_EXPERIENCE_POINTS",object,50000)  end
function NAOD.AttributesBoosted1(object) ObjectCreateAndFireTempWeapon(GetObjectLuaRef(object),"AttributeBoost1Weapon") end --spawn("AttributeBooster1Dummy",NAOD.Team)
function NAOD.AttributesBoosted2(object) ObjectCreateAndFireTempWeapon(GetObjectLuaRef(object),"AttributeBoost2Weapon") end
function NAOD.AttributesBoosted3(object) ObjectCreateAndFireTempWeapon(GetObjectLuaRef(object),"AttributeBoost3Weapon") end
function NAOD.AttributesBoosted4(object) ObjectCreateAndFireTempWeapon(GetObjectLuaRef(object),"AttributeBoost4Weapon") end
function NAOD.SetRandomObjectColor(object) ExecuteAction("NAMED_CUSTOM_COLOR",object,UnitColorTable[UnitColors[random(getn(UnitColors))]]) end
function NAOD.LowHealth(object) ExecuteAction("UNIT_SET_HEALTH",object,10) end
function NAOD.EndbossBoost1(object) ObjectCreateAndFireTempWeapon(GetObjectLuaRef(object),"EndbossBoostWeapon1") end
function NAOD.SpeedBoost1(object) ObjectCreateAndFireTempWeapon(GetObjectLuaRef(object),"SpeedBoostWeapon1") end

function NAOD.StormriderSwarm(number,ActionsOnObject) spawn("Traveler59Stormrider", NAOD.Team, ceil(number*NAOD.Scalar.StormriderSwarm), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil) end 
function NAOD.FanaticSquadSwarm(number,ActionsOnObject) spawn("NodFanaticSquad", NAOD.Team, ceil(number*NAOD.Scalar.FanaticSquadSwarm), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil) end
function NAOD.LowHealthAvatarSwarm(number,ActionsOnObject) spawn("BlackHandCustomWarmech", NAOD.Team, ceil(number*NAOD.Scalar.LowHealthAvatarSwarm), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes,NAOD.LowHealth), nil) end
function NAOD.BoostedAvatarsSwarm(number,ActionsOnObject) spawn("NODAvatar", NAOD.Team, ceil(number*NAOD.Scalar.BoostedAvatarsSwarm), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes,NAOD.BoostAvatar), nil) end
function NAOD.AlienCustomizableVehicleSwarm(number,ActionsOnObject) spawn("AlienCustomizableVehicle", NAOD.Team, ceil(number*NAOD.Scalar.AlienCustomizableVehicleSwarm), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes,NAOD.AlienCustomizableVehicleSetModules), nil) end
function NAOD.RandomUnitTypeSwarm(number,ActionsOnObject) 
	local TierType = random(1,4)
	local UnitTableTier1 = { "Infantry1","Vehicle1" }
	local UnitTableTier2 = { "Infantry2","Vehicle2","Air1" }
	local UnitTableTier3 = { "Infantry3","Vehicle3","Air2" }
	local UnitTableTier4 = { "Vehicle4" }
	if TierType==1 then spawn(NAOD.UnitTable[UnitTableTier1[random(getn(UnitTableTier1))]][random(getn(NAOD.UnitTable[UnitTableTier1[random(getn(UnitTableTier1))]]))], NAOD.Team, ceil(number*NAOD.Scalar.Tier1), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil)
		elseif TierType==2 then spawn(NAOD.UnitTable[UnitTableTier2[random(getn(UnitTableTier2))]][random(getn(NAOD.UnitTable[UnitTableTier2[random(getn(UnitTableTier2))]]))], NAOD.Team, ceil(number*NAOD.Scalar.Tier2), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil)
		elseif TierType==3 then spawn(NAOD.UnitTable[UnitTableTier3[random(getn(UnitTableTier3))]][random(getn(NAOD.UnitTable[UnitTableTier3[random(getn(UnitTableTier3))]]))], NAOD.Team, ceil(number*NAOD.Scalar.Tier3), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil)
		elseif TierType==4 then spawn(NAOD.UnitTable[UnitTableTier4[random(getn(UnitTableTier4))]][random(getn(NAOD.UnitTable[UnitTableTier4[random(getn(UnitTableTier4))]]))], NAOD.Team, ceil(number*NAOD.Scalar.Tier4), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil)   
	end
end
function NAOD.RandomUnitCategorySwarm(number,ActionsOnObject) 
	local Category = NAOD.UnitTableCategories[random(getn(NAOD.UnitTableCategories))]
	for i=1,ceil(number*NAOD.Scalar[Category]),1 do
		spawn(NAOD.UnitTable[Category][random(getn(NAOD.UnitTable[Category]))], NAOD.Team, 1, nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes), nil)
	end 
end
function NAOD.HammerheadZoneRaiderSwarm(number,ActionsOnObject)  --placeholder cause of stack overflow error
	NAOD.AttackActionLock=true
	local UnlockAttackActions = function() NAOD.AttackActionLock=false end
	local ZoneRaiderSpawnAndEnterVehicle = function(object) 
		local EnterVehicle = function(passenger) SetScriptTimer(2,'ExecuteAction("NAMED_ENTER_NAMED","' .. passenger .. '","' .. %object .. '")') end
		--local ActionsOnZoneRaiderSquad = function(passenger)  if type(ActionOnObject)=="function" then ActionOnObject(passenger) elseif type(ActionOnObject)=="table" then for i=1,getn(ActionOnObject),1 do ActionOnObject[i](passenger) end end end
		spawn("ZOCOMZoneRaiderSquad", NAOD.Team, 1, nil, NAOD.SpawnWaypoint, EnterVehicle, nil) 
		--spawn("ZOCOMZoneRaiderSquad", NAOD.Team, 1, nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(%ActionsOnObject,NAOD.StandardUnitAttributes,EnterVehicle), nil) 
	end
	spawn("ZOCOMHammerhead", NAOD.Team, ceil(number*NAOD.Scalar.HammerheadZoneRaiderSwarm), nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes,ZoneRaiderSpawnAndEnterVehicle), nil)
    SetScriptTimer(15,UnlockAttackActions)
	SetScriptTimer(16,NAOD.AttackActions)
end
function NAOD.Endboss(number,ActionsOnObject)
	if random(100)>18 then spawn(NAOD.UnitTable.Vehicle4[random(getn(NAOD.UnitTable.Vehicle4))], NAOD.Team, number, nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes,NAOD.EndbossBoost1,NAOD.Veterancy3), nil)
	else spawn(NAOD.UnitTable.Vehicle4[random(getn(NAOD.UnitTable.Vehicle4))], NAOD.Team, number, nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes,NAOD.EndbossBoost1,NAOD.Veterancy3), nil) end
end
function NAOD.DefenseStructureAmbush()
	local RandomFocus = {"DefenseStructureList","FarAttackerUnitList"}
	local x,y = GetCoordinateCenterOfObjectTypeGroup(AdminTeamName,RandomFocus[random(getn(RandomFocus))])
	if x==0 or y==0 then NAOD.StandardSpawner() return
		else
		local RandGDef = function() return HeavyGroundDefenseStructuresTable[random(getn(HeavyGroundDefenseStructuresTable))] end
		LineSpawn(RandGDef,NAOD.Team,x-50,y-50,x+50,y+50,nil,1)
	end
end
function NAOD.UnitAmbush() 
	NAOD.AmbushDestObjRef="NAOD_Ambush_DestRef"
	local RandomFocus = {"DefenseStructureList","FarAttackerUnitList"}
	local ObjectTypeToSpawnOn = GenericDummyStay
	local x,y = GetCoordinateCenterOfObjectTypeGroup(AdminTeamName,RandomFocus[random(getn(RandomFocus))])
	local DeleteDestObjRef = function() delete(NAOD.AmbushDestObjRef) pop() end
	--print("coord" .. x .. " " .. y)
	if x==0 or y==0 then NAOD.StandardSpawner() return
		else
		DeleteAllObjectsWithRef("NAOD_Ambush_DestRef")
		SpawnAtPosition(ObjectTypeToSpawnOn,AdminTeamName,x,y,nil,NAOD.AmbushDestObjRef)
		local SpawnAmbush = function() 
			local RandUnit = function() local UnitCategory=ReturnRandomArgument("Vehicle1","Infantry1") return NAOD.UnitTable[UnitCategory][random(getn(NAOD.UnitTable[UnitCategory]))] end
			spawn(RandUnit, NAOD.Team, random(4,8), nil, nil, NAOD.GetActionOnObjectTable(NAOD.StandardUnitAttributes),%ObjectTypeToSpawnOn) 
			--SetScriptTimer(1,%DeleteDestRef)
			pop()
		end
		push(SpawnAmbush)
		push(DeleteDestObjRef)
	end
end
function NAOD.RandomSuperweapon()
	local RandomFocus = {"DefenseStructureList","FarAttackerUnitList"}
	local x,y = GetCoordinateCenterOfObjectTypeGroup(AdminTeamName,RandomFocus[random(getn(RandomFocus))])
	if x==0 or y==0 then return
		else
		local WeaponList = {"NuclearMissile","RiftGeneratorWeaponTrigger","IonCannonWeapon"}
		FireWeaponPosition(WeaponList[random(getn(WeaponList))],x,y) 
	end	
end
function NAOD.TeamHealthOverride()
	ExecuteAction("TEAM_SET_HEALTH",NAOD.Team,random(100,150))
end
function NAOD.TeamHealthOverrideExtreme()
	ExecuteAction("TEAM_SET_HEALTH",NAOD.Team,random(200,500))
end

function NAOD.CategorySpawner(category,ActionsOnObject)
	for j=1,( ceil(NAOD.Scalar[category]*NAOD.SpawnFactor*(random(90,110)/100)) ),1 do
		spawn(NAOD.UnitTable[category][random(getn(NAOD.UnitTable[category]))], NAOD.Team, 1, nil, NAOD.SpawnWaypoint, NAOD.GetActionOnObjectTable(ActionsOnObject,NAOD.StandardUnitAttributes))
	end
end

function NAOD.StandardSpawner(number,ActionsOnObject)
    local UnitCategoryTable = { [1]="Infantry1",[2]="Vehicle1",[3]="Infantry2",[4]="Vehicle2",[5]="Air1",[6]="Infantry3",[7]="Vehicle3",[8]="Air2",[9]="Vehicle4" }
	if NAOD.Wave >= 1 then NAOD.CategorySpawner("Infantry1",ActionsOnObject) end
	if NAOD.Wave >= floor(Max_Waves*0.2) and NAOD.Time >= 120 then NAOD.CategorySpawner("Infantry2",ActionsOnObject) end
	if NAOD.Wave >= floor(Max_Waves*0.25) and NAOD.Time >= 180 then NAOD.CategorySpawner("Vehicle1",ActionsOnObject) end	
	if NAOD.Wave >= floor(Max_Waves*0.35) and NAOD.Time >= 240 then NAOD.CategorySpawner(UnitCategoryTable[random(4,5)],ActionsOnObject) end	
	if NAOD.Wave >= floor(Max_Waves*0.35) and NAOD.Time >= 240 then NAOD.CategorySpawner(UnitCategoryTable[getn(UnitCategoryTable)],ActionsOnObject) end	
	if NAOD.Wave >= floor(Max_Waves*0.45) and NAOD.Time >= 300 then NAOD.CategorySpawner("Vehicle3",ActionsOnObject) end
	if NAOD.Wave >= floor(Max_Waves*0.7) and NAOD.Time >= 360 then NAOD.CategorySpawner("Infantry3",ActionsOnObject) end		
	if NAOD.Wave >= floor(Max_Waves*0.7) and NAOD.Time >= 360 then NAOD.CategorySpawner("Vehicle4",ActionsOnObject) end	
end

function NAOD.Spawner()
	local ActionsOnObject = {}
	if NAOD.Wave >= round(Max_Waves*0.80) and NAOD.Time >= 360 then tinsert(ActionsOnObject,NAOD.Veterancy3)
		elseif NAOD.Wave >= round(Max_Waves*0.55) and NAOD.Time >= 240 then tinsert(ActionsOnObject,NAOD.Veterancy2)
		elseif NAOD.Wave >= round(Max_Waves*0.25) and NAOD.Time >= 180 then tinsert(ActionsOnObject,NAOD.Veterancy1) 
	end
	if random(100)<25 then tinsert(ActionsOnObject,NAOD.RandomAttributesBoostTable[random(getn(NAOD.RandomAttributesBoostTable))]) end
	if NAOD.Wave<=3 then 
		NAOD.CurrentRoundType="StandardSpawner"
		NAOD.StandardSpawner(number,ActionsOnObject)
		elseif mod(NAOD.Wave,8)==0 then --endboss round
		NAOD.CurrentRoundType="Endboss"
		NAOD.Endboss(ceil(NAOD.Wave/8),ActionsOnObject)  
		elseif mod(NAOD.Wave,7)==0 then   --repeat the most successfull round type
		NAOD.CurrentRoundType=NAOD.MemoryTable.RoundType[NAOD.GetNegativeCountChangeMaximumWave(NAOD.MemoryTable.AllTeams[NAOD.Personality.AdaptFocus])]
		NAOD.RoundType[NAOD.CurrentRoundType](ceil(NAOD.Wave/7),ActionsOnObject)
		elseif mod(NAOD.Wave,5)==0 or random(100)<16 then --special round type                                
		NAOD.CurrentRoundType = GetRandomTableIndex(NAOD.RandomRoundType)
		RoundTypeFunction = NAOD.RandomRoundType[NAOD.CurrentRoundType]
		RoundTypeFunction(NAOD.SpawnFactor,ActionsOnObject)
		elseif mod(NAOD.Wave,6)==0 or random(100)<16 then
		if random(100)<50 then NAOD.RandomUnitCategorySwarm(NAOD.SpawnFactor,ActionsOnObject)
		else NAOD.RandomUnitTypeSwarm(NAOD.SpawnFactor,ActionsOnObject) end
		else	--normal round type
		NAOD.CurrentRoundType="StandardSpawner"
		NAOD.StandardSpawner(number,ActionsOnObject)
	end
	if random(20)<=1 and NAOD.Wave>3 then NAOD.EventTypeFunctions[NAOD.EventType[random(getn(NAOD.EventType))]]() end
	if random(100)<=1 and NAOD.Wave>3 then NAOD.RareEventTypeFunctions[NAOD.RareEventType[random(getn(NAOD.RareEventType))]]() end
end

NAOD.CurrentRoundType="StandardSpawner"
NAOD.RoundType={["StandardSpawner"]=NAOD.StandardSpawner,["RandomUnitTypeSwarm"]=NAOD.RandomUnitTypeSwarm,["RandomUnitCategorySwarm"]=NAOD.RandomUnitCategorySwarm,["StormriderSwarm"]=NAOD.StormriderSwarm,["FanaticSquadSwarm"]=NAOD.FanaticSquadSwarm,["LowHealthAvatarSwarm"]=NAOD.LowHealthAvatarSwarm,["BoostedAvatarsSwarm"]=NAOD.BoostedAvatarsSwarm,["AlienCustomizableVehicleSwarm"]=NAOD.AlienCustomizableVehicleSwarm,["HammerheadZoneRaiderSwarm"]=NAOD.HammerheadZoneRaiderSwarm,["Endboss"]=NAOD.Endboss1}  --"AmbushUnits","AmbushDefenseStructures"
NAOD.RandomRoundType={["RandomUnitTypeSwarm"]=NAOD.RandomUnitTypeSwarm,["RandomUnitCategorySwarm"]=NAOD.RandomUnitCategorySwarm,["StormriderSwarm"]=NAOD.StormriderSwarm,["FanaticSquadSwarm"]=NAOD.FanaticSquadSwarm,["LowHealthAvatarSwarm"]=NAOD.LowHealthAvatarSwarm,["BoostedAvatarsSwarm"]=NAOD.BoostedAvatarsSwarm,["AlienCustomizableVehicleSwarm"]=NAOD.AlienCustomizableVehicleSwarm,["HammerheadZoneRaiderSwarm"]=NAOD.HammerheadZoneRaiderSwarm} 
--TWPORT overwrittings
function TWPort_NAODFunctions()
	NAOD.RoundType={["StandardSpawner"]=NAOD.StandardSpawner,["RandomUnitTypeSwarm"]=NAOD.RandomUnitTypeSwarm,["RandomUnitCategorySwarm"]=NAOD.RandomUnitCategorySwarm,["FanaticSquadSwarm"]=NAOD.FanaticSquadSwarm,["BoostedAvatarsSwarm"]=NAOD.BoostedAvatarsSwarm,["Endboss"]=NAOD.Endboss1}  --"AmbushUnits","AmbushDefenseStructures"
	NAOD.RandomRoundType={["RandomUnitTypeSwarm"]=NAOD.RandomUnitTypeSwarm,["RandomUnitCategorySwarm"]=NAOD.RandomUnitCategorySwarm,["StormriderSwarm"]=NAOD.StormriderSwarm,["FanaticSquadSwarm"]=NAOD.FanaticSquadSwarm,["LowHealthAvatarSwarm"]=NAOD.LowHealthAvatarSwarm,["BoostedAvatarsSwarm"]=NAOD.BoostedAvatarsSwarm,["AlienCustomizableVehicleSwarm"]=NAOD.AlienCustomizableVehicleSwarm,["HammerheadZoneRaiderSwarm"]=NAOD.HammerheadZoneRaiderSwarm} 
end

--NAOD.EventType={"Superweapon","Meteorites","ForcePowerShutdown","Psychedelic+ConstantEarthquake","AllUnitsVet1","AllUnitsVet2","AllUnitsVet3","AllUnitsVet4"}
NAOD.EventType = { "UnitAmbush", "DefenseStructureAmbush", "TeamHealthOverride"}
NAOD.EventTypeFunctions={ ["UnitAmbush"]=NAOD.UnitAmbush, ["DefenseStructureAmbush"]=NAOD.DefenseStructureAmbush, ["TeamHealthOverride"]=NAOD.TeamHealthOverride }
NAOD.RareEventType = { "RandomSuperweapon","TeamHealthOverrideExtreme" }
NAOD.RareEventTypeFunctions = { ["RandomSuperweapon"]=NAOD.RandomSuperweapon, ["TeamHealthOverrideExtreme"]=NAOD.TeamHealthOverrideExtreme }
NAOD.RandomAttributesBoostTable={NAOD.AttributesBoosted1,NAOD.AttributesBoosted2,NAOD.AttributesBoosted3,NAOD.AttributesBoosted4,NAOD.SpeedBoost1,NAOD.SetRandomObjectColor}

function NAOD.AttackActions()  
	if NAOD.AttackActionLock then return end
	local IssueAttackActionTask = function()
		if IsEntryInTable(WaypointTable,"METAMOD_NAOD_WAYPOINT_PATH_START") then
			if not NAOD.FollowWaypointCommandIssued then
				--ExecuteAction("TEAM_ATTACK_MOVE_FOLLOW_WAYPOINTS",NAOD.Team,"METAMOD_NAOD_WAYPOINT_PATH",0,0) --as a team,in formation 	 
				ExecuteAction("TEAM_FOLLOW_WAYPOINTS",NAOD.Team,"METAMOD_NAOD_WAYPOINT_PATH",0,0)               --as a team,in formation 	
				NAOD.FollowWaypointCommandIssued=true
				--ExecuteAction("TEAM_FOLLOW_WAYPOINTS_EXACT",NAOD.Team,"METAMOD_NAOD_WAYPOINT_PATH",0)         --as a team
				--ExecuteAction("TEAM_WANDER",NAOD.Team,"METAMOD_NAOD_WAYPOINT_PATH")
				--ExecuteAction("TEAM_PANIC",NAOD.Team,"METAMOD_NAOD_WAYPOINT_PATH")
				--ExecuteAction("SKIRMISH_FOLLOW_APPROACH_PATH", NAOD.Team, ApproachPath["Center"], 1)
				--ExecuteAction("SKIRMISH_MOVE_TO_APPROACH_PATH", NAOD.Team, ApproachPath_[random(4)])  
				--if NAOD.MapIntegration==2 and EvaluateCondition("TEAM_REACHED_WAYPOINTS_END",NAOD.Team,"METAMOD_NAOD_WAYPOINT_PATH") then ExecuteAction("TEAM_ATTACK_NAMED",NAOD.Team,"METAMOD_TOWERDEFENSE_OBJECT") end
				--EvaluateCondition("NAMED_REACHED_WAYPOINTS_END",ref,"METAMOD_NAOD_WAYPOINT_PATH")	
				else if NAOD.MapIntegration==2 or NAOD.MapIntegration==4 then NAOD.UnitsAttackTower() end 
			end
			else
			ExecuteAction("TEAM_EXIT_ALL_BUILDINGS",NAOD.Team)  
			ExecuteAction("TEAM_WANDER_IN_PLACE",NAOD.Team)
			if NAOD.MapIntegration==2 or NAOD.MapIntegration==4 then
				ExecuteAction("TEAM_ATTACK_NAMED",NAOD.Team,NAOD.Tower)
				--ExecuteAction("ATTACK_MOVE_TEAM_TO_NAMED_OBJECT",NAOD.Team,"METAMOD_TOWERDEFENSE_OBJECT")	
				else
				ExecuteAction("TEAM_HUNT", NAOD.Team)	 
				if AlliedPlayersNextToEachOther==1 then 
					ExecuteAction("MOVE_TEAM_TO",NAOD.Team,GetPlayerStartWaypointByTeam(NAOD.EnemyTeamTable[1])) 
					ExecuteAction("ATTACK_MOVE_TEAM_TO",GetPlayerStartWaypointByTeam(NAOD.EnemyTeamTable[1])) 
					else 
					ExecuteAction("MOVE_TEAM_TO",NAOD.Team,GetPlayerStartWaypointByTeam(NAOD.CurrentTeamToAttack)) 
					ExecuteAction("ATTACK_MOVE_TEAM_TO",GetPlayerStartWaypointByTeam(NAOD.CurrentTeamToAttack)) 
				end
				ExecuteAction("TEAM_ATTACK_TEAM", NAOD.Team, NAOD.CurrentTeamToAttack)
			end
		end
		NAOD.AlliedAIHandle()
		NAOD.CurrentTeamToAttack=NextTableElement(HumanTeams,NAOD.CurrentTeamToAttack)
	end
	if not NAOD.PreAttackActionsIssued then
		NAOD.PreAttackActionsIssued = true
		ExecuteAction("TEAM_EXIT_ALL_BUILDINGS",NAOD.Team)  
		ExecuteAction("TEAM_WANDER_IN_PLACE",NAOD.Team)
		SetScriptTimer(3,IssueAttackActionTask)
	else IssueAttackActionTask() end
end

function NAOD.AlliedAIHandle()
	-- if NAOD.MapIntegration==2 or NAOD.MapIntegration==4 then
	-- for i=1,getn(NAOD.EnemyTeamTable),1 do if GPOT[NAOD.EnemyTeamTable[i]]["ai"]==1 then ExecuteAction("TEAM_GUARD_OBJECT",NAOD.EnemyTeamTable[i],NAOD.Tower) end end
	-- else
	-- for i=1,getn(NAOD.EnemyTeamTable),1 do if GPOT[NAOD.EnemyTeamTable[i]]["ai"]==1 and Relation[NAOD.EnemyTeamTable[1]][NAOD.CurrentTeamToAttack]==2 then ExecuteAction("TEAM_GUARD_TEAM",NAOD.EnemyTeamTable[i],NAOD.CurrentTeamToAttack) end end
	-- end
	for i=1,getn(NAOD.EnemyTeamTable),1 do 
		if PartOf(AITeams,NAOD.EnemyTeamTable[i]) then 
			ExecuteAction("TEAM_ATTACK_TEAM",NAOD.EnemyTeamTable[i],NAOD.Team) 
		end 
	end
end

NAOD.LastReferenceDistance = 0
function NAOD.UnitsAttackTower()
	local ReferenceDistance = GetTeamDistance(NAOD.Team,NeutralTeam) --CivilianTeam
	local UnitNearTower = false
	if not NAOD.TeamObjectListRefreshed then NAOD.TeamObjectList = GetStringRefListOfAllObjectsForTeam(NAOD.Team) end
	for i=1,getn(NAOD.TeamObjectList),1 do
		if EvaluateCondition("DISTANCE_BETWEEN_OBJ",NAOD.TeamObjectList[i]["ref"],NAOD.Tower, CompareTable["<"], NAOD.TowerDistanceForAttackCommand) then ExecuteAction("NAMED_ATTACK_NAMED",NAOD.TeamObjectList[i]["ref"],NAOD.Tower) UnitNearTower = true end
	end
	if not UnitNearTower and ReferenceDistance==NAOD.LastReferenceDistance then ExecuteAction("TEAM_ATTACK_NAMED",NAOD.Team,NAOD.Tower) end
	NAOD.LastReferenceDistance=ReferenceDistance
end

function NAOD.NativeArtOfDefenseMain()
	NAOD.InitializeNativeArtOfDefense()
    local StartNextWave = function()
		ExecuteAction("SHOW_MILITARY_CAPTION", "\n\n\nattack wave " .. NAOD.Wave .. " starts!!!", 5)
		NAOD.AdaptiveIntelligenceCore()
		NAOD.Spawner()
		NAOD.AttackActions()
		NAOD.TeamObjectCountInitial = CountAllObjectsOfTeam(NAOD.Team)
		ExecuteAction("SCREEN_SHAKE", SHAKE_INTENSITY["CINE_INSANE"]) 
		ExecuteAction("PLAY_SOUND_EFFECT", "GDI_Battleship_Alarm")
		local MissionObj = { "Aeva_NewObjectReci","Aeva_NewMissObjRec"}
		ExecuteAction("PLAY_SOUND_EFFECT", MissionObj[random(1,2)])
		SetCounter("CurrentWaveCounter", NAOD.Wave, "MG:Turn")
		NAOD.TeamObjectCount = CountAllObjectsOfTeam(NAOD.Team)
		SetCounter("EnemyCounter", NAOD.TeamObjectCount, "APT:EnemyArmyInfo")		
	end	
    local GiveXpAndMoney = function()
		for i=1,getn(NAOD.EnemyTeamTable),1 do
			GiveMoney(NAOD.EnemyTeamTable[i],Reward.Money.NAOD.EachRound.Base())
			if GPOT[NAOD.EnemyTeamTable[i]]["ai"]==0 then
				MetaStatsAddXP(NAOD.EnemyTeamTable[i],Reward.XP.NAOD.EachRound())
				GiveMetaCredits(NAOD.EnemyTeamTable[i],Reward.MC.NAOD.EachRound)
			end
		end		
	end
    NAOD.TeamObjectCount = CountAllObjectsOfTeam(NAOD.Team)
	SetCounter("EnemyCounter", NAOD.TeamObjectCount, "APT:EnemyArmyInfo")	
	NAOD.Time = NAOD.Time + NAOD.PeriodTime 
    --SetCounter("DistanceCounter", GetTeamDistance(GetTeamName(object1),NAOD.Team), "Counter:Distance")
    if NativeArtOfDefense_RoundBased==0 then
        if NAOD.TeamObjectCount<=NAOD.RemainingUnitsLimit and NAOD.TimerStatus==0 and (NAOD.Wave<Max_Waves or No_Wave_Limit==1) then 
			if NAOD.Wave == 0 then 
				NAOD.TimerTime = max(First_Wave_Delay,Wave_Delay)
				SetTimerCounter(Wave_Delay, "NAME:NextTurn", "WaveTimer") 			  
				else 
				NAOD.TimerTime = Wave_Delay 
				SetTimerCounter(Wave_Delay, "NAME:NextTurn", "WaveTimer") 	
				if MetaCreditSystem then GiveXpAndMoney() end   
			end
			NAOD.TimerStatus=1
			elseif NAOD.TimerStatus==1 then 
			NAOD.TimerTime = NAOD.TimerTime - NAOD.PeriodTime    
            if NAOD.TimerTime <= 0 and (NAOD.Wave<Max_Waves or No_Wave_Limit==1) then 
				NAOD.TimerStatus=0
				NAOD.Wave = NAOD.Wave + 1			   
				NAOD.FollowWaypointCommandIssued = false
				NAOD.PreAttackActionsIssued = false
				NAOD.TeamObjectListRefreshed=false
				StartNextWave()
			end
		end		
		else
		if NAOD.NextRoundIndicator==1 then
			ExecuteAction("DISABLE_UI_PLAYER_POWER_BUTTON", "SpecialPower_NAOD_NextWave", 1)
			NAOD.NextRoundIndicator=0
			NAOD.Wave = NAOD.Wave + 1
			StartNextWave()
			NAOD.XpAndMoneyReceived=0
			elseif NAOD.TeamObjectCount<=NAOD.RemainingUnitsLimit then 	
			ExecuteAction("DISABLE_UI_PLAYER_POWER_BUTTON", "SpecialPower_NAOD_NextWave",0)
			if MetaCreditSystem and NAOD.XpAndMoneyReceived==0 then
				NAOD.XpAndMoneyReceived=1
				for i=1,getn(NAOD.EnemyTeamTable),1 do GiveMoney(NAOD.EnemyTeamTable[i],Reward.Money.NAOD.EachRound.RoundBased()) end	
				GiveXpAndMoney()
			end			 
		end
	end 
    NAOD.AttackActions() --if mod(NAOD.Time,30)==0 then NAOD.AttackActions() end
	if (No_Wave_Limit == 0) and ((not EvaluateCondition("TEAM_HAS_UNITS", NAOD.Team)) or NAOD.TeamObjectCount<=NAOD.RemainingUnitsLimit) and NAOD.Wave>=Max_Waves then NAOD.GameOverState = true ExecuteAction("VICTORY") end 
    for i=1,getn(NAOD.EnemyTeamTable),1 do if CountTeamsKindOf(NAOD.EnemyTeamTable[i],"STRUCTURE")==0 and CountTeamsKindOf(NAOD.EnemyTeamTable[i],"VEHICLE")==0 then NAOD.GameOverState = true ExecuteAction("TEAM_KILL",NAOD.EnemyTeamTable[i]) end end
    if (NAOD.MapIntegration==2 or NAOD.MapIntegration==4) and not EvaluateCondition("NAMED_NOT_DESTROYED", GetObjectStringRef(NAOD.Tower)) then NAOD.GameOverState = true ExecuteAction("DEFEAT") end
	if NAOD.GameOverState then 
		for i=1,getn(HumanTeams),1 do 
			if NAOD.Wave>3 then 
				if MetaCreditSystem then 
					GiveMetaCredits(HumanTeams[i],Reward.MC.NAOD.GameOver) 
				end 
			end 
			if Savegames and MetaCreditSystem and Max_Waves>SavegameTable[GetTeamsDescriptiveName(HumanTeams[i])]["NAOD_highscore"] and NAOD.Wave>3 then 
				GiveMetaCredits(HumanTeams[i],(Max_Waves-SavegameTable[GetTeamsDescriptiveName(HumanTeams[i])]["NAOD_highscore"])*Reward.MC.NAOD.EachNewHighscoreRound) 
				SavegameTable[GetTeamsDescriptiveName(HumanTeams[i])]["NAOD_highscore"]=Max_Waves 
			end 
		end 
	end
end

GenericDummy = GENERIC_DUMMY --compat meta mod framework

function MakeWaypointDistanceTable()
	local CreateDistanceTable = function()
		local distance=0
		for i=1,getn(WaypointTable),1 do 
			WaypointDistanceTable[WaypointTable[i]]={} 
		end
		for i=1,getn(WaypointTable),1 do
			for j=1,getn(WaypointTable),1 do
				if i == j then 
					WaypointDistanceTable[WaypointTable[i]][WaypointTable[j]]=0 
				else 
					distance=GetObjectDistance(WaypointTable[i] .. "_Object",WaypointTable[j] .. "_Object")  
					WaypointDistanceTable[WaypointTable[i]][WaypointTable[j]]=distance 
					WaypointDistanceTable[WaypointTable[j]][WaypointTable[i]]=distance
				end      
			end
		end
		for i=1,getn(WaypointTable),1 do 
			delete(WaypointTable[i] .. "_Object") 
		end
	end
	for i=1,getn(WaypointTable),1 do 
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT",WaypointTable[i] .. "_Object",GenericDummy,NeutralTeam,WaypointTable[i]) 
	end
	SetScriptTimerFast(0.01, CreateDistanceTable)
end

function GetFarthestWaypoint(team)
	local ReferenceWaypoint = GetPlayerStartWaypointByTeam(team)
	local DistanceTable={}
	for i=1,getn(WaypointTable),1 do tinsert(DistanceTable,WaypointDistanceTable[ReferenceWaypoint][WaypointTable[i]]) end   
	return WaypointTable[GetIndexOfTableElement(DistanceTable,GetMaxValue(DistanceTable))]
end

function NativeArtOfDefenseRoundBased()
	NAOD.NextRoundIndicator = 1
	NAOD.FollowWaypointCommandIssued = false
	NAOD.PreAttackActionsIssued = false
	NAOD.TeamObjectListRefreshed=false
	NAOD.NativeArtOfDefenseMain()   
end                                    

if SAGE_GAME == CNC3TW then
	TWPort_NAODUnits()
end

function spawn(ObjectType,team,number,ref,waypoint,ActionOnObject,OnObjectType)
	if number == 0 or ObjectType == nil then return end 
	if number == nil then number = 1 end
	--if ObjectType == nil then ObjectType=ObjectTypeTable[random(getn(ObjectTypeTable))] end
	if team == nil then team = LocalTeam end
	local waypoint_ = ""
	local ObjectType_ = ""
	if type(ObjectType)=="string" then ObjectType_=ObjectType end
	if waypoint~=nil then waypoint_= waypoint --strsub(team, 1, 8) .. "_Start"
	else waypoint_=GetPlayerStartWaypointByTeam(team) end
	local OBJECTREF = ""
	if OnObjectType~=nil then
		for j=1,number,1 do
			if type(ObjectType)=="function" then ObjectType_=ObjectType() end
			if ref == nil then OBJECTREF = "object_" .. floor(99999999*GetRandomNumber()) 
			else OBJECTREF = ref end
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_OBJECTTYPE_WITH_ORIENTATION",OBJECTREF,ObjectType_,team,OnObjectType,0)  
			if ActionOnObject~=nil then if type(ActionOnObject)=="function" then ActionOnObject(OBJECTREF) elseif type(ActionOnObject)=="table" then for i=1,getn(ActionOnObject),1 do ActionOnObject[i](OBJECTREF) end end end
			if number==1 then return OBJECTREF end
		end
	elseif true then --IsEntryInTable(WaypointTable,waypoint_) then
		for j=1,number,1 do
			if type(ObjectType)=="function" then ObjectType_=ObjectType() end
			if number==1 or ActionOnObject~=nil then
				if ref == nil then OBJECTREF = "object_" .. floor(99999999*GetRandomNumber()) 
				else OBJECTREF = ref end
				ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT",OBJECTREF,ObjectType_,team,waypoint_)
				if ActionOnObject~=nil then if type(ActionOnObject)=="function" then ActionOnObject(OBJECTREF) elseif type(ActionOnObject)=="table" then for i=1,getn(ActionOnObject),1 do ActionOnObject[i](OBJECTREF) end end end
				if number==1 then return OBJECTREF end
				else
				ExecuteAction("CREATE_UNNAMED_ON_TEAM_AT_WAYPOINT",ObjectType_,team,waypoint_)	
			end
		end
	else
		for j=1,number,1 do
			if type(ObjectType)=="function" then ObjectType_=ObjectType() end
			if number==1 or ActionOnObject~=nil then	
				if ref == nil then OBJECTREF = "object_" .. floor(99999999*GetRandomNumber()) 
				else OBJECTREF = ref end
				ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",OBJECTREF,ObjectType_,team,'((0.00,0.00,0.00))', 0)
				if ActionOnObject~=nil then if type(ActionOnObject)=="function" then ActionOnObject(OBJECTREF) elseif type(ActionOnObject)=="table" then for i=1,getn(ActionOnObject),1 do ActionOnObject[i](OBJECTREF) end end end
				if number==1 then return OBJECTREF end
				else
				ExecuteAction("CREATE_OBJECT",ObjectType,team,'((0.00,0.00,0.00))', 0)
			end
		end
	end
end

MakeWaypointDistanceTable()

function StartGamemode()
	NAOD.InitializeNativeArtOfDefense()	
	SetScriptTimer(10,NAOD.NativeArtOfDefenseMain,-1)
end

SetScriptTimer(1,StartGamemode,1)