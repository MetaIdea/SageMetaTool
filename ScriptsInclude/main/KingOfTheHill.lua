NAME	 	= "King of the Hill"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "BFME2,BFME2ROTWK,CNC3TW,CNC3KW,RA3,RA3U"
DESCRIPTION = "Hold the Center of the map exclusively for a certain ammount of time to win\nThis gamemode is inspired by the Xbox exclusive gamemode"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

------------------------------------------------------------------
----------------------SCRIPT SECTION------------------------------
------------------------------------------------------------------

GAMEMODE = "KOTH"

ExecuteAction("SHOW_MILITARY_CAPTION", "GUI:KotH", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")
--"Capture to become King of the Hill\nIncreases resources and\ndecrease Power recharge times"

CENTER_TRIGGER_RADIUS = 150
TIME_IN_TRIGGER_VICTORY_CONDITION = 60
AI_TRIGGER_DELAY = 5

function SpawnCenterCNC3()
	CreepsTeam="PlyrCreeps/teamPlyrCreeps"
	local CrystalShield = GetUnitName()
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",CrystalShield,"AlienCrystalShield",NeutralTeam,{MapSizeX/2, MapSizeY/2, GetHeightAtPosition(MapSizeX/2, MapSizeY/2)}, 0)	
	ExecuteAction("NAMED_SET_HELD", CrystalShield, 1)
	ExecuteAction("NAMED_SET_SLEEP_STATUS", CrystalShield, 1)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", CrystalShield, "Enabled", 0) 	
	
	
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"MG_Alien_TerraformingNexus","team",{MapSizeX/2, MapSizeY/2, GetHeightAtPosition(MapSizeX/2, MapSizeY/2) - 300}, 0)
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",CENTER_STRING_REF,"RallyPointMarker","team",{MapSizeX/2, MapSizeY/2, GetHeightAtPosition(MapSizeX/2, MapSizeY/2)}, 0)  --"RallyPointMarker"
	CENTER_LUA_REF = GetObjectLuaRef(CENTER_STRING_REF)
	--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"MG_NOD_DisruptionGenerator","team",{MapSizeX/2, MapSizeY/2, MapSizeZ}, 0)
	--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",GetUnitName(),"RiftGeneratorWeaponObject","team",{MapSizeX/2, MapSizeY/2, 300}, 0)
end

function AICoroutine()
	AI_TIME_TO_TRIGGER = AI_TIME_TO_TRIGGER - 1
	if AI_TIME_TO_TRIGGER <= 0 then 
		AI_TIME_TO_TRIGGER = AI_TRIGGER_DELAY
		for i=1,getn(AITeams),1 do
			--ExecuteAction("TEAM_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", AITeams[i], CENTER_STRING_REF)
			ExecuteAction("ATTACK_MOVE_TEAM_TO_NAMED_OBJECT", AITeams[i], CENTER_STRING_REF)
			--ExecuteAction("UNIT_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", UNIT, OBJECT_TYPE)
			--ExecuteAction("TEAM_MOVE_TO_NEAREST_OBJECT_OF_KINDOF", TEAM, KIND_OF)
			--ExecuteAction("TEAM_MOVE_TO_NEAREST_OBJECT_OF_KINDOF_OWNED_BY_PLAYER", TEAM, KIND_OF, PLAYER)
			--ExecuteAction("TEAM_MOVE_TO_NEAREST_OBJECT_OF_TYPE", TEAM, OBJECT_TYPE_LIST)
			--ExecuteAction("TEAM_MOVE_TO_NEAREST_OBJECT_OF_TYPE_OWNED_BY_PLAYER", AITeams[i], OBJECT_TYPE_LIST, "PlyrCreeps")
		end
		
		-- local AIRoutine = function(Object)
			-- if 
		-- end
		
		
		-- ActionOnAllObjects(Action)
		--ExecuteAction("UNIT_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", Object, CENTER_STRING_REF)
		-- EvaluateCondition("ENEMY_SIGHTED", UNIT, RELATION, PLAYER)
		-- EvaluateCondition("ENEMY_SIGHTED_BY_TEAM", TEAM, RELATION, PLAYER)
	end
end

function IsPartOfTable(TheTable, content)
	if TheTable and content then
		for i=1,getn(TheTable),1 do
			if TheTable[i] == content then
				return true
			end
		end
		return false
	end
end

function CheckCenterAreaTrigger()
	--ALTERNATIVE: EvaluateCondition("PLAYER_HAS_NUMBER_UNITS_DISTANCE_FROM_OBJECT", PLAYER, COMPARISON, INT, REAL, UNIT)
	--if ObjectCountNearbyEnemies(CENTER_LUA_REF, CENTER_TRIGGER_RADIUS) > 0 then
	local ObjectDistance = 0
		for ObjectIndex,Object in globals() do
			if strfind(ObjectIndex,"ObjID") then
				if IsPartOfTable(Teams, GetTeam(Object)) then
					ObjectDistance = ObjectGetDistance(CENTER_LUA_REF, Object)
					if CENTER_LUA_REF ~= Object and ObjectDistance > 0 and ObjectDistance <= CENTER_TRIGGER_RADIUS then
						TriggerTeam = GetTeam(Object)
						TeamInsideTriggerAreaCount = TeamInsideTriggerAreaCount + 1
					end
				end
			end
		end
	--end
	
	--ALTERNATIVE
	--EvaluateCondition("PLAYER_HAS_NUMBER_UNITS_DISTANCE_FROM_OBJECT", PLAYER, COMPARISON, INT, REAL, UNIT)
end

function InitGamemode()
	MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
	OBJECT_TYPE_LIST = "OBJECT_TYPE_LIST1"
	ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", OBJECT_TYPE_LIST, "RallyPointMarker")	
	RELATION = { ["Enemy"]=0, ["Neutral"]= 1, ["Friend"]=2 }
	CENTER_STRING_REF = GetUnitName()
	if SAGE_GAME == CNC3 or SAGE_GAME == CNC3KW then
		SpawnCenterCNC3()
	else
		SpawnCenterCNC3()
	end
	DistanceTable = {}
	ScoreTable = {}
	AI_TIME_TO_TRIGGER = AI_TRIGGER_DELAY
	LastCountdownMin = TIME_IN_TRIGGER_VICTORY_CONDITION
	TriggerAlarmSound = false
	for i=1,getn(Teams),1 do
		ScoreTable[Teams[i]] = TIME_IN_TRIGGER_VICTORY_CONDITION
		SetCounter(Teams[i] .. "_COUNTER", ScoreTable[Teams[i]], "NUMBER:" .. strsub(Teams[i],8,8))	
	end
	TeamInsideTriggerAreaCount = 0
	TeamInsideTriggerAreaCountLast = 0
end

function CountdownSpeechCheck(countdown)
	if countdown <= 10 then
		ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerCount[countdown])
		ExecuteAction("SHOW_MILITARY_CAPTION", "NUMBER:" .. countdown)		
	end
end

function CountdownSpeechRoutine()
	local CountdownMin = LastCountdownMin
	for i=1,getn(Teams),1 do
		if ScoreTable[Teams[i]] < CountdownMin then
			CountdownMin = ScoreTable[Teams[i]]
		end
	end
	if CountdownMin < LastCountdownMin then
		CountdownSpeechCheck(CountdownMin)
	end
	LastCountdownMin = CountdownMin
end

function KotH_Master_Coroutine()
	CheckCenterAreaTrigger()
	if TeamInsideTriggerAreaCount == 1 and TriggerTeam then
		if TeamInsideTriggerAreaCountLast ~= TeamInsideTriggerAreaCount then
			ExecuteAction("PLAY_SOUND_EFFECT", "GDI_Battleship_Alarm")
		end
		ScoreTable[TriggerTeam]=ScoreTable[TriggerTeam]-1
		--ExecuteAction("SHOW_MILITARY_CAPTION", "\n\nRamaining Time: " .. ScoreTable[TriggerTeam], 5)
		DecrementCounter(TriggerTeam .. "_COUNTER")
		-- for i=1,getn(Teams),1 do
			-- SetCounter(Teams[i] .. "_COUNTER", ScoreTable[Teams[i]], "NUMBER:" .. strsub(Teams[i],8,8))	
		-- end
		if ScoreTable[TriggerTeam] <= 0 then
			for i=1,getn(Teams),1 do
				if Teams[i] ~= TriggerTeam then
					ExecuteAction("TEAM_KILL", Teams[i])
				end
			end
			if getn(Teams) <= 1 then
				ExecuteAction("OPTIONAL_VICTORY")
			end
			DeleteScriptTimerAction(KotH_Master_Coroutine)
		end
	end
	TeamInsideTriggerAreaCountLast = TeamInsideTriggerAreaCount
	TeamInsideTriggerAreaCount = 0
	CountdownSpeechRoutine()
	AICoroutine()
end

InitGamemode()
SetScriptTimer(1,KotH_Master_Coroutine,-1)

--BFME2 RESEARCH EvaluateCondition("PLAYER_LOST_OBJECT_TYPE", PLAYER, OBJECT_TYPE)
--PLAYER_LOST_OBJECT_TYPE PLAYER_KILL TIMER_EXPIRED

--ExecuteAction("SET_GAMEPLAYMODE_TIMER", COUNTER, INT)
--EvaluateCondition("IS_GAME_MODE_ACTIVE", TEXT_STRING)