NAME	 	= "Capture and Hold"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Capture control points to gain resources.\nThis gamemode is inspired by the Xbox exclusive gamemode and Company of Heroes"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

--SETTINGS--
NumberControlPoints = 1
DynamicNumberOfControlPoints = false
ControlPointIncomePerSec = 20
ControlPointTriggerDistance = 120
TimeToCaptureControlPoint = 10
RemoveRegularResources = true

--CODE--
ControlPoints = {}
ControlPointsOwned = {}
Captures = {}
CapturingTimeState = {}
CaptureEffectState = {}

GAMEMODE = "CAH"

ExecuteAction("SHOW_MILITARY_CAPTION", "GUI:cah", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

function CreateControlPoint(x,y) --todo
	local ControlPointName = GetUnitName()
	if SAGE_GAME == CNCZH or SAGE_GAME == CNCGEN then
		
	elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then
		-- -CaptureFlag -Inn -ShipWright -Outpost -SignalFire -ShireGreenDragon
		ControlPointObjectType = "CaptureFlag"
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', ControlPointName, ControlPointObjectType, NeutralTeam, {x,y,GetHeightAtPosition(x,y)}, 0)
		ControlPointObjectTypeSecondary = "Flag"
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x+ControlPointTriggerDistance,y,GetHeightAtPosition(x+ControlPointTriggerDistance,y)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x-ControlPointTriggerDistance,y,GetHeightAtPosition(x-ControlPointTriggerDistance,y)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x,y+ControlPointTriggerDistance,GetHeightAtPosition(x,y+ControlPointTriggerDistance)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x,y-ControlPointTriggerDistance,GetHeightAtPosition(x,y-ControlPointTriggerDistance)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x+ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x+ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45))}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x-ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x-ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45))}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x+ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x+ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45))}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x-ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x-ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45))}, 0)
	elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
		ControlPointObjectType = "Misc_Flare02"--"AlienWormholeMarker"
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', ControlPointName, ControlPointObjectType, NeutralTeam, {x,y,GetHeightAtPosition(x,y)}, 0)
		ControlPointObjectTypeSecondary = "Misc_Flare04"
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x+ControlPointTriggerDistance,y,GetHeightAtPosition(x+ControlPointTriggerDistance,y)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x-ControlPointTriggerDistance,y,GetHeightAtPosition(x-ControlPointTriggerDistance,y)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x,y+ControlPointTriggerDistance,GetHeightAtPosition(x,y+ControlPointTriggerDistance)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x,y-ControlPointTriggerDistance,GetHeightAtPosition(x,y-ControlPointTriggerDistance)}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x+ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x+ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45))}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x-ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x-ControlPointTriggerDistance*cos(45),y+ControlPointTriggerDistance*sin(45))}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x+ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x+ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45))}, 0)
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), ControlPointObjectTypeSecondary, NeutralTeam, {x-ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45),GetHeightAtPosition(x-ControlPointTriggerDistance*cos(45),y-ControlPointTriggerDistance*sin(45))}, 0)
	
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), "MG_Alien_TerraformingNexus", NeutralTeam, {x,y,GetHeightAtPosition(x,y)-300}, 0)
		-- local CrystalShield = GetUnitName()
		-- ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), "AlienCrystalShield", NeutralTeam, {x,y,GetHeightAtPosition(x,y)}, 0)
		-- FreezeObject(CrystalShield)
	elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then

	end
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ControlPointName, "Indestructible", 1)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ControlPointName, "Player Targetable", 0)
	ObjectSetObjectStatus(GetObjectLuaRef(ControlPointName), "UNATTACKABLE")
	return ControlPointName
end

function FreezeObject(object)
	ExecuteAction("NAMED_SET_HELD", object, 1)
	ExecuteAction("NAMED_SET_SLEEP_STATUS", object, 1)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", object, "Enabled", 0) 	
end

function ToggleCapturingEffect(ControlPointRef)
	CapturingEffectObjectType = "Misc_Flare03"
	if not CaptureEffectState[ControlPointRef] then
		local x,y,z = ObjectGetPosition(GetObjectLuaRef(ControlPointRef))
		local EffectRef = GetUnitName()
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', EffectRef, CapturingEffectObjectType, NeutralTeam, {x,y,z}, 0)
		CaptureEffectState[ControlPointRef] = EffectRef
	else
		ExecuteAction("NAMED_DELETE", CaptureEffectState[ControlPointRef])
		CaptureEffectState[ControlPointRef] = nil
	end
end

function AttackClosestEnemy(attackerPlayer) --todo
	local closestTeam = ""
	local attackerTeam = GetTeamByPlayer(attackerPlayer)
	for i=1,getn(Team),1 do
		if Relation[attackerTeam][Team[i]] == RELATION_TYPE["Enemy"] and EvaluateCondition("DISTANCE_BETWEEN_TEAM", attackerTeam, Team[i], CompareTable[">"], REAL) then
			closestTeam = Team[i]
		end
	end
	return closestTeam
end

function GetEnemyTeam(attackerPlayer) --temp until AttackClosestEnemy is finished
	local enemyTeams = {}
	local attackerTeam = GetTeamByPlayer(attackerPlayer)
	for i=1,getn(Teams),1 do
		if Relation[attackerTeam][Teams[i]] == RELATION_TYPE["Enemy"] then
			return Teams[i]
		end
	end
end

function AICoroutine() --capture all control points one by one then attack closest enemy
	for i=1,getn(AITeams),1 do
		local ClosestControlPoint = ""
		local MissingControlPoint = false
		local ClosestControlPointDistance = 999999
		local BaseRef = GetUnitName()
		ExecuteAction("FIND_HOME_BASE_OF_PLAYER", GetPlayerByTeam(AITeams[i]), BaseRef, 1)
		for j=1,getn(ControlPoints),1 do
			if not Captures[ControlPoints[j]][GetPlayerByTeam(AITeams[i])] then
				MissingControlPoint = true
				local DistanceToControlPoint = ObjectGetDistance(GetObjectLuaRef(BaseRef), GetObjectLuaRef(ControlPoints[j]))
				if DistanceToControlPoint < ClosestControlPointDistance then
					ClosestControlPointDistance = DistanceToControlPoint
					ClosestControlPoint = ControlPoints[j]
				end
			end
		end
		if ClosestControlPoint ~= "" then
			ExecuteAction("ATTACK_MOVE_TEAM_TO_NAMED_OBJECT", AITeams[i], ClosestControlPoint)
			--ExecuteAction("TEAM_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", AITeams[i], ControlPointObjectType, TRIGGER_AREA)
		end
		if not MissingControlPoint then
			--AttackClosestEnemy(GetPlayerByTeam(AITeams[i]))
			ExecuteAction("TEAM_ATTACK_TEAM", AITeams[i], GetEnemyTeam(AITeams[i]))
		end
	end
end

function DeleteObjects(ObjectTypeList)
	local ObjectRef = ""
	for i=1,getn(ObjectTypeList),1 do
		repeat
			ObjectRef = "object_" .. floor(GetRandomNumber()*99999999)
			ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", ObjectTypeList[i], "/team", ObjectRef)
			ExecuteAction("NAMED_DELETE", ObjectRef)
		until(not EvaluateCondition("NAMED_NOT_DESTROYED", ObjectRef))
	end
end

function DisableResourceIncomeSources()
	local BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}
	if SAGE_GAME == CNCZH or SAGE_GAME == CNCGEN then
		--For CNCZH needs fix as DeleteObjects won't work here and for WAREHOUSE_SET_VALUE we need to get the object refs
		local ResourceIncomeBuildings = { "AirF_AmericaSupplyDropZone", "AmericaSupplyDropZone", "SupW_AmericaSupplyDropZone","Lazr_AmericaSupplyDropZone", 
			"Tank_ChinaInfantryHacker", "Nuke_ChinaInfantryHacker", "Infa_ChinaInfantryHacker", "ChinaInfantryHacker", "Boss_InfantryHacker", 
			"Slth_GLABlackMarket", "GLABlackMarket", "Demo_GLABlackMarket", "Chem_GLABlackMarket" }
		for i=1,getn(ResourceIncomeBuildings),1 do
			ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", ResourceIncomeBuildings[i], BUILDABILITY_TYPE["NO"])
		end		
		local SupplyCenterType = { "SupplyDock", "SupplyPileSmall"}
		ExecuteAction("WAREHOUSE_SET_VALUE", UNIT, 0)
		DeleteObjects(SupplyCenterType)
	elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then
		local ResourceIncomeBuildings = { "GondorFarm", "RohanFarm", "ElvenMallornTree", "AngmarMill", "LumberMill", "DwarvenMineShaft", "SlaughterHouse", "Furnace" }
		for i=1,getn(ResourceIncomeBuildings),1 do
			--ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<All Players>", ResourceIncomeBuildings[i], false);
			ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", ResourceIncomeBuildings[i], BUILDABILITY_TYPE["NO"])
		end
	elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
		RemoveAllTiberium()
	elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
		local OreNodeType = { "OreNode", "OreNode2a", "OreNode2b", "OreNode4a", "OreNode4b", "OreNode4c", "OreNode4d" }
		DeleteObjects(OreNodeType)
	end
end

function GetCPDistribution()
	local T = {}
	local MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
	local LineDist = 9
	if MapSizeX > MapSizeY then
		--center line
		tinsert(T,{MapSizeX/2,MapSizeY/2})
		tinsert(T,{MapSizeX/2,MapSizeY/LineDist})
		tinsert(T,{MapSizeX/2,MapSizeY-(MapSizeY/LineDist)})
		--second line 1
		tinsert(T,{(MapSizeX/2)+(MapSizeX/LineDist),MapSizeY-(MapSizeY/3)})
		tinsert(T,{(MapSizeX/2)+(MapSizeX/LineDist),(MapSizeY/3)})
		--last line 1
		tinsert(T,{(MapSizeX/2)+2*(MapSizeX/LineDist),(MapSizeY/2)})
		--second line 2
		tinsert(T,{(MapSizeX/2)-(MapSizeX/LineDist),MapSizeY-(MapSizeY/3)})
		tinsert(T,{(MapSizeX/2)-(MapSizeX/LineDist),(MapSizeY/3)})
		--last line 2
		tinsert(T,{(MapSizeX/2)-2*(MapSizeX/LineDist),(MapSizeY/2)})
	else
		--center line
		tinsert(T,{MapSizeY/2,MapSizeX/2})
		tinsert(T,{MapSizeY/2,MapSizeX/LineDist})
		tinsert(T,{MapSizeY/2,MapSizeX-(MapSizeX/LineDist)})
		--second line 1
		tinsert(T,{(MapSizeY/2)+(MapSizeY/LineDist),MapSizeX-(MapSizeX/3)})
		tinsert(T,{(MapSizeY/2)+(MapSizeY/LineDist),(MapSizeX/3)})
		--last line 1
		tinsert(T,{(MapSizeY/2)+2*(MapSizeY/LineDist),(MapSizeX/2)})
		--second line 2
		tinsert(T,{(MapSizeY/2)-(MapSizeY/LineDist),MapSizeX-(MapSizeX/3)})
		tinsert(T,{(MapSizeY/2)-(MapSizeY/LineDist),(MapSizeX/3)})
		--last line 2
		tinsert(T,{(MapSizeY/2)-2*(MapSizeY/LineDist),(MapSizeX/2)})
	end
	return T
end

function InitGamemode()
	if RemoveRegularResources then
		DisableResourceIncomeSources()
	end
	local CPPOS = GetCPDistribution()
	for i=1,getn(CPPOS),1 do
		tinsert(ControlPoints, CreateControlPoint(CPPOS[i][1], CPPOS[i][2]))
	end
	-- for i=0,NumberControlPoints-1,1 do --temporary trivial placement approach
		-- MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
		-- ratio = NumberControlPoints/(max(MapSizeX,MapSizeY)/ControlPointTriggerDistance)
		-- --todo: test pathability
		-- --EvaluateCondition("UNIT_CAN_PATH_TO_OBJECT", UNIT, UNIT)
		-- tinsert(ControlPoints, CreateControlPoint((MapSizeX/2)+(ratio*ControlPointTriggerDistance*i),(MapSizeY/2)+(ratio*ControlPointTriggerDistance*i)))
	-- end
	for i=1,getn(ControlPoints),1 do
		Captures[ControlPoints[i]] = {}
		CapturingTimeState[ControlPoints[i]] = {}
		for j=1,getn(Players),1 do
			Captures[ControlPoints[i]][Players[j]] = false
			CapturingTimeState[ControlPoints[i]][Players[j]] = 0
		end
	end
end

function PlayerHasObjectsAroundObject(player, objectCenter, radius)
	local team = GetTeamByPlayer(player)
	local objectCenterLuaRef = GetObjectLuaRef(objectCenter)
	for index,object in globals() do
		if strfind(index, "ObjID") then
			if GetTeam(object) == team then
				if ObjectGetDistance(objectCenterLuaRef, object) <= radius then
					return true
				end
			end
		end
	end
	return false
end

function IsPlayerListAllied(players)
	for i=1,getn(players),1 do
		for j=i,getn(players),1 do
			if Relation[players[i]][players[j]] == RELATION_TYPE["Enemy"] then
				return false
			end
		end
	end
	return true
end

function CAH_Coroutine()
	local PlayersNearControlPoint = {}
	for j=1,getn(ControlPoints),1 do
		RADAR_EVENT	= { ["Information"]=0, ["Construction"]=1, ["Upgrade"]=2, ["UnderAttack"]=3, ["Infiltration"]=4, ["Banner"]=5 }	
		ExecuteAction("OBJECT_CREATE_RADAR_EVENT", ControlPoints[j], RADAR_EVENT["Information"])
		PlayersNearControlPoint[ControlPoints[j]] = {}
	end
	for i=1,getn(Players),1 do
		for j=1,getn(ControlPoints),1 do
			if PlayerHasObjectsAroundObject(Players[i], ControlPoints[j], ControlPointTriggerDistance) then
			--if not EvaluateCondition("PLAYER_HAS_NUMBER_UNITS_DISTANCE_FROM_OBJECT", Players[i], CompareTable[">"], 0, ControlPointTriggerDistance, ControlPoints[j]) and EvaluateCondition("PLAYER_HAS_NUMBER_UNITS_DISTANCE_FROM_OBJECT", Players[i], CompareTable[">"], 0, 0, ControlPoints[j]) then
				tinsert(PlayersNearControlPoint[ControlPoints[j]], Players[i])
			end
		end
	end
	for i=1,getn(ControlPoints),1 do
		for j=1,getn(PlayersNearControlPoint[ControlPoints[i]]),1 do
			if IsPlayerListAllied(PlayersNearControlPoint[ControlPoints[i]]) then
				if not Captures[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] then
					if CapturingTimeState[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] == 0 and j == 1 then
						ToggleCapturingEffect(ControlPoints[i])
					end
					CapturingTimeState[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] = CapturingTimeState[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] + 1
					if CapturingTimeState[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] >= TimeToCaptureControlPoint then
						if j == 1 then
							ExecuteAction("UNIT_SET_TEAM", ControlPoints[i], GetTeamByPlayer(PlayersNearControlPoint[ControlPoints[i]][j]))
							for m=1,getn(Players),1 do
								if Relation[Players[m]][PlayersNearControlPoint[ControlPoints[i]][j]] == RELATION_TYPE["Enemy"] then
									Captures[ControlPoints[i]][Players[m]] = false
								end
							end
						end
						if j == 1 and not Captures[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] then
							ToggleCapturingEffect(ControlPoints[i])
						end
						Captures[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] = true
						if j == getn(PlayersNearControlPoint[ControlPoints[i]]) then
							if Relation[PlayersNearControlPoint[ControlPoints[i]][j]][LocalPlayer] == RELATION_TYPE["Friend"] then
								if PartOf(PlayersNearControlPoint[ControlPoints[i]], LocalPlayer) then
									ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Neva_YouHaveFlag", LocalTeam)
								else
									ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Aeva_FlagCaptured", LocalTeam)
								end
							else
								ExecuteAction("PLAY_SOUND_EFFECT_AT_TEAM", "Neva_FlagHasBeenTak", LocalTeam)	
							end
						end
					end
				end
			else
				--ExecuteAction("PLAY_SOUND_EFFECT", "GDI_Battleship_Alarm")
				CapturingTimeState[ControlPoints[i]][PlayersNearControlPoint[ControlPoints[i]][j]] = 0
			end
		end
	end
	for i=1,getn(ControlPoints),1 do
		for j=1,getn(Players),1 do
			if Captures[ControlPoints[i]][Players[j]] then
				ExecuteAction("PLAYER_GIVE_MONEY", PlayersNearControlPoint[ControlPoints[i]][1], ControlPointIncomePerSec)	
			end
		end
	end
	AICoroutine()
end

InitGamemode()
SetScriptTimer(1,CAH_Coroutine,-1)