NAME	 	= "Wormholes Allied Base"
VERSION		= "1.00"
TYPE		= "MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Allied base connecting wormholes available"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function SpecialPowerOnPosition(ObjectTypeSource, SpecialPower, Position)
	local TeamSource = NeutralTeam --LocalTeam
	local SourceName = GetUnitName()
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", SourceName, ObjectTypeSource, TeamSource, 0, 0) --{-500,-500,-500}
	ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN", SourceName, SpecialPower, 0)
	ExecuteAction("PLAYER_SET_BASE_POWER", "PlyrNeutral", 999)	
	local DestinationName = GetUnitName()
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", DestinationName, "PlayerSpellBook", TeamSource, {Position[1],Position[2],Position[3]}, 0)	
	--ExecuteAction("PLAYER_FIRE_MULTI_TARGET_SPECIAL_POWER_AT_WAYPOINTS", "<Local Player>", SpecialPower, "Player_1_Start", "Player_2_Start")
	--ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_ON_NAMED", UNIT, COMMANDBUTTON_ABILITY_UNIT, UNIT)
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_NAMED", SourceName, SpecialPower, DestinationName)
	ExecuteAction("NAMED_DELETE", SourceName)
	ExecuteAction("NAMED_DELETE", DestinationName)
end

function GetBase(Player)
	local BaseRef = GetUnitName()
	ExecuteAction("FIND_HOME_BASE_OF_PLAYER", Player, BaseRef, 0)
	return GetObjectLuaRef(BaseRef)
end

function GetBase2(team)
	return GetBaseRef(GetPlayerByTeam(team))
end

function SpawnWormholes()
	local LocalPlayerBaseX, LocalPlayerBaseY, LocalPlayerBaseZ = ObjectGetPosition(GetBase(LocalPlayer)) 
	local WormholeID = 1
	for i=1,getn(Players),1 do
		if Players[i] ~= LocalPlayer and Relation[Players[i]][LocalPlayer] == 2 then
			local X,Y,Z = ObjectGetPosition(GetBase(Players[i])) 
			--WORMHOLE1 = GetUnitName()
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), "AlienWormHole", LocalTeam, {LocalPlayerBaseX + 100*WormholeID, LocalPlayerBaseY, LocalPlayerBaseZ}, 0)
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), "AlienWormHole", LocalTeam, {X+100, Y, Z}, 0)
			WormholeID = WormholeID + 1
		end
	end
end

function Init()
	SpawnWormholes()
	SetScriptTimer(30,SpawnWormholes,-1)	
end

Init()

--sidenotes:
--ObjectSetDelayedDeath(GetObjectLuaRef(WORMHOLE1),true)
--ExecuteAction("NAMED_SET_HELD", WORMHOLE1, 1)
--ExecuteAction("NAMED_SET_SLEEP_STATUS", WORMHOLE1, 1)
--ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", WORMHOLE1, "Enabled", 0) 
--"SpecialPower_WormHole"
--"SpecialPower_TemporalWormhole"
--"SpecialPower_Traveler59WormHole"
--SpecialPowerOnPosition("AlienSignalTransmitter", "SpecialPower_WormHole", {400, 400, MAP_HEIGHT}, {700, 700, MAP_HEIGHT})