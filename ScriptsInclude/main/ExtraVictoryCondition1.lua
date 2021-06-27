NAME	 	= "Extra Victory Condition"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Gain 50000$ money to win"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

--ExecuteAction("SET_IGNORE_SKIRMISH_VICTORY_CONDITIONS", 1)

function GetValidTeamList()
	local TeamList={
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
		--"/team", --NeutralTeam
		--"PlyrCivilian/teamPlyrCivilian",
		--"PlyrCreeps/teamPlyrCreeps",
		--"ReplayObserver/teamReplayObserver",
	}	
	local ValidTeamList = {}
	for i=1,getn(TeamList),1 do
		local TempUnitRef = "object_" .. tostring(floor(9999999*GetRandomNumber()))
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", TempUnitRef, "PlayerSpellBook", TeamList[i], '((0.00,0.00,0.00))', 0)
		if EvaluateCondition("NAMED_NOT_DESTROYED", TempUnitRef) then tinsert(ValidTeamList, TeamList[i]) end
		ExecuteAction("NAMED_DELETE", TempUnitRef)
	end	
	--EvaluateCondition("TEAM_CREATED", TEAM)  --EvaluateCondition("TEAM_DESTROYED", TeamList[i]) both not working
	return ValidTeamList
end

function GiveObjectDummyAttributes(object)  
    local Status = {"NO_ATTACK","UNSELECTABLE","NO_COLLISIONS","UNATTACKABLE","CANNOT_BE_SOLD","IN_STASIS","IGNORE_AI_COMMAND","USER_PARALYZED","POWERED_DOWN_EMP","TEMPORARILY_DEFECTED"}
    for i=1,getn(),1 do
		ObjectSetObjectStatus(GetObj.Table(object),Status[i])
	end
	ExecuteAction("NAMED_SET_HELD", object, 1)
	ExecuteAction("NAMED_SET_STRICT_CONTROL_ENABLED", object, 1)
	ExecuteAction("NAMED_SET_SLEEP_STATUS", object, 1)
	ExecuteAction("UNIT_SET_STANCE", object, "HOLD_POSITION") 
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Enabled", 0) 		  
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Indestructible", 1)	 
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Selectable", 0)	
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Player Targetable", 0)	
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Unsellable", 1)
	ObjectForbidPlayerCommands(GetObj.Table(object),true)
end

MapSize = {}
MapSize.x, MapSize.y, MapSize.z = GetMapSize()
TeamList = GetValidTeamList()

VictoryConditionAnchorList = {}

function OverwriteVictoryCondition()
	for i=1,getn(Players),1 do
		local VictoryConditionHelper = "object_" .. tostring(floor(9999999*GetRandomNumber()))
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", VictoryConditionHelper, "GDIPowerPlant", GetTeamByPlayer(Players[i]), {MapSize.x/2,MapSize.y/2,-300}, 0)
		VictoryConditionAnchorList[Players[i]] = VictoryConditionHelper
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", VictoryConditionHelper, "Indestructible", 1) 
		ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", VictoryConditionHelper, GetObjectStatus("NOT_IN_WORLD"), 1)
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", VictoryConditionHelper, "Unsellable", 1)
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Player Targetable", 0)
		ObjectSetObjectStatus(GetObjectLuaRef(VictoryConditionHelper),"UNATTACKABLE")
		ObjectForbidPlayerCommands(GetObjectLuaRef(VictoryConditionHelper),true)
	end
end

function CheckForVictoryCondition
	if SOME_VICTORY_CONDITION then
		ExecuteAction("NAMED_DELETE",VictoryConditionAnchorList[1])
	end
end
