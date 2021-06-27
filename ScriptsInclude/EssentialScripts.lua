--------------------------------------------------------------------------
------------------------ESSENTIALS----------------------------------------
--------------------------------------------------------------------------

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

nullheight = 0
nullangle = 0

function init()
	if not INIT then
		INIT = true
		Enemy = 0
		Neutral = 1
		Friend = 2
		RELATION_TYPE = { ["Enemy"]=0, ["Neutral"]= 1, ["Friend"]=2 }
		CompareTable = { LT=0, LE=1, EQ=2, GE=3, GT=4, NE=5, ["<"]=0, ["<="]=1, ["=="]=2, [">="]=3, [">"]=4, ["~="]=5 }
		MAIN_ANCHOR = "PlayerSpellBook"
		if SAGE_GAME <= CNCZH then
			MAIN_ANCHOR = "AmericaVehicleDozer"
			VICTORY_CONDITION_HELPER = "AmericaPowerPlant"
			GENERIC_DUMMY = "AmericaVehicleDozer"
			GetSelectedUnit = GetSelectedUnitZH
			GetObjectStringRef = GetObjectStringRefZH
		elseif SAGE_GAME <= BFME2ROTWK then
			VICTORY_CONDITION_HELPER = "GondorBarracks"
			GENERIC_DUMMY = "MenPorter"
		elseif SAGE_GAME <= CNC3KW then
			VICTORY_CONDITION_HELPER = "GDIPowerPlant"
			GENERIC_DUMMY = "GDIHarvester"
		elseif SAGE_GAME <= CNCRA3U then
			VICTORY_CONDITION_HELPER = "AlliedPowerPlant"
			GENERIC_DUMMY = "AlliedMiner"
		elseif SAGE_GAME == CNC4 then
			VICTORY_CONDITION_HELPER = "GDIStructureA"
			GENERIC_DUMMY = "GDIVehicleA"
		end
		GenericDummy = GENERIC_DUMMY --compat meta mod framework
		nullheight = 15.976563
		nullangle = 20
		if SAGE_GAME <= CNCZH then
			LocalPlayer = "player0"
			LocalTeam = "teamplayer0" --"teamThePlayer"
			GetRandomNumber = GetRandomNumberZH
			GetObjectLuaRef = GetObjectLuaRefZH
			GetObjectStringRef = GetObjectStringRefZH
			InitPlayerAndTeamListsCNCZH()
			GetTeam = GetTeamZH
			GetPlayer = GetPlayerZH
		else
			randomseed(gsub(gsub(date(),"%p", ""),"%s",""))
			InitPlayerAndTeamLists()
			HumanPlayerCount = getn(HumanPlayers)
			InitRelations()
			CreateAllianceTeamsTable()
			LocalPlayer = GetLocalPlayer()
			LocalTeam = GetLocalPlayerTeam()
			LocalPlayerWaypoint = GetPlayerStartWaypointByTeam(LocalTeam)
			InitWaypoints()
			InitializeGCounters()
			MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
			GetObjectType = GetObjectType_
			if SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
				nullheight = 215.625
				MAP_HEIGHT = GetMapHeight() -- nullheight
			elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
				nullheight = 15.976563
				MAP_HEIGHT = GetMapHeight()
			else
				nullheight = 15.976563
				MAP_HEIGHT = MapSizeZ
			end

		end
	end
end

function InitRelations()
	RELATION_TYPE = { ["Enemy"]=0, ["Neutral"]= 1, ["Friend"]=2 }
	for i=1,getn(Teams),1 do
		Relation[Teams[i]] = {}
		Relation[GetPlayerByTeam(Teams[i])] = {}
	end
	for i=1,getn(Teams),1 do
		for j=1,getn(Teams),1 do
			Relation[Teams[i]][Teams[j]] = RELATION_TYPE["Friend"]
			Relation[GetPlayerByTeam(Teams[i])][GetPlayerByTeam(Teams[j])] = RELATION_TYPE["Friend"]
		end
	end
	local AllianceProbeDummies = {}
	for i=1,getn(Teams),1 do		
		local ProbeDummy = GetUnitName()
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", ProbeDummy, GENERIC_DUMMY, Teams[i], {-500,-500,-500}, 0)   
		tinsert(AllianceProbeDummies,ProbeDummy)
	end
	for i=1,getn(Teams),1 do
		for j=1,getn(Teams),1 do
			if i~=j and EvaluateCondition("ENEMY_SIGHTED_BY_TEAM", Teams[i], RELATION_TYPE["Enemy"], GetPlayerByTeam(Teams[j])) or EvaluateCondition("ENEMY_SIGHTED_BY_TEAM", Teams[j], RELATION_TYPE["Enemy"], GetPlayerByTeam(Teams[i])) then
				Relation[Teams[i]][Teams[j]] = RELATION_TYPE["Enemy"]
				Relation[GetPlayerByTeam(Teams[i])][GetPlayerByTeam(Teams[j])] = RELATION_TYPE["Enemy"]
				Relation[Teams[j]][Teams[i]] = RELATION_TYPE["Enemy"]
				Relation[GetPlayerByTeam(Teams[j])][GetPlayerByTeam(Teams[i])] = RELATION_TYPE["Enemy"]
			end
		end
	end
	for i=1,getn(AllianceProbeDummies),1 do
		ExecuteAction("NAMED_DELETE", AllianceProbeDummies[i])
	end
end

function CreateAllianceTeamsTable()
	AllianceTeams = {}
	local PartOfAlliance = function(player)
		for i=1,getn(AllianceTeams),1 do
			for j=1,getn(AllianceTeams[i]),1 do
				if Relation[player][AllianceTeams[i][j]] == RELATION_TYPE["Friend"] then
					return i
				end
			end	
		end
		return false
	end
	for i=1,getn(Players),1 do
		if not PartOfAlliance(Players[i]) then
			tinsert(AllianceTeams, {})
			tinsert(AllianceTeams[getn(AllianceTeams)], Players[i])
		else
			tinsert(AllianceTeams[PartOfAlliance(Players[i])], Players[i])
		end
	end
	return AllianceTeams
end

function PrintRelations()
	for i=1,getn(Teams),1 do
		for j=1,getn(Teams),1 do
			if Relation[Teams[i]][Teams[j]] then
				print(GetPlayerIndex(Teams[i]) .. " | " .. GetPlayerIndex(Teams[j]) .. " = " .. Relation[Teams[i]][Teams[j]])
			end
		end
	end
end

function GetMapHeight()
	for k,v in globals() do
		if strfind(k, "ObjID") and ObjectDescription(v) and strfind(ObjectDescription(v), "BASE_FLAG") then
			local x,y,z = ObjectGetPosition(v)
			return z
		end
	end
end

function GetHeight(PosX,PosY) --doesn't work
	local UnitRef = GetUnitName()
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",UnitRef,"GDIHarvester","team",{PosX, PosY, 0}, 0)
	ExecuteAction("UNIT_ATTACK_MOVE_TOWARDS_NEAREST_OBJECT_TYPE", UnitRef, OBJECT_TYPE)
	local X,Y,Z = ObjectGetPosition(GetObjectLuaRef(UnitRef))
	ExecuteAction("NAMED_DELETE", UnitRef)
	return Z
end

function GetHeightAtPosition(x,y)
		if SAGE_GAME >= BFME2 then
			return GetGroundHeight(x,y)
		else
			--nullheight = 215.625 --RA3
			nullheight = 15.976563
			return nullheight
		end
end

-- function print(message)
	-- ExecuteAction("SHOW_MILITARY_CAPTION", "\n\n\n" .. message, 10)
-- end

-- function _ALERT(message)
	-- ExecuteAction("SHOW_MILITARY_CAPTION", "ERROR\n" .. message, 15)
-- end

function GetUnitName()
	if not SAGE_GAME == CNCZH or SAGE_GAME == CNCGEN then
		return "object_" .. floor(GetRandomNumber()*99999999+0.5)
	else
		return "object_" .. random(99999999)
	end
end

function GetObjectStringRef(object,objindex)    
    if type(object) == "string" then 
		return object
	else
		local ObjDesc = ObjectDescription(object)
        local _, count = gsub(ObjDesc,"%(","")
        if count>1 then
            return strsub(ObjDesc, strfind(ObjDesc,'(',1,true)+1,strfind(ObjDesc,')',1,true)-1)
		else
			if objindex then
			    ExecuteAction("SET_UNIT_REFERENCE", objindex, object)
				return objindex
			else
				local ObjectStringRef = "object_" .. floor(GetRandomNumber()*99999999)
				ExecuteAction("SET_UNIT_REFERENCE", ObjectStringRef, object)
				return ObjectStringRef
			end
        end
    end
end

function GetObjectStringRefZH(object)
	return object
end

function GetObjectLuaRef(object)
    if type(object) == "table" then 
		return object
	else
		local objectStatus = GetObjectStatus("RIDER4") --RIDER4 = 44 (CNC3KW)
		ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", object, objectStatus, 1)
		for objectIndex,objectLuaRef in globals() do
			if strfind(objectIndex,"ObjID") then
				local objDesc = ObjectDescription(objectLuaRef)
				if objDesc and not strfind(objDesc, "<No Object>") and (strfind(objDesc, object) or EvaluateCondition("UNIT_HAS_OBJECT_STATUS", GetObjectStringRef(objectLuaRef), objectStatus)) then
					ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", object, objectStatus, 0)
					return rawget(globals(), objectIndex)
				end
			end
		end
		ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", object, objectStatus, 0)
		return object
	end
end

if GetObj and type(GetObj) == "table" then
	GetObj.Table = GetObjectLuaRef
	GetObj.String = GetObjectStringRef --compatibility code
else
	GetObj = {} 
	GetObj.Table = GetObjectLuaRef
	GetObj.String = GetObjectStringRef --compatibility code
end

function GetSelectedUnitFlash(flash) --EvaluateCondition not working here
	for k,v in globals() do
	    if strfind(k,"ObjID") and ObjectTestModelCondition(v,"SELECTED") then  --EvaluateCondition("NAMED_SELECTED",v)--EvaluateCondition("TYPE_SELECTED", objectname)	
			if flash then ExecuteAction("NAMED_FLASH_WHITE", v, 2)	end
			return v
		end
	end
	return nil
end

Teams = {}
HumanTeams = {}
AITeams = {}
AllTeams = {}


Players = {}
HumanPlayers = {}
AIPlayers = {}
AllPlayers = {}

GlobalTeamTable = Teams

Relation = {}

function InitPlayerAndTeamLists()
	local TeamList = {
		"Player_1/defaultSkirmishTeamPlayer_1",
		"Player_2/defaultSkirmishTeamPlayer_2",
		"Player_3/defaultSkirmishTeamPlayer_3",
		"Player_4/defaultSkirmishTeamPlayer_4",
		"Player_5/defaultSkirmishTeamPlayer_5",
		"Player_6/defaultSkirmishTeamPlayer_6",
		"Player_7/defaultSkirmishTeamPlayer_7",
		"Player_8/defaultSkirmishTeamPlayer_8",
		"Player_1/teamPlayer_1",
		"Player_2/teamPlayer_2",
		"Player_3/teamPlayer_3",
		"Player_4/teamPlayer_4",
		"Player_5/teamPlayer_5",
		"Player_6/teamPlayer_6",
		"Player_7/teamPlayer_7",
		"Player_8/teamPlayer_8",
		--"/team", --NeutralTeam
		--"PlyrCivilian/teamPlyrCivilian",
		--"PlyrCreeps/teamPlyrCreeps",
		--"ReplayObserver/teamReplayObserver",
	}
	NeutralTeam = "/team"  --or "team"
	CivilianTeam = "PlyrCivilian/teamPlyrCivilian"
	CreepsTeam = "PlyrCreeps/teamPlyrCreeps"
	ObserverTeam = "ReplayObserver/teamReplayObserver"
	NeutralPlayer = "PlyrNeutral"-- ZH "" yes it's void empty in zh
	CivilianPlayer = "PlyrCivilian"
	CreepsPlayer = "PlyrCreeps"
	local IsPlayerIndexAdded = function(teamlist,teamname)
		for i=1,getn(teamlist),1 do
			if tonumber(strsub(teamlist[i],8,8)) == tonumber(strsub(teamname,8,8)) then
				return true
			end
		end
		return false
	end
	for i=1,getn(TeamList),1 do
		if not IsPlayerIndexAdded(Teams,TeamList[i]) then
			local TempUnitRef = GetUnitName()
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", TempUnitRef, GENERIC_DUMMY, TeamList[i], 0, 0)
			if EvaluateCondition("NAMED_CREATED", TempUnitRef) then 
				tinsert(Teams, TeamList[i])
				tinsert(Players, strsub(TeamList[i],1,8))
				tinsert(AllTeams, TeamList[i])
				tinsert(AllPlayers, strsub(TeamList[i],1,8))
				if strfind(TeamList[i], "Skirmish") then
					tinsert(AITeams, TeamList[i])
					tinsert(AIPlayers, strsub(TeamList[i],1,8))
				else
					tinsert(HumanTeams, TeamList[i])
					tinsert(HumanPlayers, strsub(TeamList[i],1,8))
				end
			end
			ExecuteAction("NAMED_DELETE", TempUnitRef)
		end
	end
	local SortHelper = function(element1, element2)
		if tonumber(strsub(element1,8,8)) < tonumber(strsub(element2,8,8)) then return true end
	end
	if getn(Teams) == 0 then print("Error: No Teams found") end
	sort(Players,SortHelper)
	sort(HumanPlayers,SortHelper)
	sort(AIPlayers,SortHelper)
	--sort(AllPlayers,SortHelper)
	sort(Teams,SortHelper)
	sort(HumanTeams,SortHelper)
	sort(AITeams,SortHelper)
	--sort(AllTeams,SortHelper)
	tinsert(AllTeams,NeutralTeam)
	tinsert(AllTeams,CivilianTeam)
	tinsert(AllTeams,CreepsTeam)
	tinsert(AllPlayers,NeutralPlayer)
	tinsert(AllPlayers,CivilianPlayer)
	tinsert(AllPlayers,CreepsPlayer)
	--EvaluateCondition("TEAM_CREATED", TEAM)  --EvaluateCondition("TEAM_DESTROYED", TeamList[i]) both not working
	return Teams
end

function InitPlayerAndTeamListsCNCZH()
	local TeamList = {
		"teamplayer0",
		"teamplayer1",
		"teamplayer2",
		"teamplayer3",
		"teamplayer4",
		"teamplayer5",
		"teamplayer6",
		"teamplayer7",
		-- "teamPlyrCivilian",
		-- "teamSkirmishAmerica",
		-- "teamSkirmishAmericaAirForceGeneral",
		-- "teamSkirmishAmericaLaserGeneral",
		-- "teamSkirmishAmericaSuperWeaponGeneral",
		-- "teamSkirmishChina",
		-- "teamSkirmishChinaInfantryGeneral",
		-- "teamSkirmishChinaNukeGeneral",
		-- "teamSkirmishChinaTankGeneral",
		-- "teamSkirmishGLA",
		-- "teamSkirmishGLADemolitionGeneral",
		-- "teamSkirmishGLAStealthGeneral",
		-- "teamSkirmishGLAToxinGeneral"
	}
	NeutralTeam = "team"
	CivilianTeam = "teamPlyrCivilian"
	CreepsTeam = "teamPlyrCreeps"
	ObserverTeam = "teamReplayObserver"
	NeutralPlayer = "PlyrNeutral"
	CivilianPlayer = "PlyrCivilian"
	CreepsPlayer = "PlyrCreeps"
	local IsPlayerIndexAdded = function(teamlist,teamname)
		for i=1,getn(teamlist),1 do
			if tonumber(strsub(teamlist[i],11,11)) == tonumber(strsub(teamname,11,11)) then
				return true
			end
		end
		return false
	end
	for i=1,getn(TeamList),1 do
		--if not IsPlayerIndexAdded(Teams,TeamList[i]) then
			--local TempUnitRef = GetUnitName()
			--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", TempUnitRef, GENERIC_DUMMY, TeamList[i], {5,5,5}, 0)
			--if EvaluateCondition("NAMED_CREATED", TempUnitRef) then 
			if PlayerAlive(strsub(TeamList[i],5,strlen(TeamList[i]))) then
				tinsert(Teams, TeamList[i])
				tinsert(Players, strsub(TeamList[i],5,strlen(TeamList[i])))
				tinsert(AllTeams, TeamList[i])
				tinsert(AllPlayers, strsub(TeamList[i],5,strlen(TeamList[i])))
				if i ~= 1 then
					tinsert(AITeams, TeamList[i])
					tinsert(AIPlayers, strsub(TeamList[i],5,strlen(TeamList[i])))
				else
					tinsert(HumanTeams, TeamList[i])
					tinsert(HumanPlayers, strsub(TeamList[i],5,strlen(TeamList[i])))
				end
			end
			--ExecuteAction("NAMED_DELETE", TempUnitRef)
		--end
	end
	local SortHelperPlayer = function(element1, element2)
		if tonumber(strsub(element1,7,7)) < tonumber(strsub(element2,7,7)) then return true end
	end
	local SortHelperTeam = function(element1, element2)
		if tonumber(strsub(element1,11,11)) < tonumber(strsub(element2,11,11)) then return true end
	end
	if getn(Teams) == 0 then print("Error: No Teams found") end
	if getn(Players) == 0 then print("Error: No Players found") end
	sort(Players,SortHelperPlayer)
	sort(HumanPlayers,SortHelperPlayer)
	sort(AIPlayers,SortHelperPlayer)
	--sort(AllPlayers,SortHelper)
	sort(Teams,SortHelperTeam)
	sort(HumanTeams,SortHelperTeam)
	sort(AITeams,SortHelperTeam)
	--sort(AllTeams,SortHelper)
	tinsert(AllTeams,NeutralTeam)
	tinsert(AllTeams,CivilianTeam)
	tinsert(AllTeams,CreepsTeam)
	tinsert(AllPlayers,NeutralPlayer)
	tinsert(AllPlayers,CivilianPlayer)
	tinsert(AllPlayers,CreepsPlayer)
	--EvaluateCondition("TEAM_CREATED", TEAM)  --EvaluateCondition("TEAM_DESTROYED", TeamList[i]) both not working
	return Teams
end

GetValidTeamList = InitPlayerAndTeamLists

function GetAValidTeam()
	--"teamPlyrCreeps"
end

function PlayerAlive(player)
	if EvaluateCondition("PLAYER_HAS_N_OR_FEWER_BUILDINGS", player, 10000) or EvaluateCondition("PLAYER_HAS_POWER", player) then --or EvaluateCondition("PLAYER_HAS_CREDITS", 1, player) then
		return true
	else return false end
end

function CheckScriptEngineInit()
	local TempUnitRef = GetUnitName()
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", TempUnitRef, GENERIC_DUMMY, "team", 0, 0)
	if EvaluateCondition("NAMED_CREATED", TempUnitRef) then 
		ExecuteAction("NAMED_DELETE", TempUnitRef)
		return true
	end
	return false
end

function GetTeam(object_)
	local GetObjTableRef = function(object)
		if type(object) == "table" then return object
		else  
			for k,v in globals() do
				if strfind(k,"ObjID") and strfind(ObjectDescription(v),object) then
					return rawget(globals(),k)
				end
			end
			return object
		end
	end
	local object = GetObjTableRef(object_)
	if type(object) == "string" then
		for i=1,8,1 do
			if EvaluateCondition("NAMED_OWNED_BY_PLAYER", object, "Player_" .. i) then
				return "Player_" .. i .. "/teamPlayer_" .. i
			end
		end
	end
	local TeamDescription = ObjectTeamName(object)
	if TeamDescription then
		local TeamNumber = gsub(TeamDescription, "%a+%p+", "")
		if not TeamNumber then return "UnknownTeam" end --"UnknownTeam"
		if strfind(TeamDescription, "SkirmishTeamPlayer") then --"Player_2/defaultSkirmishTeamPlayer2"
			return "Player_" .. TeamNumber .. "/defaultSkirmishTeamPlayer_" .. TeamNumber
		elseif strfind(TeamDescription, "teamPlayer") then --"Player_1/teamPlayer1"
			return "Player_" .. TeamNumber .. "/teamPlayer_" .. TeamNumber
		elseif strfind(TeamDescription, "Civilian") then --"PlyrCivilian/teamPlyrCivilian"
			return "PlyrCivilian/teamPlyrCivilian"
		elseif strfind(TeamDescription, "Creeps") then --"PlyrCreeps/teamPlyrCreeps"
			return "PlyrCreeps/teamPlyrCreeps"
		elseif strfind(TeamDescription, "teamPlyr") then --"PlyrNOD/teamPlyrNOD"
			return strsub(TeamDescription, 5, -1) .. "/" .. TeamDescription
		elseif strfind(TeamDescription, "SkirmishTeam") then --"Nod_Enemy_Main/defaultSkirmishTeamNod_Enemy_Main"
			return strsub(TeamDescription, 20, -1) .. "/" .. TeamDescription
		elseif TeamDescription == "team" then --"team" for neutrals
			return "team"
		else
			return gsub(strsub(ObjectDescription(object),strfind(ObjectDescription(object), "player ")+10),"%p","") .. "/" .. TeamDescription
		end
	end
end

function GetPlayerZH(UnitName)
	for i=1,getn(AllPlayers),1 do
		if EvaluateCondition("NAMED_OWNED_BY_PLAYER", UnitName, AllPlayers[i]) then
			return AllPlayers[i]
		end
	end
end

function GetTeamZH(UnitName)
	local Player = GetPlayerZH(UnitName)
	for i=1,getn(AllTeams),1 do
		if EvaluateCondition("TEAM_OWNED_BY_PLAYER", AllTeams[i], Player) then
			return AllTeams[i]
		end
	end
end

function GetPlayerNameAlt(input)
	if type(input) == "table" then
		return "Player_" .. gsub(ObjectTeamName(input), "%a+%p+", "")
	elseif strfind(input,"team") then
		--EvaluateCondition("TEAM_OWNED_BY_PLAYER", TEAM, PLAYER)
		return "Player_" .. gsub(input, "%a+%p+", "")
	else	
		for i=1,8,1 do
			if EvaluateCondition("NAMED_OWNED_BY_PLAYER", object, "Player_" .. i) then
				return "Player_" .. i .. "/teamPlayer_" .. i
			end
		end
	end
end

function GetTeam_(object)  --_Alternative more reliable but slower
	for i=1,getn(Players),1 do
		if EvaluateCondition("NAMED_OWNED_BY_PLAYER", GetObjectStringRef(object), Players[i]) then
			for j=1,getn(Teams),1 do
				if strfind(Teams[j], Players[i]) then
					return Teams[j]
				end
			end
		end
	end
	return GetTeamName(object)
end
GetTeamName = GetTeam

function GetPlayer(object)
	local UnitName = GetObjectStringRef(object)
	for i=1,getn(Players),1 do
		if EvaluateCondition("NAMED_OWNED_BY_PLAYER", UnitName, Players[i]) then
			return Players[i]
		end
	end
	return strsub(GetTeamName(object),1,8)
end

function GetLocalPlayerTeam()
	if SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then 
		return GetTeamByPlayer(GetLocalPlayerRA3())
	else
		for i=1,getn(Teams),1 do
			if EvaluateCondition("TEAM_OWNED_BY_PLAYER", Teams[i], "<Local Player>") then
				return Teams[i]
			end
		end
		return NeutralTeam
	end
end

function GetLocalPlayerRA3()
	for i=1,getn(Players),1 do
		if EvaluateCondition("PLAYER_IS_HUMAN_OR_AI_PERSONALITY", Players[i], "Human") then
			return Players[i]
		end
	end
end

function GetLocalPlayer()
	if SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then 
		return GetLocalPlayerRA3() 
	else
		return strsub(GetLocalPlayerTeam(),1,8)
	end
end

function GetPlayerByTeam(team)
	return strsub(team,1,8)
end

function GetTeamByPlayer(player)
	for i=1,getn(Teams),1 do
		if strfind(Teams[i], player) then 
			return Teams[i] 
		end
	end
end

function GetPlayerIndex(Player)
	return strsub(Player,8,8)
end

function IsHuman(input)
	if EvaluateCondition("NAMED_OWNED_BY_PLAYER", GetObjectStringRef(input), "SkirmishHuman") 
		or EvaluateCondition("TEAM_OWNED_BY_PLAYER", input, "SkirmishHuman")
		or EvaluateCondition("NAMED_OWNED_BY_PLAYER", GetObjectStringRef(input), "Multiplayer_Human") 
		or EvaluateCondition("TEAM_OWNED_BY_PLAYER", input, "Multiplayer_Human") then
			return true
	end
	--RA3: if EvaluateCondition("PLAYER_IS_HUMAN_OR_AI_PERSONALITY", GetPlayer(input), "Human") then return true end
end

function CheckPlayerToTeam()
	for i=1,getn(PLAYER_TABLE),1 do
		for j=1,getn(TEAM_TABLE),1 do
			if EvaluateCondition("TEAM_OWNED_BY_PLAYER", TEAM_TABLE[j], PLAYER_TABLE[i]) then
				print(TEAM_TABLE[j] .. " - " ..  PLAYER_TABLE[i])
			end
		end
	end
end

function SetPlayerAndTeamTables()	
	for i=1,8,1 do
		if not EvaluateCondition("TEAM_DESTROYED", "Player_" .. i .. "/teamPlayer_" .. i) then 
			print("Player_" .. i .. "/teamPlayer_" .. i)
		end
		if not EvaluateCondition("TEAM_DESTROYED", "Player_" .. i .. "/defaultSkirmishTeamPlayer_" .. i) then 
			print("Player_" .. i .. "/defaultSkirmishTeamPlayer_" .. i)
		end
		if not EvaluateCondition("PLAYER_ALL_DESTROYED", "Player_" .. i) then 
			print("Player_" .. i)
		end
	end
end

PLAYER_TABLE = 
{
	"Player_1",
	"Player_2",
	"Player_3",
	"Player_4",
	"Player_5",
	"Player_6",
	"Player_7",
	"Player_8",
	"PlyrNeutral",
	"PlyrCivilian",
	"PlyrCreeps",
	"SkirmishHuman",
	"Multiplayer_Human",
	"SkirmishNeutral",
	"SkirmishNull",
	"Skirmish",
	"SkirmishCivilian",
	"SkirmishCommentator",
	"FactionCivilian",
	"SkirmishGDI",
	"SkirmishAlien",
	"SkirmishBlackHand",
	"SkirmishMarkedOfKane",
	"SkirmishNod",
	"SkirmishObserver",
	"SkirmishReaper17",
	"SkirmishSteelTalons",
	"SkirmishTraveler59",
	"SkirmishZOCOM",
	"<MetaGamePlayer,MetaGameDataManager>",
	"<Local Player>",
	"<Local Player's Allies incl Self>",
	"<Local Player's Allies>",
	"<Local Player's Enemies>",
	"<Local Player's Enemy>",
	"<This Player>",
	"<This Player's Allies incl Self>",
	"<This Player's Allies>",
	"<This Player's Enemies>",
	"<This Player's Enemy>",
	"<1st Human Player>",
	"<1st Human Player's Allies incl Self>",
	"<1st Human Player's Allies>",
	"<1st Human Player's Enemies>",
	"<All Human Players>", --CNC4
	"Player",
	"TeamManager1",
	"TeamManager2",
	"<All Players>",
}

PLAYER_TABLE_CNCZH = {
	"player0",
	"player1",
	"player2",
	"player3",
	"player4",
	"player5",
	"player6",
	"player7",
	"PlyrCivilian",
	"SkirmishAmerica",
	"SkirmishAmericaAirForceGeneral",
	"SkirmishAmericaLaserGeneral",
	"SkirmishAmericaSuperWeaponGeneral",
	"SkirmishChina",
	"SkirmishChinaInfantryGeneral",
	"SkirmishChinaNukeGeneral",
	"SkirmishChinaTankGeneral",
	"SkirmishGLA",
	"SkirmishGLADemolitionGeneral",
	"SkirmishGLAStealthGeneral",
	"SkirmishGLAToxinGeneral"
}

TEAM_TABLE = {
	"/team", --neutral team
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
	"TeamManager1/teamTeamManager1", --RA3 + C&C4
	"TeamManager2/teamTeamManager2",  --RA3 + C&C4
	"Player/teamPlayer",  --C&C4

	"SkirmishHuman/teamSkirmishHuman",
	"DummyAITeam53", --"DummyAITeamXX"
}

function PartOf(list,input)
	if getn(list) == 0 or not input then return false end
	for i=1,getn(list),1 do
		--if strfind(list[i], input) then 
		if list[i] == input then 
			return true
		end
	end
	return false
end

function GetObjectDistance(object1 ,object2, start_distance)
    CompareTable = { LT=0, LE=1, EQ=2, GE=3, GT=4, NE=5, ["<"]=0, ["<="]=1, ["=="]=2, [">="]=3, [">"]=4, ["~="]=5 }
    local GetObjectStringRef = function(object)       
        if type(object) == "string" then return object
        else 
            local _, count = gsub(ObjectDescription(object),"%(","")
            if count>1 then
                return strsub(ObjectDescription(object), strfind(ObjectDescription(object),'(",1,true)+1,strfind(ObjectDescription(object),")',1,true)-1)
            else
                local StrRef = "object_" .. floor(GetRandomNumber()*99999999)
                ExecuteAction("SET_UNIT_REFERENCE", StrRef, object)
                return StrRef
            end
        end
    end
    object1 = GetObjectStringRef(object1)
    object2 = GetObjectStringRef(object2)    
    if object1==nil or object2==nil or not EvaluateCondition("NAMED_NOT_DESTROYED",object1) or not EvaluateCondition("NAMED_NOT_DESTROYED",object2) then return 0 end
    local v = {}
    v.GetDistance = function(lowerlimit,upperlimit)
        local mid=(upperlimit+lowerlimit)/2
        if upperlimit-lowerlimit<=1 then return lowerlimit
        elseif EvaluateCondition("DISTANCE_BETWEEN_OBJ", %object1, %object2, CompareTable["<"], mid) then return %v.GetDistance(lowerlimit,mid)
        else return floor(%v.GetDistance(mid,upperlimit)+0.5) end
    end
    if start_distance then return v.GetDistance(0,tonumber(start_distance)) 
    else return v.GetDistance(0,12870) end   --maxdiagsize=ceil(sqrt(2*(7500+2*800)^2)))
end

function WriteToFile(output,file)
	local filehandle = openfile(file, 'a')
	if filehandle ~= nil then
		write(filehandle,"\n" .. output)
	else
		local filehandle = writeto(file)
		write(filehandle,"\n" .. output)  
	end
	flush(filehandle)
	closefile(filehandle)
end

function WriteGlobalsToMetaLog()
	local str = ""
	for k,v in globals() do
		str = str .. k .. "\n"
	end
	WriteToFile(str, [[C:\Users\]] .. getenv("USERNAME") .. [[\Documents\Meta\meta.log]])
end

function WriteRegisteredObjectsToMetaLog()
	local str = ""
	for k,v in globals() do
		if strfind(k, "ObjID") then
			str = str .. k .. " " .. tostring(v[1]) .. "\n"
		end
	end
	WriteToFile(str, [[C:\Users\]] .. getenv("USERNAME") .. [[\Documents\Meta\meta.log]])
end

--------------------------------------------------------------------------
------------------------GAMEMODE HELPER FUNCTIONS-------------------------
--------------------------------------------------------------------------

function ActionOnAllObjects(Action)
	for index,object in globals() do
		if strfind(index, "ObjID") then
			Action(object)
		end
	end
end	

function HasString(str,table)
	for i=1,getn(table),1 do
		if strfind(str, table[i]) then
			return true
		end
	end
	return false
end

function RemoveStartingUnits(OnlyLocalPlayer)
	Porters = {"DwarvenPorter", "MenPorter", "ElvenPorter", "ArnorPorter", "MordorPorter", "IsengardPorter", "WildPorter", "AngmarPorter"}
	local DeleteCondtion = function(Object)
		local ObjectDesc = ObjectDescription(Object)
		if SAGE_GAME <= BFME2ROTWK then
			if strfind(ObjectDesc, "BASE_FLAG") or HasString(ObjectDesc,Porters) then return true end
		elseif SAGE_GAME <= CNC3KW then
			if strfind(ObjectDesc, "BASE_FLAG") then return true end
		elseif SAGE_GAME <= CNCRA3U then
			if strfind(ObjectDesc, "BASE_FLAG") then return true end
		elseif SAGE_GAME == CNC4 then
			if strfind(ObjectDesc, "BASE_FLAG") then return true end
		end
		return false
	end
	if OnlyLocalPlayer then
		for ObjectIndex,Object in globals() do
			if strfind(ObjectIndex, "ObjID") and DeleteCondtion(Object) and GetPlayer(Object) == LocalPlayer then
				ExecuteAction("NAMED_DELETE", Object) 		  
			end
		end	
	else
		for ObjectIndex,Object in globals() do
			if strfind(ObjectIndex, "ObjID") and DeleteCondtion(Object) then
				ExecuteAction("NAMED_DELETE", Object) 		  
			end
		end	
	end
end

VictoryConditionAnchorList = {}
function OverwriteVictoryCondition(OnlyLocalPlayer)
	PlayerList = {}
	--ExecuteAction("SET_IGNORE_SKIRMISH_VICTORY_CONDITIONS", 1)
	if not VICTORY_CONDITION_HELPER then VICTORY_CONDITION_HELPER = "GDIPowerPlant" end
	if OnlyLocalPlayer then
		tinsert(PlayerList, LocalPlayer)
	else
		PlayerList = Players
	end
	for i=1,getn(PlayerList),1 do
		local VictoryConditionHelper = "object_" .. tostring(floor(9999999*GetRandomNumber()))
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", VictoryConditionHelper, VICTORY_CONDITION_HELPER, GetTeamByPlayer(PlayerList[i]), {MapSizeX/2,MapSizeY/2,-300}, 0)
		VictoryConditionAnchorList[PlayerList[i]] = VictoryConditionHelper
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", VictoryConditionHelper, "Indestructible", 1) 
		ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", VictoryConditionHelper, GetObjectStatus("NOT_IN_WORLD"), 1)
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", VictoryConditionHelper, "Unsellable", 1)
		ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", VictoryConditionHelper, "Player Targetable", 0)
		if SAGE_GAME ~= BFME2ROTWK then ObjectSetObjectStatus(GetObjectLuaRef(VictoryConditionHelper),"UNATTACKABLE") end
		ObjectForbidPlayerCommands(GetObjectLuaRef(VictoryConditionHelper),true)
	end
end

function SetWinnerPlayer(WINNER_PLAYER)
	for i=1,getn(Players),1 do
		if Players[i] ~= WINNER_PLAYER then
			ExecuteAction("PLAYER_KILL", Players[i])
		end
	end	
end

--------------------------------------------------------------------------
------------------------TOGGLE SUPERWEAPON BUILABILITY--------------------
--------------------------------------------------------------------------


function SuperweaponsBuildability(what)
	local BUILDABILITY_TYPE = { ["YES"] = 0,["IGNORE_PREREQUISITES"] = 1,["NO"] = 2,["ONLY_BY_AI"] = 3 }
	local Superweapon_Buildings =
	{
		"GDIIonCannonControl", "SteelTalonsIonCannonControl", "ZOCOMIonCannonControl",
		"NODTempleOfNOD", "BlackHandTempleOfNOD", "MarkedOfKaneTempleOfNOD",
		"AlienRiftGenerator", "Reaper17RiftGenerator","Traveler59RiftGenerator"
	}
	for n = 1, getn(Superweapon_Buildings), 1 do
		ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", Superweapon_Buildings[n], BUILDABILITY_TYPE[what])
	end
end

function ToggleSuperweaponsBuildability()
	if SUPERWEAPONSTATE == nil then SUPERWEAPONSTATE = false end
	if not SUPERWEAPONSTATE then 
		SUPERWEAPONSTATE = true
		SuperweaponsBuildability("NO")
	else 
		SUPERWEAPONSTATE = false
		SuperweaponsBuildability("YES")
	end	
end



--------------------------------------------------------------------------
------------------------RESET CAMERA--------------------------------------
--------------------------------------------------------------------------

function ResetCamera()
	ExecuteAction("CAMERA_SET_DEFAULT",0.00,0.00,1)
	ExecuteAction("CAMERA_STOP_TETHER_NAMED")
	ExecuteAction("CAMERA_STOP_FOLLOW")
	ExecuteAction("ROTATE_CAMERA_TO_ANGLE",0,0,0,0)
	ExecuteAction("PITCH_CAMERA",1,1,1,1)	
    ExecuteAction("ZOOM_CAMERA",1, 1, 1, 1)	
	ExecuteAction("LOCK_CAMERA",0)
	ExecuteAction("LOCK_CAMERA_ZOOM",0)
	ExecuteAction("LOCK_CAMERA_ROTATION",0)
	ExecuteAction("LOCK_CAMERA_SCROLL",0)
	ExecuteAction("LOCK_CAMERA_RESET",0)
	ExecuteAction("LOCK_CAMERA_ANGLE_AND_HEIGHT",0)	
	ExecuteAction("RESET_CAMERA_TUTORIAL_STATE")
	ExecuteAction("DIM_WORLD_LIGHTS",1,1,1,0)
	ExecuteAction("RESTORE_WORLD_LIGHTS",1)
    ExecuteAction("SHOW_UI")	
	ExecuteAction("CAMERA_DISABLE_SLAVE_MODE")
	ExecuteAction("ENABLE_INPUT")
	ExecuteAction("DRAW_SKYBOX_END")
end 

--------------------------------------------------------------------------
------------------------CAMERA TOP DOWN VIEW------------------------------
--------------------------------------------------------------------------

function CameraTopDownView()
	MapSize = {}
	MapSize.x = 400
	MapSize.y = 400
	TempScaleFactor = 5
	ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
	ExecuteAction("ZOOM_CAMERA", TempScaleFactor*max(MapSize.x, MapSize.y) / 500, 1, 1, 1)
	ExecuteAction("PITCH_CAMERA", 500, 1, 1, 1)
	--ExecuteAction("ROTATE_CAMERA", 1, 50, 1, 1)
end

--------------------------------------------------------------------------
----------------OBJECTTYPE ENTER NEAREST OBJECT TYPE----------------------
--------------------------------------------------------------------------


function GetObjectTypeListForTeamAlternative(team,ObjectType) --ObjectType or ObjectTypeList 
	local RefList = {}
	local ObjRef = ""
	repeat
		ObjRef = "object_" .. tostring(floor(9999999*GetRandomNumber()))
		ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE",ObjectType,team,ObjRef)   --"NonLuaObjectsList"
		if EvaluateCondition("NAMED_NOT_DESTROYED", ObjRef) then 
			--if not ObjectTestModelCondition(GetObjectLuaRefWithStatus(ObjRef),"LOADED") then
				tinsert(RefList, ObjRef)
				ExecuteAction("UNIT_SET_TEAM",ObjRef,"team")
			--end
		else break end
	until(not EvaluateCondition("NAMED_NOT_DESTROYED",ObjRef))
	for j=1,getn(RefList),1 do
		ExecuteAction("UNIT_SET_TEAM",RefList[j],team)
	end
	return RefList
end

function GetObjectTypeListForTeamAlternative2(ObjectType, team)
	local ProbeUnitRef = "object_" .. tostring(floor(9999999*GetRandomNumber()))
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", ProbeUnitRef, ObjectType, "team", "0", 0)
	local ObjectTypeIdent = strsub(ObjectTemplateName(GetObjectLuaRef(ProbeUnitRef)), 6,  13)
	ExecuteAction("NAMED_DELETE", ProbeUnitRef)
	local ObjectTable = {}
	for index,object in globals() do
		if strfind(index, "ObjID") and strfind(ObjectTemplateName(object), ObjectTypeIdent) and GetTeamName(object) == team then
			tinsert(ObjectTable,GetObjectStringRef(object))
		end
	end
	return ObjectTable
end

function GetObjectTypeListForTeam(team, ObjectType)
	local ObjectTypeIdent = ""
	local RelevantObjectHashIndexTypeTable = 
	{
		["220279058"]="ZOCOMZoneRaiderSquad",["68593967"]="AlienBuzzerHive",["4005307538"]="AlienControlCenter",["4277513717"]="AlienDronePlatform",["4278029493"]="AlienGateway",["1790899068"]="AlienLightningSpike",["4105382990"]="AlienPhotonCannon",["3053741411"]="AlienPlasmaMissileBattery",["2459686593"]="AlienPortal",["2501601210"]="AlienReactor",["944677863"]="AlienRiftGenerator",["3809858739"]="AlienSignalTransmitter",["3249535276"]="AlienStatisChamber",["1113391268"]="AlienStormColumn",["1183416773"]="AlienWarpBeacon",
		["2907988778"]="GDIAABattery",["2199177120"]="GDIAirTower",["867437679"]="GDIArmory",["332753075"]="GDIBarracks",["2150169165"]="GDIBattleBase",["3781531209"]="GDICommandPost",["1963689327"]="GDIConstructionYard",["894742678"]="GDIGolumCannon",["4059391770"]="GDIIonCannonControl",["291376689"]="GDIMedicalBay",["596796102"]="GDIPowerPlant",["380136808"]="GDIRefinery",["2167863030"]="GDISpaceCommandUplink",["3439867302"]="GDITerraformingStation",["352599915"]="GDITiberiumSilo",["2596103596"]="GDIWarFactory",["1051033844"]="GDIWatchTower",
		["3514124163"]="NODConstructionYard",["1719459484"]="NODCrane",["1553745000"]="NODDisruptionTower",["580140829"]="NODDropZone",["1916828239"]="NODHandOfNOD",["3586535492"]="NODHangar",["3226449953"]="NODLaserCannon",["2395565189"]="NODLaserCannonSpawn",["798795912"]="NODMiniMCVOutpost",["3868904616"]="NODObelisk",["2758452353"]="NODOperationsCenter",["2738079400"]="NODPowerPlant",["3050468790"]="NODRefinery",["2182292141"]="NODRocketBunker",["4191971488"]="NODRocketBunkerSpawn",["4212397519"]="NODShredderTurret",["1314385739"]="NODShredderTurretHub",["3861967411"]="NODTechAssemblyPlant",["1670123888"]="NODTempleOfNOD",["2405528079"]="NODTiberiumLiquidationFacility",
		["3489768722"]="BlackHandConstructionYard",["700254408"]="BlackHandPowerPlant",["100072016"]="BlackHandRefinery",["1881126022"]="BlackHandHandOfNod",["744653454"]="BlackHandDropZone",["587542384"]="BlackHandOperationsCenter",["258129317"]="BlackHandSecretShrine",["1872037456"]="BlackHandTechAssemblyPlant",["2566151430"]="BlackHandShredderTurretHub",["842149963"]="BlackHandLaserCannon",["4122814948"]="BlackHandRocketBunker",["3169264583"]="BlackHandTiberiumSilo",["3616161493"]="BlackHandPropagandaTower",["2373507443"]="BlackHandTempleOfNOD",["3458227666"]="BlackHandTiberiumLiquidationFacility",["168221011"]="BlackHandCrane",["2102790892"]="BlackHandEmissary",
		["2240770736"]="MarkedOfKaneConstructionYard",["3186266847"]="MarkedOfKanePowerPlant",["1088200982"]="MarkedOfKaneRefinery",["3872699996"]="MarkedOfKaneDropZone",["3331955598"]="MarkedOfKaneOperationsCenter",["2386700586"]="MarkedOfKaneHangar",["2329896961"]="MarkedOfKaneSecretShrine",["4154127587"]="MarkedOfKaneTechAssemblyPlant",["3576851614"]="MarkedOfKaneTiberiumLiquidationFacility",["2170679445"]="MarkedOfKaneShredderTurretHub",["1070053604"]="MarkedOfKaneLaserCannon",["2639459287"]="MarkedOfKaneRocketBunker",["399887018"]="MarkedOfKaneTiberiumSilo",["2091770787"]="MarkedOfKaneDisruptionTower",["324108153"]="MarkedOfKanePropagandaTower",["2703520950"]="MarkedOfKaneTempleOfNOD",["1979182309"]="MarkedOfKaneAirSupport",["1733547210"]="MarkedOfKaneCrane",["3183713661"]="MarkedOfKaneEmissary",
		["3381940374"]="SteelTalonsConstructionYard",["3858223515"]="SteelTalonsPowerPlant",["1278094373"]="SteelTalonsRefinery",["882621777"]="SteelTalonsBarracks",["1084321921"]="SteelTalonsWarfactory",["694935703"]="SteelTalonsCommandPost",["4004273719"]="SteelTalonsAirTower",["1815125931"]="SteelTalonsTechCenter",["258215728"]="SteelTalonsSpaceCommandUplink",["1866269769"]="SteelTalonsWatchTower",["898545124"]="SteelTalonsGolumCannon",["1551902107"]="SteelTalonsAABattery",["745452156"]="SteelTalonsTiberiumSilo",["23350187"]="SteelTalonsIonCannonControl",["3747068994"]="SteelTalonsAirSupport",["4092691421"]="SteelTalonsSurveyor",
		["1801077552"]="ZOCOMConstructionYard",["887561926"]="ZOCOMPowerPlant",["3127011197"]="ZOCOMRefinery",["1357601015"]="ZOCOMBarracks",["2401382389"]="ZOCOMWarFactory",["3537949332"]="ZOCOMCommandPost",["4072220311"]="ZOCOMAirTower",["3882856207"]="ZOCOMArmory",["525661890"]="ZOCOMSpaceCommandUplink",["1345260202"]="ZOCOMWatchTower",["1647247595"]="ZOCOMGolumCannon",["4099523718"]="ZOCOMAABattery",["3536484668"]="ZOCOMTiberiumSilo",["144548681"]="ZOCOMTerraformingStation",["1067695218"]="ZOCOMIonCannonControl",["4136229536"]="ZOCOMAirSupport",["4253616897"]="ZOCOMSurveyor",
		["3923673017"]="Reaper17DronePlatform",["950315488"]="Reaper17Portal",["2593223505"]="Reaper17Gateway",["667107644"]="Reaper17BuzzerHive",["3130415049"]="Reaper17PhotonCannon",["265642851"]="Reaper17PlasmaMissileBattery",["3689489833"]="Reaper17GrowthStimulator",["4021609152"]="Reaper17ControlCenter",["1751309187"]="Reaper17StormColumn",["979676758"]="Reaper17WarpBeacon",["3945608163"]="Reaper17StasisChamber",["3755810217"]="Reaper17Reactor",["204938282"]="Reaper17SignalTransmitter",["2768470878"]="Reaper17RiftGenerator",["4092129615"]="Reaper17Explorer",
		["1045578362"]="Traveler59DronePlatform",["2906365133"]="Traveler59Portal",["1464056924"]="Traveler59Gateway",["3580113147"]="Traveler59BuzzerHive",["1789432218"]="Traveler59PhotonCannon",["945628840"]="Traveler59PlasmaMissileBattery",["1961941872"]="Traveler59ControlCenter",["1651080236"]="Traveler59StormColumn",["1900739263"]="Traveler59WarpBeacon",["1943362252"]="Traveler59StatisChamber",["2599918733"]="Traveler59Reactor",["1042838317"]="Traveler59SignalTransmitter",["1132033882"]="Traveler59RiftGenerator",["2357377132"]="Traveler59Explorer",
		["3805790263"]="AlienAnnihilatorTripod",["2861908637"]="AlienAssimilator",["2384886255"]="AlienBuzzers",["2007034025"]="AlienCorrupter",["1122195248"]="AlienDevastatorWarship",["2946044786"]="AlienDevourerTank",["1267973868"]="AlienExplorer",["27610139"]="AlienGunWalker",["350440930"]="AlienHarvester",["4127320940"]="AlienMastermind",["820198441"]="AlienMCV",["518911667"]="AlienMothership",["350932745"]="AlienPlanetaryAssaultCarrier",["731130064"]="AlienRazorDroneSquad",["3095406435"]="AlienSeekerTank",["1687549193"]="AlienShockTrooperSquad",["4142335957"]="AlienStormrider",
		["3491560840"]="GDIAPC",["3703068792"]="GDICommando",["1693375322"]="GDIEngineer",["3006676643"]="GDIFireHawk",["1116299360"]="GDIGrenadeSoldierSquad",["220562260"]="GDIHarvester",["843615794"]="GDIJuggernaught",["3154774089"]="GDIMammoth",["1385386646"]="GDIMCV",["4010955483"]="GDIMissileSoldierSquad",["3045524383"]="GDIOrca",["1878337544"]="GDIPitbull",["3874148396"]="GDIPredator",["2425788014"]="GDIRifleSoldierSquad",["3029069266"]="GDIRig",["3165874693"]="GDISniperSquad",["2451310284"]="GDISurveyor",["1566464305"]="GDIZoneTrooperSquad",
		["3144715221"]="NODAttackBike",["3154900504"]="NODAvatar",["1335753027"]="NODBeamCannon",["19442673"]="NODBlackHandSquad",["3672109216"]="NODCommando",["315538775"]="NODEmissary",["3195811997"]="NODFanaticSquad",["4253557425"]="NODFlameTank",["977080474"]="NODHarvester",["138622706"]="NODMCV",["2311346244"]="NODMilitantRocketSquad",["3157665146"]="NODMilitantSquad",["49877789"]="NODRaiderTank",["2740814684"]="NODSaboteur",["1666470685"]="NODScorpionBuggy",["2799763464"]="NODShadowSquad",["2511757"]="NODStealthTank",["2334830347"]="NODVenom",["1789238550"]="NODVertigo",
		["1257948904"]="SteelTalonsAAScout",["678291396"]="SteelTalonsAPC",["1393982803"]="SteelTalonsBehemoth",["2454939462"]="SteelTalonsBehemothHusk",["2162161113"]="SteelTalonsCombatEngineer",["323537418"]="SteelTalonsFirehawk",["3671849580"]="SteelTalonsHammerhead",["4113231583"]="SteelTalonsHeavyHarvester",["1448863781"]="SteelTalonsMARV",["1048504193"]="SteelTalonsMCV",["1809299627"]="SteelTalonsOrca",["207849440"]="SteelTalonsPitbull",["2093312067"]="SteelTalonsRepairAPC",["2195121624"]="SteelTalonsRig",["4092691421"]="SteelTalonsSurveyor",["1013465808"]="SteelTalonsTitan",["1547951759"]="SteelTalonsWolverine",["3781304154"]="SteelTalonsZoneTrooper",
		["1516258492"]="ZOCOMAAScout",["1690087686"]="ZOCOMAPC",["799347858"]="ZOCOMCommando",["9593062"]="ZOCOMEngineer",["1121278001"]="ZOCOMFirehawk",["4198989482"]="ZOCOMHammerhead",["3258661397"]="ZOCOMHarvester",["2926777231"]="ZOCOMImprovedSonicTank",["938518005"]="ZOCOMMARV",["856485008"]="ZOCOMMCV",["4205217600"]="ZOCOMOrca",["2908684823"]="ZOCOMPitbull",["1875583768"]="ZOCOMRig",["4253616897"]="ZOCOMSurveyor",
		["696000818"]="BlackHandAttackBike",["2136759514"]="BlackHandBeamCannon",["2801258734"]="BlackHandBlackHand",["428602625"]="BlackHandBunkerTruck",["1313610083"]="BlackHandCommando",["3583409476"]="BlackHandConfessor",["266270183"]="BlackHandConfessorSquad",["1014761723"]="BlackHandCustomWarmech",["3039749024"]="BlackHandFanatic",["505081534"]="BlackHandFlameTank",["560340475"]="BlackHandHarvester",["1533894628"]="BlackHandMCV",["3445248864"]="BlackHandMetaUnit",["3965962140"]="BlackHandMilitantRocketSuqad",["2053347994"]="BlackHandMobileArtillery",["673845731"]="BlackHandSaboteur",["4085650877"]="BlackHandStealthTank",["1024735831"]="MarkedOfKaneBeamCannon",
		["805339674"]="MarkedOfKaneBunkerTruck",["1080857772"]="MarkedOfKaneCommando",["2946093985"]="MarkedOfKaneFanaticSquad",["3279444990"]="MarkedOfKaneHarvester",["3355984486"]="MarkedOfKaneImprovedCyborgInfantrySquad",["3011801859"]="MarkedOfKaneMCV",["1897535711"]="MarkedOfKaneMetaUnit",["3012487848"]="MarkedOfKaneMilitantRocketSuqad",["2589147079"]="MarkedOfKaneMobileArtillery",["2795684308"]="MarkedOfKaneSaboteur",["1334603167"]="MarkedOfKaneShadow",["270907659"]="MarkedOfKaneStealthTank",["602416393"]="MarkedOfKaneVenom",["960382060"]="MarkedOfKaneVertigo",
		["1306091781"]="Reaper17AnnihilatorTripod",["2362841443"]="Reaper17AnnihilatorTripodHusk",["2978478202"]="Reaper17Corrupter",["1097793023"]="Reaper17DevourerTank",["342632592"]="Reaper17EradicatorHexapod",["4092129615"]="Reaper17Explorer",["3279909415"]="Reaper17Harvester",["4006428288"]="Reaper17MCV",["2144140771"]="Reaper17ShardWalker",["1609077176"]="Reaper17ShockTrooper",["2817508979"]="Reaper17Stalker",["502803990"]="Reaper17Stormrider",
		["1955351586"]="Traveler59AnnihilatorTripod",["3755881343"]="Traveler59Assimilator",["1602225375"]="Traveler59BlinkMastermind",["2444605085"]="Traveler59Corrupter",["3090055454"]="Traveler59Cultist",["2975757644"]="Traveler59DevastatorWarship",["2768054299"]="Traveler59EradicatorHexapod",["2357377132"]="Traveler59Explorer",["1363345491"]="Traveler59GunWalker",["2575537599"]="Traveler59Harvester",["690860851"]="Traveler59MCV",["259097660"]="Traveler59PlanetaryAssaultCarrier",["1922468124"]="Traveler59SeekerTank",["1499625309"]="Traveler59ShockTrooper",["1439301044"]="Traveler59Stalker",["3969942881"]="Traveler59Stormrider",
		["105176262"]="GDIOrcaSensorPod",["1847717182"]="GuardShieldEmitter",["3940261646"]="MetaTechMCV",["903497890"]="MetaTechSuperAvatar",["2566837260"]="MetaTechBarracks",["3017582790"]="MetaTechCommandPost",["1719454038"]="MetaTechConstructionYard",["2402772029"]="MetaTechHangar",["3309625077"]="MetaTechMedicalBay",["3629233383"]="MetaTechReclamatorHub",["125384694"]="MetaTechTechCenter",["128886932"]="MetaTechWarFactory"
	}
	for k,v in RelevantObjectHashIndexTypeTable do
		if v==ObjectType then 
			ObjectTypeIdent = tostring(format("%X",k))
			--out(ObjectTypeIdent)
		end
	end
	local ObjectTable = {}
	for index,object in globals() do
		if strfind(index, "ObjID") and ObjectTemplateName(object) and strfind(ObjectTemplateName(object), ObjectTypeIdent) then --and GetTeamName(object) == team then
			tinsert(ObjectTable,GetObjectStringRef(object,index))
			--tinsert(ObjectTable,object)
		end
	end
	return ObjectTable
end

function IsUnitLoadedOrPassenger(object)
	local LuaObjRef = GetObjectLuaRef(object)
	if EvaluateCondition("UNIT_HAS_PASSENGER",GetObjectStringRef(object)) or ObjectTestModelCondition(GetObjectLuaRef(object),"LOADED") or ObjectTestModelCondition(LuaObjRef,"PASSENGER") or ObjectTestModelCondition(LuaObjRef,"CARRYING") then
		return true
	else return false end
end

function ObjectTypeEnterNearestObjectType(Passenger, Transporter, team)
	if not team then team = LocalPlayer end
	local ObjectList1 = GetObjectTypeListForTeam(team,Transporter)
	local ObjectList2 = GetObjectTypeListForTeam(team,Passenger)
	local MaxObjectLinks = min(getn(ObjectList1),getn(ObjectList2))
	if getn(ObjectList2) < 1 then
		ObjectList2 = GetObjectTypeListForTeamAlternative(team,Passenger)
		if getn(ObjectList1) < 1 then
			ObjectList1 = GetObjectTypeListForTeamAlternative(team,Transporter)
		end
	end
	local DistanceMatrix = {}
	local ObjectLinkStatus = {}
	for i=1,getn(ObjectList1),1 do
		--if not EvaluateCondition("UNIT_HAS_PASSENGER",GetObjectStringRef(ObjectList1[i])) then --and not ObjectTestModelCondition(GetObjectLuaRef(ObjectList1[i]),"LOADED") then
			for j=1,getn(ObjectList2),1 do
				--tinsert(DistanceMatrix, { GetObjectDistance(globals[ObjectList1[i]], globals[ObjectList2[j]]), ObjectList1[i], ObjectList2[j] })
				tinsert(DistanceMatrix, { GetObjectDistance(ObjectList1[i], ObjectList2[j]), ObjectList1[i], ObjectList2[j] })
				ObjectLinkStatus[ObjectList1[i]] = false
				ObjectLinkStatus[ObjectList2[j]] = false
			end	
		--end
	end	
	local SortHelper=function(ObjectLinkCurrent, ObjectLinkNext)
		if ObjectLinkCurrent[1] < ObjectLinkNext[1] then return true end
	end
	sort(DistanceMatrix,SortHelper)
	--while(MaxObjectLinks>1) do
		for i=1,getn(DistanceMatrix),1 do
			if not ObjectLinkStatus[DistanceMatrix[i][3]] and not ObjectLinkStatus[DistanceMatrix[i][2]] then
				if not EvaluateCondition("UNIT_HAS_PASSENGER",GetObjectStringRef(DistanceMatrix[i][2])) then --and not ObjectTestModelCondition(GetObjectLuaRef(DistanceMatrix[i][3]),"LOADED") then
					if not ObjectTestModelCondition(GetObjectLuaRef(DistanceMatrix[i][3]),"PASSENGER") then 
						ObjectLinkStatus[DistanceMatrix[i][2]] = true
						ObjectLinkStatus[DistanceMatrix[i][3]] = true
						ExecuteAction("NAMED_ENTER_NAMED", DistanceMatrix[i][3], DistanceMatrix[i][2])
					else
						ObjectLinkStatus[DistanceMatrix[i][3]] = true
					end
				else
					ObjectLinkStatus[DistanceMatrix[i][2]] = true					
				end
				MaxObjectLinks = MaxObjectLinks - 1
			end
		end
	--end	
end

--------------------------------------------------------------------------
------------------------FOLLOW SELECTED UNIT------------------------------
--------------------------------------------------------------------------

Zoom = 0
Pitch = 0

function GetSelectedUnitFallback(flash) --EvaluateCondition not working here
	for k,v in globals() do
	    if strfind(k,"ObjID") and ObjectTestModelCondition(v,"SELECTED") then  --EvaluateCondition("NAMED_SELECTED",v)--EvaluateCondition("TYPE_SELECTED", objectname)	
			if flash then ExecuteAction("NAMED_FLASH_WHITE", v, 2)	end
			return v
		end
	end
	return nil
end

function GetSelectedUnit5()
	local TeamTable = GetValidTeamList()
	local SelectedUnit = "empty"
	for j=1,getn(TeamTable),1 do
		if SelectedUnit ~= "empty" then break end
		for i=1,getn(RelevantObjectTypeTable),1 do
			if SelectedUnit ~= "empty" then break end
			repeat
				local ObjRef = "object_" .. floor(GetRandomNumber()*99999999)
				ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", RelevantObjectTypeTable[i], TeamTable[j], ObjRef)
				if EvaluateCondition("NAMED_SELECTED", ObjRef) then
					SelectedUnit = ObjRef
					break
				end
			until(not EvaluateCondition("NAMED_NOT_DESTROYED",ObjRef))
		end
	end
	if SelectedUnit ~= "empty" then 
		ExecuteAction("NAMED_FLASH_WHITE", ObjRef, 2)
		return ObjRef 
	else 
		for k,v in globals() do
			if strfind(k,"ObjID") and ObjectTestModelCondition(v,"SELECTED") then  --EvaluateCondition("NAMED_SELECTED",v)--EvaluateCondition("TYPE_SELECTED", objectname)	
				ExecuteAction("NAMED_FLASH_WHITE", v, 2)
				return v
			end
		end
	end
	return nil
end

function FollowSelectedUnit()
	ExecuteAction("PITCH_CAMERA",0.01, 1, 1, 1)	
	ExecuteAction("CAMERA_FOLLOW_NAMED", GetSelectedUnit(), 1, 5)
	Zoom = 5
	Pitch = 0.01
end

function FirstPersonMode()
	SelectedObject = {}
	if SAGE_GAME <= CNCZH then
		SelectedObject = GetSelectedObjectID()
		SetSelectedObjectIndex(SelectedObject)
		local ObjectName = "object_" .. tostring(random(9999999))
		ObjectSetReference({SelectedObject}, ObjectName)
		FIRST_PERSON_MODE_OBJECT_REF = ObjectName
		ExecuteAction("ZOOM_CAMERA", 0.1, 0, 0, 0)
		Zoom = 0.1
		ExecuteAction("CAMERA_FOLLOW_NAMED", {SelectedObject}, 1)
		--ExecuteAction("CAMERA_TETHER_NAMED", {SelectedObject}, 1, 5)
		--ExecuteAction("DISABLE_INPUT")
		--ExecuteAction("CAMERA_ENABLE_SLAVE_MODE")
		ExecuteAction("DRAW_SKYBOX_BEGIN")
		ExecuteAction("CAMERA_LETTERBOX_BEGIN")
	else
		SelectedObject = GetSelectedUnit()
		SetSelectedObjectIndex(SelectedObject)
		FIRST_PERSON_MODE_OBJECT_REF = GetObjectStringRef(SelectedObject) 
		ExecuteAction("CAMERA_FOLLOW_NAMED", SelectedObject, 1, 5)
		Zoom = 5
	end
	Pitch = 0.01
	ExecuteAction("PITCH_CAMERA",0.01, 1, 1, 1)	
	ExecuteAction("HIDE_UI")
	ExecuteAction("DISABLE_BORDER_SHROUD")
	ExecuteAction("OPTIONS_SET_DRAWICON_UI_MODE", 0)
	ExecuteAction("OPTIONS_SET_OCCLUSION_MODE", 0)
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", FIRST_PERSON_MODE_OBJECT_REF, ObjectStatusTable["UNATTACKABLE"], 1)
	--ExecuteAction("UNIT_CHANGE_OBJECT_STATUS",FIRST_PERSON_MODE_OBJECT_REF,ObjectStatusTable["UNSELECTABLE"],1)
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", FIRST_PERSON_MODE_OBJECT_REF, ObjectStatusTable["NO_COLLISIONS"], 1)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", FIRST_PERSON_MODE_OBJECT_REF, "Indestructible", 1)
end

function ThirdPersonModeFar()
	FirstPersonMode()
	ExecuteAction("PITCH_CAMERA",0.65, 1, 1, 1)	
	Pitch = 0.65
	if SAGE_GAME <= CNCZH then
		ExecuteAction("ZOOM_CAMERA", 0.4, 0, 0, 0)
		Zoom = 0.4
		--ExecuteAction("CAMERA_SET_DEFAULT",0.00,0.00,0.5)
		ExecuteAction("CAMERA_FOLLOW_NAMED", {SelectedObject}, 1)
	else 
		ExecuteAction("CAMERA_FOLLOW_NAMED", SelectedObject, 1, 100.0)
		Zoom = 100.0
	end
end

function ThirdPersonModeNarrow()
	FirstPersonMode()
	ExecuteAction("PITCH_CAMERA",0.4, 1, 1, 1)	
	Pitch = 0.4
	if SAGE_GAME <= CNCZH then
		ExecuteAction("ZOOM_CAMERA", 0.2, 0, 0, 0)
		Zoom = 0.2
		--ExecuteAction("CAMERA_SET_DEFAULT",0.00,0.00,0.15)
		ExecuteAction("CAMERA_FOLLOW_NAMED", {SelectedObject}, 1)
	else 
		ExecuteAction("CAMERA_FOLLOW_NAMED", SelectedObject, 1, 15.0)
		Zoom = 15.0
	end
end

function ZoomUp()
	if SAGE_GAME <= CNCZH then
		Zoom = Zoom + 0.01
		ExecuteAction("ZOOM_CAMERA", Zoom, 0, 0, 0)
	else
		Zoom = Zoom + 2
		ExecuteAction("CAMERA_FOLLOW_NAMED", SelectedObject, 1, Zoom)
	end
	--Pitch = Zoom/200
	--ExecuteAction("PITCH_CAMERA",Pitch, 1, 1, 1)
end

function ZoomDown()
	if SAGE_GAME <= CNCZH then
		Zoom = Zoom - 0.01
		ExecuteAction("ZOOM_CAMERA", Zoom, 0, 0, 0)
	else
		Zoom = Zoom - 2
		ExecuteAction("CAMERA_FOLLOW_NAMED", SelectedObject, 1, Zoom)
	end
	--Pitch = Zoom/200
	--ExecuteAction("PITCH_CAMERA",Pitch, 1, 1, 1)	
end

CURRENT_FOLLOW_MODE = 1
function SwitchUnitFollowMode()
	if CURRENT_FOLLOW_MODE <= 3 then
		if CURRENT_FOLLOW_MODE == 1 then
			FirstPersonMode()
		elseif CURRENT_FOLLOW_MODE == 2 then
			ThirdPersonModeNarrow()
		elseif CURRENT_FOLLOW_MODE == 3 then
			ThirdPersonModeFar()
		end
		CURRENT_FOLLOW_MODE = CURRENT_FOLLOW_MODE + 1
	else
		CURRENT_FOLLOW_MODE = 1
		DisableFirstPersonMode()
		if SAGE_GAME <= CNCZH then
			ExecuteAction("CAMERA_LETTERBOX_END")
		end
	end
end

function DisableFirstPersonMode()
	ResetCamera()
	ExecuteAction("SHOW_UI")
	ExecuteAction("ENABLE_BORDER_SHROUD")
	ExecuteAction("OPTIONS_SET_DRAWICON_UI_MODE", 1)
	ExecuteAction("OPTIONS_SET_OCCLUSION_MODE", 1)
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", FIRST_PERSON_MODE_OBJECT_REF, ObjectStatusTable["UNATTACKABLE"], 0)
	--ExecuteAction("UNIT_CHANGE_OBJECT_STATUS",FIRST_PERSON_MODE_OBJECT_REF,ObjectStatusTable["UNSELECTABLE"],0)
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", FIRST_PERSON_MODE_OBJECT_REF, ObjectStatusTable["NO_COLLISIONS"], 0)
	ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", FIRST_PERSON_MODE_OBJECT_REF, "Indestructible", 0) 
end
	

--------------------------------------------------------------------------
------------------------SPAWNER-------------------------------------------
--------------------------------------------------------------------------

function GetPlayerStartWaypointByTeam(team)
	return strsub(team, 1, 8) .. "_Start"  
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

RA3U_ESSENTIAL_TWEAKS =
[[
function DebugMode()
	ExecuteAction("MAP_REVEAL_ALL_PERM", "<1st Human Player>")
	ExecuteAction("PLAYER_SET_MONEY", "<1st Human Player>", 777777)
	ExecuteAction("SET_BASE_CONSTRUCTION_SPEED", "<1st Human Player>", 5)
	ExecuteAction("PLAYER_SET_BASE_POWER", "<1st Human Player>", 2000)
end

function ChangeAllOreNodeMaxGatherValue(OreNodeMaxGatherValue)
	if not OreNodeMaxGatherValue then
		OreNodeMaxGatherValue = 10000000  --Original 30000
	end
	local OreNodeRef = ""
	local OreNodeRefList = {}
	local OreNodeType = { "OreNode", "OreNode2a", "OreNode2b", "OreNode4a", "OreNode4b", "OreNode4c", "OreNode4d" }
	--for i=1,getn(OreNodeType),1 do
		--ExecuteAction("OBJECTLIST_ADDOBJECTTYPE", "TypeListOre", OreNodeType[i])
	--end
	for i=1,getn(OreNodeType),1 do
		repeat
			OreNodeRef = "object_" .. floor(GetRandomNumber()*99999999)
			ExecuteAction("TEAM_SET_PLAYERS_NEAREST_UNIT_OF_TYPE_TO_REFERENCE", OreNodeType[i], "/team", OreNodeRef)
			ExecuteAction("NAMED_FLASH", OreNodeRef, 7)
			if EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef) then
				tinsert(OreNodeRefList, OreNodeRef)
				ExecuteAction("ORE_NODE_SET_MAX_GATHER_VALUE", OreNodeRef, OreNodeMaxGatherValue)
				ExecuteAction("UNIT_SET_TEAM", OreNodeRef, "PlyrCivilian/teamPlyrCivilian")
			else break end
		until(not EvaluateCondition("NAMED_NOT_DESTROYED", OreNodeRef))
	end
	for i=1,getn(OreNodeRefList),1 do
		ExecuteAction("UNIT_SET_TEAM", OreNodeRefList[i], "/team")
	end
end

function DisableSuperweapons()
    local BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}
    local Superweapon_Buildings = 
    { 
		"JapanSuperWeaponAdvanced", "JapanSuperWeapon", 
		"JapanSuperWeaponAdvancedEgg", "JapanSuperWeaponEgg", 
		"AlliedSuperWeaponAdvanced", "AlliedSuperWeapon", 
		"SovietSuperWeaponAdvanced", "SovietSuperWeapon"
    }
    for i=1,getn(Superweapon_Buildings),1 do
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<1st Human Player's Enemies>", Superweapon_Buildings[i], false);
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<1st Human Player's Allies>", Superweapon_Buildings[i], false);
        --ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", Superweapon_Buildings[i], BUILDABILITY_TYPE["NO"])
		--ExecuteAction("DISABLE_UI_BUILD_BUTTON", "Command_Construct" .. Superweapon_Buildings[i], 1)	
    end
end

function EnableCoOp()
	ExecuteAction("PLAYER_ALLOWED_TOBE_COOPAI", "<1st Human Player's Allies>", true)
	ExecuteAction("SET_COOP_AI_COMMAND_UI_ENABLED", true)
	ExecuteAction("PLAYER_SET_ALLY_BUILDABILITY", "<1st Human Player>", "<1st Human Player's Allies>", true)
	--ExecuteAction("PLAYER_TOGGLE_RESOURCE_SHARING", "<All Players>", true)
end

function CodeInjection()
	setcallhook()
	dofile("config.lua")
	DisableSuperweapons()
	EnableCoOp()
	--DebugMode()
	ChangeAllOreNodeMaxGatherValue()
	--ChangeAllOreNodeMaxGatherValueAndSpawnMultiOreNode()
end
setcallhook(CodeInjection)
]]


--------------------------------------------------------------------------
------------------------COLORIZE SELECTED UNIT----------------------------
--------------------------------------------------------------------------


function ColorUnit(ObjectRef, red, green, blue, alpha)
	if( ( red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255 ) or ( alpha and ( alpha < 0 or alpha > 255 ) ) ) then return nil end
	if alpha then ExecuteAction("NAMED_CUSTOM_COLOR", ObjectRef, tonumber(format("%.2X%.2X%.2X%.2X", red, green, blue, alpha),16))
	else ExecuteAction("NAMED_CUSTOM_COLOR", ObjectRef, tonumber(format("%.2X%.2X%.2X", red, green, blue),16)) end
end

function ColorizeSelectedUnit(R, G, B, A)
	ColorUnit(GetObjectStringRef(GetSelectedUnit()), floor((R*255)+0.5), floor((G*255)+0.5), floor((B*255)+0.5))
end


--------------------------------------------------------------------------
------------------------TOGGLE REVEAL MAP OPTION--------------------------
--------------------------------------------------------------------------

function ToggleRevealMap()
	if REVEALMAP == nil then REVEALMAP = false end
	if not REVEALMAP then 
		REVEALMAP = true
		if SAGE_GAME >= BFME1 then
			ExecuteAction("MAP_REVEAL_ALL_PERM", "<All Players>")		
		else
			ExecuteAction("MAP_REVEAL_ALL_PERM", "player0")		
		end
	else 
		REVEALMAP = false
		if SAGE_GAME >= BFME1 then
			ExecuteAction("MAP_REVEAL_ALL_UNDO_PERM", "<All Players>")	
		else
			ExecuteAction("MAP_REVEAL_ALL_UNDO_PERM", "player0")
		end
	end
end
--------------------------------------------------------------------------
------------------------GET TYPE OF SELECTED UNIT-------------------------
--------------------------------------------------------------------------

ObjectTypeHash = {
	["68593967"]="AlienBuzzerHive",["4005307538"]="AlienControlCenter",["4277513717"]="AlienDronePlatform",["4278029493"]="AlienGateway",["1790899068"]="AlienLightningSpike",["4105382990"]="AlienPhotonCannon",["3053741411"]="AlienPlasmaMissileBattery",["2459686593"]="AlienPortal",["2501601210"]="AlienReactor",["944677863"]="AlienRiftGenerator",["3809858739"]="AlienSignalTransmitter",["3249535276"]="AlienStatisChamber",["1113391268"]="AlienStormColumn",["1183416773"]="AlienWarpBeacon",
	["2907988778"]="GDIAABattery",["2199177120"]="GDIAirTower",["867437679"]="GDIArmory",["332753075"]="GDIBarracks",["2150169165"]="GDIBattleBase",["3781531209"]="GDICommandPost",["1963689327"]="GDIConstructionYard",["894742678"]="GDIGolumCannon",["4059391770"]="GDIIonCannonControl",["291376689"]="GDIMedicalBay",["596796102"]="GDIPowerPlant",["380136808"]="GDIRefinery",["2167863030"]="GDISpaceCommandUplink",["3439867302"]="GDITerraformingStation",["352599915"]="GDITiberiumSilo",["2596103596"]="GDIWarFactory",["1051033844"]="GDIWatchTower",
	["3514124163"]="NODConstructionYard",["1719459484"]="NODCrane",["1553745000"]="NODDisruptionTower",["580140829"]="NODDropZone",["1916828239"]="NODHandOfNOD",["3586535492"]="NODHangar",["3226449953"]="NODLaserCannon",["2395565189"]="NODLaserCannonSpawn",["798795912"]="NODMiniMCVOutpost",["3868904616"]="NODObelisk",["2758452353"]="NODOperationsCenter",["2738079400"]="NODPowerPlant",["3050468790"]="NODRefinery",["2182292141"]="NODRocketBunker",["4191971488"]="NODRocketBunkerSpawn",["4212397519"]="NODShredderTurret",["1314385739"]="NODShredderTurretHub",["3861967411"]="NODTechAssemblyPlant",["1670123888"]="NODTempleOfNOD",["2405528079"]="NODTiberiumLiquidationFacility",
	["3489768722"]="BlackHandConstructionYard",["700254408"]="BlackHandPowerPlant",["100072016"]="BlackHandRefinery",["1881126022"]="BlackHandHandOfNod",["744653454"]="BlackHandDropZone",["587542384"]="BlackHandOperationsCenter",["258129317"]="BlackHandSecretShrine",["1872037456"]="BlackHandTechAssemblyPlant",["2566151430"]="BlackHandShredderTurretHub",["842149963"]="BlackHandLaserCannon",["4122814948"]="BlackHandRocketBunker",["3169264583"]="BlackHandTiberiumSilo",["3616161493"]="BlackHandPropagandaTower",["2373507443"]="BlackHandTempleOfNOD",["3458227666"]="BlackHandTiberiumLiquidationFacility",["168221011"]="BlackHandCrane",["2102790892"]="BlackHandEmissary",
	["2240770736"]="MarkedOfKaneConstructionYard",["3186266847"]="MarkedOfKanePowerPlant",["1088200982"]="MarkedOfKaneRefinery",["3872699996"]="MarkedOfKaneDropZone",["3331955598"]="MarkedOfKaneOperationsCenter",["2386700586"]="MarkedOfKaneHangar",["2329896961"]="MarkedOfKaneSecretShrine",["4154127587"]="MarkedOfKaneTechAssemblyPlant",["3576851614"]="MarkedOfKaneTiberiumLiquidationFacility",["2170679445"]="MarkedOfKaneShredderTurretHub",["1070053604"]="MarkedOfKaneLaserCannon",["2639459287"]="MarkedOfKaneRocketBunker",["399887018"]="MarkedOfKaneTiberiumSilo",["2091770787"]="MarkedOfKaneDisruptionTower",["324108153"]="MarkedOfKanePropagandaTower",["2703520950"]="MarkedOfKaneTempleOfNOD",["1979182309"]="MarkedOfKaneAirSupport",["1733547210"]="MarkedOfKaneCrane",["3183713661"]="MarkedOfKaneEmissary",
	["3381940374"]="SteelTalonsConstructionYard",["3858223515"]="SteelTalonsPowerPlant",["1278094373"]="SteelTalonsRefinery",["882621777"]="SteelTalonsBarracks",["1084321921"]="SteelTalonsWarfactory",["694935703"]="SteelTalonsCommandPost",["4004273719"]="SteelTalonsAirTower",["1815125931"]="SteelTalonsTechCenter",["258215728"]="SteelTalonsSpaceCommandUplink",["1866269769"]="SteelTalonsWatchTower",["898545124"]="SteelTalonsGolumCannon",["1551902107"]="SteelTalonsAABattery",["745452156"]="SteelTalonsTiberiumSilo",["23350187"]="SteelTalonsIonCannonControl",["3747068994"]="SteelTalonsAirSupport",["4092691421"]="SteelTalonsSurveyor",
	["1801077552"]="ZOCOMConstructionYard",["887561926"]="ZOCOMPowerPlant",["3127011197"]="ZOCOMRefinery",["1357601015"]="ZOCOMBarracks",["2401382389"]="ZOCOMWarFactory",["3537949332"]="ZOCOMCommandPost",["4072220311"]="ZOCOMAirTower",["3882856207"]="ZOCOMArmory",["525661890"]="ZOCOMSpaceCommandUplink",["1345260202"]="ZOCOMWatchTower",["1647247595"]="ZOCOMGolumCannon",["4099523718"]="ZOCOMAABattery",["3536484668"]="ZOCOMTiberiumSilo",["144548681"]="ZOCOMTerraformingStation",["1067695218"]="ZOCOMIonCannonControl",["4136229536"]="ZOCOMAirSupport",["4253616897"]="ZOCOMSurveyor",
	["3923673017"]="Reaper17DronePlatform",["950315488"]="Reaper17Portal",["2593223505"]="Reaper17Gateway",["667107644"]="Reaper17BuzzerHive",["3130415049"]="Reaper17PhotonCannon",["265642851"]="Reaper17PlasmaMissileBattery",["3689489833"]="Reaper17GrowthStimulator",["4021609152"]="Reaper17ControlCenter",["1751309187"]="Reaper17StormColumn",["979676758"]="Reaper17WarpBeacon",["3945608163"]="Reaper17StasisChamber",["3755810217"]="Reaper17Reactor",["204938282"]="Reaper17SignalTransmitter",["2768470878"]="Reaper17RiftGenerator",["4092129615"]="Reaper17Explorer",
	["1045578362"]="Traveler59DronePlatform",["2906365133"]="Traveler59Portal",["1464056924"]="Traveler59Gateway",["3580113147"]="Traveler59BuzzerHive",["1789432218"]="Traveler59PhotonCannon",["945628840"]="Traveler59PlasmaMissileBattery",["1961941872"]="Traveler59ControlCenter",["1651080236"]="Traveler59StormColumn",["1900739263"]="Traveler59WarpBeacon",["1943362252"]="Traveler59StatisChamber",["2599918733"]="Traveler59Reactor",["1042838317"]="Traveler59SignalTransmitter",["1132033882"]="Traveler59RiftGenerator",["2357377132"]="Traveler59Explorer",
	["3805790263"]="AlienAnnihilatorTripod",["2861908637"]="AlienAssimilator",["2384886255"]="AlienBuzzers",["2007034025"]="AlienCorrupter",["1122195248"]="AlienDevastatorWarship",["2946044786"]="AlienDevourerTank",["1267973868"]="AlienExplorer",["27610139"]="AlienGunWalker",["350440930"]="AlienHarvester",["4127320940"]="AlienMastermind",["820198441"]="AlienMCV",["518911667"]="AlienMothership",["350932745"]="AlienPlanetaryAssaultCarrier",["731130064"]="AlienRazorDroneSquad",["3095406435"]="AlienSeekerTank",["1687549193"]="AlienShockTrooperSquad",["4142335957"]="AlienStormrider",
	["3491560840"]="GDIAPC",["3703068792"]="GDICommando",["1693375322"]="GDIEngineer",["3006676643"]="GDIFireHawk",["1116299360"]="GDIGrenadeSoldierSquad",["220562260"]="GDIHarvester",["843615794"]="GDIJuggernaught",["3154774089"]="GDIMammoth",["1385386646"]="GDIMCV",["4010955483"]="GDIMissileSoldierSquad",["3045524383"]="GDIOrca",["1878337544"]="GDIPitbull",["3874148396"]="GDIPredator",["2425788014"]="GDIRifleSoldierSquad",["3029069266"]="GDIRig",["3165874693"]="GDISniperSquad",["2451310284"]="GDISurveyor",["1566464305"]="GDIZoneTrooperSquad",
	["3144715221"]="NODAttackBike",["3154900504"]="NODAvatar",["1335753027"]="NODBeamCannon",["19442673"]="NODBlackHandSquad",["3672109216"]="NODCommando",["315538775"]="NODEmissary",["3195811997"]="NODFanaticSquad",["4253557425"]="NODFlameTank",["977080474"]="NODHarvester",["138622706"]="NODMCV",["2311346244"]="NODMilitantRocketSquad",["3157665146"]="NODMilitantSquad",["49877789"]="NODRaiderTank",["2740814684"]="NODSaboteur",["1666470685"]="NODScorpionBuggy",["2799763464"]="NODShadowSquad",["2511757"]="NODStealthTank",["2334830347"]="NODVenom",["1789238550"]="NODVertigo",
	["1257948904"]="SteelTalonsAAScout",["678291396"]="SteelTalonsAPC",["1393982803"]="SteelTalonsBehemoth",["2454939462"]="SteelTalonsBehemothHusk",["2162161113"]="SteelTalonsCombatEngineer",["323537418"]="SteelTalonsFirehawk",["3671849580"]="SteelTalonsHammerhead",["4113231583"]="SteelTalonsHeavyHarvester",["1448863781"]="SteelTalonsMARV",["1048504193"]="SteelTalonsMCV",["1809299627"]="SteelTalonsOrca",["207849440"]="SteelTalonsPitbull",["2093312067"]="SteelTalonsRepairAPC",["2195121624"]="SteelTalonsRig",["4092691421"]="SteelTalonsSurveyor",["1013465808"]="SteelTalonsTitan",["1547951759"]="SteelTalonsWolverine",["3781304154"]="SteelTalonsZoneTrooper",
	["1516258492"]="ZOCOMAAScout",["1690087686"]="ZOCOMAPC",["799347858"]="ZOCOMCommando",["9593062"]="ZOCOMEngineer",["1121278001"]="ZOCOMFirehawk",["4198989482"]="ZOCOMHammerhead",["3258661397"]="ZOCOMHarvester",["2926777231"]="ZOCOMImprovedSonicTank",["938518005"]="ZOCOMMARV",["856485008"]="ZOCOMMCV",["4205217600"]="ZOCOMOrca",["2908684823"]="ZOCOMPitbull",["1875583768"]="ZOCOMRig",["4253616897"]="ZOCOMSurveyor",
	["696000818"]="BlackHandAttackBike",["2136759514"]="BlackHandBeamCannon",["2801258734"]="BlackHandBlackHand",["428602625"]="BlackHandBunkerTruck",["1313610083"]="BlackHandCommando",["3583409476"]="BlackHandConfessor",["266270183"]="BlackHandConfessorSquad",["1014761723"]="BlackHandCustomWarmech",["3039749024"]="BlackHandFanatic",["505081534"]="BlackHandFlameTank",["560340475"]="BlackHandHarvester",["1533894628"]="BlackHandMCV",["3445248864"]="BlackHandMetaUnit",["3965962140"]="BlackHandMilitantRocketSuqad",["2053347994"]="BlackHandMobileArtillery",["673845731"]="BlackHandSaboteur",["4085650877"]="BlackHandStealthTank",["1024735831"]="MarkedOfKaneBeamCannon",
	["805339674"]="MarkedOfKaneBunkerTruck",["1080857772"]="MarkedOfKaneCommando",["2946093985"]="MarkedOfKaneFanaticSquad",["3279444990"]="MarkedOfKaneHarvester",["3355984486"]="MarkedOfKaneImprovedCyborgInfantrySquad",["3011801859"]="MarkedOfKaneMCV",["1897535711"]="MarkedOfKaneMetaUnit",["3012487848"]="MarkedOfKaneMilitantRocketSuqad",["2589147079"]="MarkedOfKaneMobileArtillery",["2795684308"]="MarkedOfKaneSaboteur",["1334603167"]="MarkedOfKaneShadow",["270907659"]="MarkedOfKaneStealthTank",["602416393"]="MarkedOfKaneVenom",["960382060"]="MarkedOfKaneVertigo",
	["1306091781"]="Reaper17AnnihilatorTripod",["2362841443"]="Reaper17AnnihilatorTripodHusk",["2978478202"]="Reaper17Corrupter",["1097793023"]="Reaper17DevourerTank",["342632592"]="Reaper17EradicatorHexapod",["4092129615"]="Reaper17Explorer",["3279909415"]="Reaper17Harvester",["4006428288"]="Reaper17MCV",["2144140771"]="Reaper17ShardWalker",["1609077176"]="Reaper17ShockTrooper",["2817508979"]="Reaper17Stalker",["502803990"]="Reaper17Stormrider",
	["1955351586"]="Traveler59AnnihilatorTripod",["3755881343"]="Traveler59Assimilator",["1602225375"]="Traveler59BlinkMastermind",["2444605085"]="Traveler59Corrupter",["3090055454"]="Traveler59Cultist",["2975757644"]="Traveler59DevastatorWarship",["2768054299"]="Traveler59EradicatorHexapod",["2357377132"]="Traveler59Explorer",["1363345491"]="Traveler59GunWalker",["2575537599"]="Traveler59Harvester",["690860851"]="Traveler59MCV",["259097660"]="Traveler59PlanetaryAssaultCarrier",["1922468124"]="Traveler59SeekerTank",["1499625309"]="Traveler59ShockTrooper",["1439301044"]="Traveler59Stalker",["3969942881"]="Traveler59Stormrider",
	["105176262"]="GDIOrcaSensorPod",["1847717182"]="GuardShieldEmitter",["3940261646"]="MetaTechMCV",["903497890"]="MetaTechSuperAvatar",["2566837260"]="MetaTechBarracks",["3017582790"]="MetaTechCommandPost",["1719454038"]="MetaTechConstructionYard",["2402772029"]="MetaTechHangar",["3309625077"]="MetaTechMedicalBay",["3629233383"]="MetaTechReclamatorHub",["125384694"]="MetaTechTechCenter",["128886932"]="MetaTechWarFactory"
}

RelevantObjectTypeTable={ 
	"AlienBuzzerHive","AlienControlCenter","AlienDronePlatform","AlienFoundry","AlienGateway","AlienLightningSpike","AlienPhotonCannon","AlienPlasmaMissileBattery","AlienPortal","AlienPowerProjector","AlienReactor","AlienRiftGenerator","AlienSignalTransmitter","AlienSporePod","AlienStatisChamber","AlienStormColumn","AlienTiberiumTower","AlienWarpBeacon","MG_Alien_Hive","AlienMiniMCVOutpost",
	"GDIAABattery","GDIMiniMCVOutpost","GDIDigInBuilding","GDIAirTower","GDIArmory","GDIBarracks","GDIBattleBase","GDICommandPost","GDIConstructionYard","GDICrane","GDIGolumCannon","GDIIonCannonControl","GDIMedicalBay","GDIMiniMCVOutpost","GDIPowerPlant","GDIRefinery","GDISpaceCommandUplink","GDITerraformingStation","GDITiberiumSilo","GDIWarFactory","GDIWatchTower","MG_GDI_ReclamatorHub",
	"NODConstructionYard","NODMiniMCVOutpost","NODCrane","NODDisruptionTower","NODDropZone","NODHandOfNOD","NODHangar","NODLaserCannon","NODLaserCannonSpawn","NODMiniMCVOutpost","NODObelisk","NODOperationsCenter","NODPowerPlant","NODRefinery","NODRocketBunker","NODRocketBunkerSpawn","NODShredderTurret","NODShredderTurretHub","NODTechAssemblyPlant","NODTempleOfNOD","NODTiberiumLiquidationFacility","MG_Nod_WarmechFacility",
	"BlackHandConstructionYard","BlackHandMiniMCVOutpost","BlackHandPowerPlant","BlackHandRefinery","BlackHandHandOfNod","BlackHandDropZone","BlackHandOperationsCenter","BlackHandSecretShrine","BlackHandTechAssemblyPlant","BlackHandShredderTurretHub","BlackHandLaserCannon","BlackHandRocketBunker","BlackHandTiberiumSilo","BlackHandPropagandaTower","BlackHandObelisk","BlackHandTempleOfNOD","BlackHandTiberiumLiquidationFacility","BlackHandCrane","BlackHandEmissary","MG_BlackHand_WarmechFacility",
	"MarkedOfKaneConstructionYard","MarkedOfKaneMiniMCVOutpost","MarkedOfKanePowerPlant","MarkedOfKaneRefinery","MarkedOfKaneHandOfNod","MarkedOfKaneDropZone","MarkedOfKaneOperationsCenter","MarkedOfKaneHangar","MarkedOfKaneSecretShrine","MarkedOfKaneTechAssemblyPlant","MarkedOfKaneTiberiumLiquidationFacility","MarkedOfKaneShredderTurretHub","MarkedOfKaneLaserCannon","MarkedOfKaneRocketBunker","MarkedOfKaneTiberiumSilo","MarkedOfKaneDisruptionTower","MarkedOfKanePropagandaTower","MarkedOfKaneObelisk","MarkedOfKaneTempleOfNOD","MarkedOfKaneAirSupport","MarkedOfKaneCrane","MG_MarkedOfKane_WarmechFacility","MarkedOfKaneEmissary",
	"SteelTalonsConstructionYard","SteelTalonsMiniMCVOutpost","SteelTalonsPowerPlant","SteelTalonsRefinery","SteelTalonsBarracks","SteelTalonsWarfactory","SteelTalonsCommandPost","SteelTalonsAirTower","SteelTalonsTechCenter","SteelTalonsSpaceCommandUplink","MG_SteelTalons_ReclamatorHub","SteelTalonsWatchTower","SteelTalonsGolumCannon","SteelTalonsAABattery","SteelTalonsTiberiumSilo","SteelTalonsIonCannonControl","SteelTalonsCrane","SteelTalonsAirSupport","SteelTalonsSurveyor",
	"ZOCOMConstructionYard","ZOCOMMiniMCVOutpost","ZOCOMPowerPlant","ZOCOMRefinery","ZOCOMBarracks","ZOCOMWarFactory","ZOCOMCommandPost","ZOCOMAirTower","ZOCOMMedicalBay","ZOCOMArmory","ZOCOMSpaceCommandUplink","MG_ZOCOM_ReclamatorHub","ZOCOMWatchTower","ZOCOMGolumCannon","ZOCOMAABattery","ZOCOMTiberiumSilo","ZOCOMTerraformingStation","ZOCOMIonCannonControl","ZOCOMCrane","ZOCOMAirSupport","ZOCOMSurveyor",
	"Reaper17DronePlatform","Reaper17MiniMCVOutpost","Reaper17PowerProjector","Reaper17TiberiumTower","Reaper17Portal","Reaper17Gateway","Reaper17BuzzerHive","Reaper17PhotonCannon","Reaper17PlasmaMissileBattery","Reaper17GrowthStimulator","Reaper17ControlCenter","Reaper17StormColumn","Reaper17WarpBeacon","Reaper17StasisChamber","Reaper17Reactor","Reaper17SignalTransmitter","Reaper17RiftGenerator","Reaper17Explorer","Reaper17Foundry","MG_Reaper17_Hive",
	"Traveler59DronePlatform","Traveler59MiniMCVOutpost","Traveler59PowerProjector","Traveler59TiberiumTower","Traveler59Portal","Traveler59Gateway","Traveler59BuzzerHive","Traveler59PhotonCannon","Traveler59PlasmaMissileBattery","Traveler59SporePod","Traveler59ControlCenter","Traveler59StormColumn","Traveler59WarpBeacon","Traveler59StatisChamber","Traveler59Reactor","Traveler59SignalTransmitter","Traveler59RiftGenerator","Traveler59Explorer","Traveler59Foundry","MG_Traveler59_Hive",
	"AlienAnnihilatorTripod","AlienAssimilator","AlienBuzzers","AlienCorrupter","AlienDevastatorWarship","AlienDevourerTank","AlienExplorer","AlienGunWalker","AlienHarvester","AlienMastermind","AlienMCV","AlienMothership","AlienPlanetaryAssaultCarrier","AlienRazorDroneSquad","AlienSeekerTank","AlienShockTrooperSquad","AlienStormrider","AlienRazorDrones",
	"GDIAPC","GDICommando","GDIEngineer","GDIFireHawk","GDIGrenadeSoldierSquad","GDIHarvester","GDIJuggernaught","GDIMammoth","GDIMCV","GDIMissileSoldierSquad","GDIOrca","GDIPitbull","GDIPredator","GDIRifleSoldierSquad","GDIRig","GDISniperSquad","GDISurveyor","GDIZoneTrooperSquad","GDISniper","GDIRifleSoldier","GDIMissileSoldier","GDIZoneTrooper","GDIZoneTrooperSquad_Veteran","GDIMissileSoldierSquad_Veteran","GDIRifleSoldierSquad_Veteran","GDISniperSquad_Vetereran","GDIAPC_Veteran","GDIPitbull_Veteran",
	"NODAttackBike","NODAvatar","NODBeamCannon","NODBlackHandSquad","NODCommando","NODEmissary","NODFanaticSquad","NODFlameTank","NODHarvester","NODMCV","NODMilitantRocketSquad","NODMilitantSquad","NODRaiderTank","NODSaboteur","NODScorpionBuggy","NODShadowSquad","NODStealthTank","NODVenom","NODVertigo","NodShadow","NodMilitant","NodMilitantB","NodMilitantRocket","NodShadowSquad_Veteran",
	"SteelTalonsAAScout","SteelTalonsAPC","SteelTalonsBehemoth","SteelTalonsBehemothHusk","SteelTalonsCombatEngineer","SteelTalonsFirehawk","SteelTalonsBattleBase","SteelTalonsGrenadeSoldierSquad","SteelTalonsHammerhead","SteelTalonsHeavyHarvester","SteelTalonsMammoth","SteelTalonsMARV","SteelTalonsMCV","SteelTalonsMissileSoldierSquad","SteelTalonsOrca","SteelTalonsPitbull","SteelTalonsPredator","SteelTalonsRepairAPC","SteelTalonsRifleSoldierSquad","SteelTalonsRig","SteelTalonsSurveyor","SteelTalonsTitan","SteelTalonsWolverine","SteelTalonsZoneTrooper","SteelTalonsRifleSoldier","SteelTalonsMissileSoldier","SteelTalonsZoneTrooper","SteelTalonsRifleSoldierSquad_Veteran","SteelTalonsMissileSoldierSquad_Veteran","SteelTalonsZoneTrooperSquad_Veteran","SteelTalonsAPC_Veteran","SteelTalonsWolverine_Veteran","SteelTalonsPitbull_Veteran","SteelTalonsRepairAPC_Veteran",
	"ZOCOMAAScout","ZOCOMAPC","ZOCOMCommando","ZOCOMEngineer","ZOCOMFirehawk","ZOCOMBattleBase","ZOCOMGrenadierSoldierSquad","ZOCOMHammerhead","ZOCOMHarvester","ZOCOMImprovedSonicTank","ZOCOMMammoth","ZOCOMMARV","ZOCOMMCV","ZOCOMMissileSoldierSquad","ZOCOMOrca","ZOCOMPitbull","ZOCOMPredator","ZOCOMRifleSoldierSquad","ZOCOMRig","ZOCOMSniperSquad","ZOCOMSurveyor","ZOCOMRifleSoldier","ZOCOMSniper","ZOCOMMissileSoldier","ZOCOMZoneRaider","ZOCOMRifleSoldierSquad_Veteran","ZOCOMMissileSoldierSquad_Veteran","ZOCOMZoneRaiderSquad_Veteran","ZOCOMSniperSquad_Vetereran","ZOCOMAPC_Veteran","ZOCOMPitbull_Veteran",
	"BlackHandAttackBike","BlackHandBeamCannon","BlackHandBlackHand","BlackHandBunkerTruck","BlackHandCommando","BlackHandConfessor","BlackHandConfessorSquad","BlackHandCustomWarmech","BlackHandFanatic","BlackHandFlameTank","BlackHandHarvester","BlackHandMCV","BlackHandMetaUnit","BlackHandMilitantSquad","BlackHandMilitantRocketSuqad","BlackHandMobileArtillery","BlackHandMobileArtilleryBombard","BlackHandCustomWarmechHusk","BlackHandRaiderBuggy","BlackHandSaboteur","BlackHandRaiderTank","BlackHandStealthTank","BlackHandMilitantRocket","BlackHandMilitant","BlackHandMilitantB",
	"MarkedOfKaneAvatar","MarkedOfKaneAvatarHusk","MarkedOfKaneBeamCannon","MarkedOfKaneBunkerTruck","MarkedOfKaneCommando","MarkedOfKaneFanaticSquad","MarkedOfKaneHarvester","MarkedOfKaneImprovedCyborgInfantrySquad","MarkedOfKaneMCV","MarkedOfKaneMetaUnit","MarkedOfKaneMilitantSquad","MarkedOfKaneMilitantRocketSuqad","MarkedOfKaneMobileArtillery","MarkedOfKaneRaiderScorpionBuggy","MarkedOfKaneSaboteur","MarkedOfKaneRaiderTank","MarkedOfKaneShadow","MarkedOfKaneStealthTank","MarkedOfKaneVenom","MarkedOfKaneVertigo","MarkedOfKaneShadow","MarkedOfKaneMilitantRocket","MarkedOfKaneTibTrooperSquad","MarkedOfKaneImprovedCyborgInfantry","MarkedOfKaneFanatic",
	"Reaper17AnnihilatorTripod","Reaper17AnnihilatorTripodHusk","Reaper17Corrupter","Reaper17DevourerTank","Reaper17EradicatorHexapod","Reaper17Explorer","Reaper17Harvester","Reaper17MCV","Reaper17ShardWalker","Reaper17ShockTrooper","Reaper17Stalker","Reaper17Stormrider",
	"Traveler59AnnihilatorTripod","Traveler59Assimilator","Traveler59BlinkMastermind","Traveler59Corrupter","Traveler59Cultist","Traveler59DevastatorWarship","Traveler59EradicatorHexapod","Traveler59Explorer","Traveler59GunWalker","Traveler59Harvester","Traveler59MCV","Traveler59PlanetaryAssaultCarrier","Traveler59RazorDroneSquad","Traveler59SeekerTank","Traveler59ShockTrooper","Traveler59Stalker","Traveler59Stormrider","Traveler59RazorDrone",
	"GDIDropPod","GDIOrcaSensorPod","BlackHandCommandoBeacon",
	"GuardShieldEmitter","MetaTechMCV","MetaTechSuperAvatar","MetaTechBarracks","MetaTechCommandPost","MetaTechConstructionYard","MetaTechCrane","MetaTechHangar","MetaTechMedicalBay","MetaTechReclamatorHub","MetaTechTechCenter","MetaTechWarFactory"
}

function GetObjectType_(object)
	if type(object) == "string" then object = GetObjectLuaRef(object) end
	local ObjectType = ObjectTemplateName(object)
	if not strfind(ObjectType, "{") or strfind(ObjectType, "<<INVALID ID>>") then return ObjectType
	else return ObjectTypeHash[tostring(tonumber(strsub(ObjectTemplateName(object), 6,  13), 16))] end
end

function GetSelectedUnitZH()
	for k,v in globals() do
	    if strfind(k,"ObjID") then
			local UnitName = "object_" .. tostring(random(9999999))
			ObjectSetReference(v,UnitName)
			if EvaluateCondition("NAMED_SELECTED", UnitName) then
				print(v[1])
				return v,UnitName
			end
		end
	end
end

function GetSelectedUnit()
	for k,v in globals() do
	    if strfind(k,"ObjID") and ObjectTestModelCondition(v,"SELECTED") then
			return v
		end
	end
end

function GetTypeOfSelectedUnit()
	LUAAPITRANSFER = GetObjectType(GetSelectedUnit())
end

--------------------------------------------------------------------------
------------------------CNCZH COMPAT--------------------------------------
--------------------------------------------------------------------------

function GetRandomNumberZH(...)
	local RandomNumber = function(a,b) return floor(a+((b-a)*GetRandomNumber())+0.5) end
	if getn(arg) == 0 then return floor(GetRandomNumber()+0.5)
		elseif getn(arg) == 1 then return RandomNumber(1,arg[1])
		elseif getn(arg) == 2 then return RandomNumber(arg[1],arg[2])
	else return arg[RandomNumber(1,getn(arg))] end
end  

--------------------------------------------------------------------------
------------------------TIMERS AND COROUTINES-----------------------------
--------------------------------------------------------------------------

ScriptTimerTable = {}

function SetScriptTimer(time,action,loops) --loops = -1 for infinite loops
	if getn(ScriptTimerTable) <= 0 then
		ScriptTimerTable = {}
	end
	if not loops then
		loops = 1
	end
	tinsert(ScriptTimerTable, {["time"]=floor(time), ["starttime"]=floor(time), ["action"]=action, ["loops"]=loops})
end

function ScriptTimerTest()
	if getn(ScriptTimerTable) == 0 then return end
	local i = 1
	local increment = true
	while (i <= getn(ScriptTimerTable)) do
		if ScriptTimerTable[i] then
			if ScriptTimerTable[i]["time"] == 0 then 
				if type(ScriptTimerTable[i]["action"]) == "string" then 
					dostring(ScriptTimerTable[i]["action"])
				else
					ScriptTimerTable[i]["action"]() 
				end
				if i <= getn(ScriptTimerTable) and ScriptTimerTable[i] then
					if ScriptTimerTable[i]["loops"] ~= -1 then 
						ScriptTimerTable[i]["loops"] = ScriptTimerTable[i]["loops"] - 1 
					end
					if ScriptTimerTable[i]["loops"] == 0 then 
						tremove(ScriptTimerTable, i) 
						increment = false
					else 
						ScriptTimerTable[i]["time"] = ScriptTimerTable[i]["starttime"] 
						increment = true
					end 
				else
					increment = false
				end
			else 
				ScriptTimerTable[i]["time"] = ScriptTimerTable[i]["time"] - 1 
				increment = true 
			end
		else 
			increment = true
		end
		if increment then
			i = i + 1
		else
			increment = true
		end
	end
end

ScriptTimerTableFast = {}

ScriptTimerFastActive = false

function SetScriptTimerFast(time,action,loops)   --loops = 0 or -1 = infinite loops
	local size = getn(ScriptTimerTableFast)+1
	if size == 1 then ScriptTimerTableFast = {}
	else ScriptTimerTableFast['n']=getn(ScriptTimerTableFast)+1 end
	ScriptTimerTableFast[size]={} 
	tinsert(ScriptTimerTableFast[size],"time")
	ScriptTimerTableFast[size]["time"]=time
	ScriptTimerTableFast[size]["starttime"]=ScriptTimerTableFast[size]["time"]
	ScriptTimerTableFast[size]["action"]=action
	if loops ~= nil then ScriptTimerTableFast[size]["loops"]=loops
	else ScriptTimerTableFast[size]["loops"]=1 end
	--tinsert(ScriptTimerTableFast,action)
	if not ScriptTimerFastActive then
		ScriptTimerFastActive = true
		StartScriptTimerFast()
	end
end

function ScriptTimerFastTest()
	if getn(ScriptTimerTableFast) == 0 then 
		ScriptTimerFastActive = false
		StopScriptTimerFast()
		return 
	end
	local i = 1
	while (i <= getn(ScriptTimerTableFast)) do
		if ScriptTimerTableFast[i] ~= nil then
			if ScriptTimerTableFast[i]["time"] <= 0 then 
				if type(ScriptTimerTableFast[i]["action"])=="string" then dostring(ScriptTimerTableFast[i]["action"])
				else ScriptTimerTableFast[i]["action"]() end 
				if ScriptTimerTableFast[i]["loops"] ~= -1 then ScriptTimerTableFast[i]["loops"]=ScriptTimerTableFast[i]["loops"]-1 end
				if ScriptTimerTableFast[i]["loops"] == 0 then tremove(ScriptTimerTableFast,i)
					else 
					ScriptTimerTableFast[i]["time"]=ScriptTimerTableFast[i]["starttime"] 
					i=i+1
				end 	  
				else 
				ScriptTimerTableFast[i]["time"]=ScriptTimerTableFast[i]["time"]-0.01 
				i=i+1	  
			end   
		else i=i+1 end	
	end
end

TimerTable = {}

function SetTimerCounter(value, text, counter)
	if not counter then 
		counter = "counter_" .. floor(GetRandomNumber()*99999999+0.5) 
	end
	if not text then
		text = "APT:Time"
	end
	-- if getn(TimerTable) <= 0 then
		-- SetScriptTimer(1,TimerCounterRefresh,-1)
	-- end
	tinsert(TimerTable, {["counter"] = counter, ["value"] = value})
	SetCounter(counter, value, text)
	ExecuteAction("DISPLAY_COUNTER", counter, text)
end

function TimerCounterRefresh()
	if getn(TimerTable) <= 0 then return end
	local CurTimer = 1
	local NumTimers = getn(TimerTable)
	while CurTimer <= NumTimers do
		local value = TimerTable[CurTimer]["value"]
		local counter = TimerTable[CurTimer]["counter"]
		if value <= 0 then 
			ExecuteAction("HIDE_COUNTER", counter) 
			tremove(TimerTable, CurTimer)
			NumTimers = NumTimers - 1
			if NumTimers <= 0 then
				--DeleteScriptTimerAction(TimerCounterRefresh) 
				break
			end		
		elseif value == 1201 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerMin[20])
		elseif value == 901 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerMin[15])
		elseif value == 601 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerMin[10])
		elseif value == 301 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerMin[5])
		elseif value == 181 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerMin[3])
		elseif value == 61 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerMin[1])
		elseif value == 31 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerSec[30])
		elseif value == 11 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerSec[10])
		elseif value == 4 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerCount[3])		  
		elseif value == 3 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerCount[2])	
		elseif value == 2 then 
			ExecuteAction("PLAY_SOUND_EFFECT", VoiceTimerCount[1])    
		end
		ExecuteAction("COUNTER_MATH_COUNTER", counter, MathOpTable["Subtract"], CounterTable[1])
		TimerTable[CurTimer]["value"] = TimerTable[CurTimer]["value"] - 1
		CurTimer = CurTimer + 1
	end
end

Coroutines = {}

function AddCoroutine(coroutine_func)
	tinsert(Coroutines, coroutine_func)
end

function MasterCoroutine()
	if getn(Coroutines) > 0 then
		for i=1,getn(Coroutines),1 do
			Coroutines[i]()
		end
	end
	ScriptTimerTest()
	TimerCounterRefresh()
end

--------------------------------------------------------------------------
------------------------META MOD COMPAT LAYER-----------------------------
--------------------------------------------------------------------------

AddCoroutine(MainCoroutine)

function GetPlayerSpellBook()
	if not PLAYERSPELLBOOK then
		for k,v in globals() do
			if strfind(k,"ObjID") and ObjectDescription(v,"PlayerSpellBook") and not strfind(ObjectTeamName(v), "Skirmish") then
				PLAYERSPELLBOOK = v
				return PLAYERSPELLBOOK;
			end
		end
	end
end

function SpawnAtPosition(ObjectType,team,x,y,z,ObjectRef,orientation,Waypoint,numbercount,fast,ActionOnObject)
	if ObjectRef==nil or ObjectRef=="0" or ObjectRef==0 then ObjectRef = "object_" .. floor(99999999*GetRandomNumber()) end
	if z==nil or z=="0" or z==0 then z=0 end
	if x==nil or x=="0" or x==0 then x=0 end
	if y==nil or y=="0" or y==0 then y=0 end
	if orientation==nil or orientation=="0" or orientation==0 then orientation=0 end
	if numbercount==nil or numbercount=="0" or numbercount==0 then numbercount=1 end
	if Waypoint==nil or Waypoint=="0" or Waypoint==0 then Waypoint="0"
	else spawn(ObjectType,team,numbercount,ObjectRef,Waypoint,ActionOnObject) end
	for i=1,numbercount,1 do
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",ObjectRef,ObjectType,team,{x,y,z},orientation)
		if ActionOnObject then ActionOnObject(ObjectRef) end
		if numbercount>1 then ObjectRef = "object_" .. floor(99999999*GetRandomNumber()) end
	end
	return ObjectRef
end

--GlobalTeamTable = GetValidTeamList()
--AdminTeamName=GlobalTeamTable[1]

-- alliance Table
-- victory condition helper
-- script TIMERS


CheatAndTestDummys={
	"GenericDummy","GenericDummyNull","GenericDummyStay","GenericDummyEffect",
	"InfiniteEnergyDummy","InfiniteTiberiumRegeneration","BuildAnywhereDummy","InfiniteProductionSpeedDummy","MetaControlDummyFreezeGame",
	"MetaControlDummyEnemyAIOFF","MetaControlDummyEveryAIOFF","MetaControlDummyMoney5k","MetaControlDummyMapRevealer",
	"VictoryConditionHelper","NAODTeamReferenceDummy"
}

MetaModObjects={
	"MetaControlDummyMainTabMenu","MetaCreditShop","MetaControlDummyDiplomacyTabMenu",
	"MetaControlDummyMain","MetaControlDummyGlobalDeactivator","MetaControlDummyMainTabMenuPlayerPower","MetaControlDummyActivator"
}

--GetObjectDistance = ObjectGetDistance

--------------------------------------------------------------------------
------------------------MISC----------------------------------------------
--------------------------------------------------------------------------

function PrintInfoAllObjects()
	for ObjectID,Object in globals() do
		if strfind(ObjectID,"ObjID") and ObjectDescription(Object) ~= "<No Object>" then
			print(ObjectGetThingTemplateName(Object) .. " | " .. ObjectDescription(Object))
		end
	end
end

function GetObjectInfo(Object)
	local Info = ""
	Info = Info .. GetObjectType(Object) .. " | "
	Info = Info .. ObjectDescription(Object) .. " | "
	Info = Info .. ObjectTeamName(Object) .. " | "
	Info = Info .. ObjectTemplateName(Object) .. " | "
	Info = Info .. ObjectPlayerSide(Object)
	Info = Info .. "\n\t MODEL CONDITIONS: " .. GetModelConditionList(Object)
	Info = Info .. "\n\t OBJECT STATUS: " .. GetObjectStatusList(Object)
	return Info
end

function PrintInfoObject()
	for ObjectID,Object in globals() do
	    if strfind(ObjectID,"ObjID") and ObjectTestModelCondition(Object,"SELECTED") then
			print(GetObjectInfo(Object))
		end
	end
	if selection then
		print(GetObjectInfo(selection))
	end
end

function PrintInfoAllObjectsFULL()
	for ObjectID,Object in globals() do
	    if strfind(ObjectID,"ObjID") then
			print(GetObjectInfo(Object))
		end
	end
end

function SetSelectedUnit()
	selection = GetSelectedUnitFlash(1)
	sel = selection
	selection_ = GetObjectStringRef(selection)
	sel_ = selection_
	print(GetObjectInfo(selection))
end

function InitHashList()
	OBJECT_LIST = {}
	for i=1,getn(CNC3KW_OBJECTS),1 do
		OBJECT_LIST[tostring(GetHash(CNC3KW_OBJECTS[i]))]=CNC3KW_OBJECTS[i]
	end
end

function GetObjectType_(object)
	if not INIT_HASH_LIST then 
		InitHashList()
		INIT_HASH_LIST = true
	end
	if type(object) == "string" then object = GetObjectLuaRef(object) end
	local ObjectType = ObjectTemplateName(object)
	if not strfind(ObjectType, "{") or strfind(ObjectType, "<<INVALID ID>>") then return ObjectType
	else return OBJECT_LIST[tostring(tonumber(strsub(ObjectTemplateName(object), 6,  13), 16))] end
	return "UnknownObjType"
end

function GetObjectStatusList(object)
	local StatusList = ""
	local ObjectName = GetObjectStringRef(object)
	for i=0,getn(ObjectStatusIndexTable)-1,1 do
		if EvaluateCondition("UNIT_HAS_OBJECT_STATUS", ObjectName, ObjectStatusTable[ObjectStatusIndexTable[i+1]]) then
			StatusList = StatusList .. ObjectStatusIndexTable[i+1] .. " | "
		end
	end
	return StatusList
end

function GetModelConditionList(object)
	local ModelConditionList = ""
	local LuaRef = GetObjectLuaRef(object)
	for i=1,getn(ModelConditionTable),1 do
		if ObjectTestModelCondition(LuaRef,ModelConditionTable[i]) then
			ModelConditionList = ModelConditionList .. ModelConditionTable[i] .. " | "
		end
	end
	return ModelConditionList
end

function WeaponAtPosition(Weapon,PosX,PosY)
	local LocationName = GetUnitName()
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", LocationName, MAIN_ANCHOR, NeutralTeam, {PosX, PosY, MapSizeZ}, 0)
	ObjectCreateAndFireTempWeapon(GetObjectLuaRef(LocationName), Weapon)
	ExecuteAction("NAMED_DELETE", LocationName)
end

function StartAI(PLAYER)
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
end

function ToggleFreezePlayer(player)
	if not FREEZE_STATE then
		FREEZE_STATE = {}
		for i=1,getn(Teams),1 do
			FREEZE_STATE[Teams[i]] = false
		end
	end
	local team = GetTeamByPlayer(player)
	if not FREEZE_STATE[team] then
		FREEZE_STATE[Teams[i]] = true
		if SAGE_GAME >= CNCRA3 then
			local DISABLED_TYPE = { "EMP", "FROZEN", "HELD","PARALYZED", "STASIS_FIELD", "USER_PARALYZED" }
			for i=1,getn(DISABLED_TYPE),1 do
				ExecuteAction("TEAM_SET_DISABLED", team, DISABLED_TYPE[i], 1)
			end
		end
		local status = {"NO_ATTACK","UNSELECTABLE","NO_COLLISIONS","UNATTACKABLE","CANNOT_BE_SOLD","IN_STASIS","IGNORE_AI_COMMAND","USER_PARALYZED","POWERED_DOWN_EMP","TEMPORARILY_DEFECTED"}
		for i=1,getn(status),1 do
			ExecuteAction("TEAM_CHANGE_OBJECT_STATUS", team, status[i], 1)
		end
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Enabled", 0) 		  
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Indestructible", 1)	 
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Selectable", 0)	
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Player Targetable", 0)	
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Unsellable", 1)
		ExecuteAction("TEAM_SET_SLEEP_STATUS", team, 1)
	else
		FREEZE_STATE[Teams[i]] = false
		if SAGE_GAME >= CNCRA3 then
			local DISABLED_TYPE = { "EMP", "FROZEN", "HELD","PARALYZED", "STASIS_FIELD", "USER_PARALYZED" }
			for i=1,getn(DISABLED_TYPE),1 do
				ExecuteAction("TEAM_SET_DISABLED", team, DISABLED_TYPE[i], 0)
			end
		end
		local status = {"NO_ATTACK","UNSELECTABLE","NO_COLLISIONS","UNATTACKABLE","CANNOT_BE_SOLD","IN_STASIS","IGNORE_AI_COMMAND","USER_PARALYZED","POWERED_DOWN_EMP","TEMPORARILY_DEFECTED"}
		for i=1,getn(status),1 do
			ExecuteAction("TEAM_CHANGE_OBJECT_STATUS", team, status[i], 0)
		end
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Enabled", 1) 		  
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Indestructible", 0)	 
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Selectable", 1)	
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Player Targetable", 1)	
		ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", team, "Unsellable",0)
		ExecuteAction("TEAM_SET_SLEEP_STATUS", team, 0)	
	end
end

function CountTeamsKindOf(team, kindof)  --by bisection method
	local kindofbyte = GetKindOf(kindof)
	local lower, upper, middle
	upper=1
	while not EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, upper, kindofbyte) do
		upper=upper*10
	end
	while EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, floor(upper/2), kindofbyte) do
		upper=floor(upper/2)
	end
    lower=floor(upper/2)
	while (upper-lower)>1 do 
		middle=(upper+lower)/2
		if EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, ceil(middle), kindofbyte) then 
			upper=ceil(middle)
		else 
			lower=floor(middle) 
		end
	end   
	middle=ceil((upper+lower)/2)
	if EvaluateCondition("TEAM_HAS_FEWER_THAN_X_UNITS_WITH_KINDOF", team, middle, kindofbyte) then 
		return lower
	else 
		return upper 
	end
end

function GetHealth(unit)
    local CompareTable = { ["<"]=0, ["<="]=1, ["=="]=2, [">="]=3, [">"]=4, ["~="]=5 }
    for i=1,101,1 do    
        if EvaluateCondition("UNIT_HEALTH", unit, CompareTable["<"], i) then 
            return i-1 
        end
    end
    return 0
end

function InitWaypoints()
	Waypoint = {"Player_1_Start","Player_2_Start","Player_3_Start","Player_4_Start","Player_5_Start","Player_6_Start","Player_7_Start","Player_8_Start","InitialCameraPosition","Waypoint 1","Waypoint 2","Waypoint 3","Waypoint 4","Waypoint 5","Waypoint 6","Waypoint 7","METAMOD_NAOD_SPAWN_WAYPOINT","METAMOD_NAOD_SPAWN_WAYPOINT_OPTIONAL","METAMOD_NAOD_WAYPOINT_PATH_START","METAMOD_NAOD_WAYPOINT_PATH"}
	WaypointPosition = {}
	WaypointValid = {}
	local WaypointObjects = {}
	local ObjectRef = ""
	for i=1,getn(Waypoint),1 do
		ObjectRef = Waypoint[i] .. "_object"
		ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", ObjectRef, GENERIC_DUMMY, NeutralTeam, Waypoint[i])
		if EvaluateCondition("NAMED_CREATED", ObjectRef) then 
			tinsert(WaypointValid, Waypoint[i])
			tinsert(WaypointObjects, ObjectRef)
		end
	end
	Waypoint = WaypointValid
	--create waypoint to waypoint distance table:
	WaypointDistance = {}
	local CreateDistanceTable = function()
		local distance = 0
		for i=1,getn(Waypoint),1 do 
			WaypointDistance[Waypoint[i]]={} 
		end
		for i=1,getn(Waypoint),1 do
			local x,y,z = ObjectGetPosition(GetObjectLuaRef(Waypoint[i] .. "_object"))
			WaypointPosition[Waypoint[i]] = {["x"]=x,["y"]=y,["z"]=z}
			for j=1,getn(Waypoint),1 do
				if i == j then 
					WaypointDistance[Waypoint[i]][Waypoint[j]]=0 
				else 
					distance = ObjectGetDistance(GetObjectLuaRef(Waypoint[i] .. "_object"), GetObjectLuaRef(Waypoint[j] .. "_object")) 
					WaypointDistance[Waypoint[i]][Waypoint[j]] = distance 
					WaypointDistance[Waypoint[j]][Waypoint[i]] = distance
				end  
			end
		end
		for i=1,getn(%WaypointObjects),1 do 
			ExecuteAction("NAMED_DELETE", %WaypointObjects[i])	
		end
	end
	CreateDistanceTable()
	--SetScriptTimerFast(0.1,CreateDistanceTable)
end

function GetFarthestWaypoint(team)
	local ReferenceWaypoint = GetPlayerStartWaypointByTeam(team)
	local Distances = {}
	for i=1,getn(Waypoint),1 do 
		tinsert(Distances, WaypointDistance[ReferenceWaypoint][Waypoint[i]]) 
	end
	return Waypoint[GetIndexOfTableElement(Distances, GetMaxValue(Distances))]
end

function GetClosestWaypoint(team)
	local ReferenceWaypoint = GetPlayerStartWaypointByTeam(team)
	local Distances={}
	local distancemin=15000
	local index=1
	for i=1,getn(Waypoint),1 do 
		if WaypointDistance[ReferenceWaypoint][Waypoint[i]] ~= 0 then
			if WaypointDistance[ReferenceWaypoint][Waypoint[i]] < distancemin then 
				distancemin=WaypointDistance[ReferenceWaypoint][Waypoint[i]]
				index=i
			end
		end
	end	 
	return Waypoint[index]
end

function GetPlayerStartWaypointByTeam(team)
	return strsub(team, 1, 8) .. "_Start"  
end

function ObjectGetTypeOld(object)
	return ObjectGetTypeByHash(tonumber(strsub(ObjectTemplateName(GetObjectLuaRef(object)), 6,  13), 16))
end

function ObjectTestObjectStatus(object, objectstatus)
	return EvaluateCondition("UNIT_HAS_OBJECT_STATUS", GetObjectStringRef(object), GetObjectStatus(objectstatus))
end

function ObjectClearObjectStatus(object, objectstatus)
	ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", GetObjectStringRef(object), GetObjectStatus(objectstatus), 0)
end

function PrintError(msg)
	print("ERROR: " .. msg)
end

OBJECT_LIST = {
	[CNCZH] = 
	{
		["Tanks"] = {"AmericaTankCrusader","Lazr_AmericaTankCrusader","SupW_AmericaTankCrusader","AmericaTankPaladin","Lazr_AmericaTankPaladin","SupW_AmericaTankPaladin","AmericaTankAvenger","AirF_AmericaTankAvenger","Lazr_AmericaTankAvenger","SupW_AmericaTankAvenger","AmericaTankMicrowave","AirF_AmericaTankMicrowave","SupW_AmericaTankMicrowave","ChinaTankOverlord","Nuke_ChinaTankOverlord","Tank_ChinaTankEmperor","ChinaTankBattleMaster","Nuke_ChinaTankBattleMaster","Tank_ChinaTankBattleMaster","ChinaTankDragon","Infa_ChinaTankDragon","Nuke_ChinaTankDragon","Tank_ChinaTankDragon","ChinaTankGattling","Infa_ChinaTankGattling","Nuke_ChinaTankGattling","Tank_ChinaTankGattling","ChinaTankECM","Infa_ChinaTankECM","Nuke_ChinaTankECM","Tank_ChinaTankECM","GLATankScorpion","Demo_GLATankScorpion","Slth_GLATankScorpion","Chem_GLATankScorpion","GLATankMarauder","Demo_GLATankMarauder","Slth_GLATankMarauder","Chem_GLATankMarauder","GLAVehicleToxinTruck","Demo_GLAVehicleToxinTruck","Slth_GLAVehicleToxinTruck","Chem_GLAVehicleToxinTruck"},
		["Aircraft"] = {"AmericaJetRaptor","AirF_AmericaJetRaptor","SupW_AmericaJetRaptor","AmericaJetStealthFighter","AirF_AmericaJetStealthFighter","Lazr_AmericaJetStealthFighter","SupW_AmericaJetStealthFighter","AmericaJetAurora","AirF_AmericaJetAurora","SupW_AmericaJetAurora","AmericaVehicleComanche","AirF_AmericaVehicleComanche","Lazr_AmericaVehicleComanche","SupW_AmericaVehicleComanche","ChinaJetMIG","Infa_ChinaJetMIG","Nuke_ChinaJetMIG","Tank_ChinaJetMIG","ChinaVehicleHelix","Infa_ChinaVehicleHelix","Nuke_ChinaVehicleHelix","Tank_ChinaVehicleHelix"},
		["Base Defenses"] = {"AmericaPatriotBattery","AirF_AmericaPatriotBattery","Lazr_AmericaPatriotBattery","SupW_AmericaPatriotBattery","AmericaFireBase","AirF_AmericaFireBase","Lazr_AmericaFireBase","SupW_AmericaFireBase","ChinaGattlingCannon","Infa_ChinaGattlingCannon","Nuke_ChinaGattlingCannon","Tank_ChinaGattlingCannon","ChinaBunker","Infa_ChinaBunker","Nuke_ChinaBunker","Tank_ChinaBunker","GLAStingerSite","Demo_GLAStingerSite","Slth_GLAStingerSite","Chem_GLAStingerSite","GLAHoleStingerSite","GLATunnelNetwork","Demo_GLATunnelNetwork","Slth_GLATunnelNetwork","Chem_GLATunnelNetwork","GLAHoleTunnelNetwork"},
		["Infantry"] = {"AmericaInfantryRanger","AirF_AmericaInfantryRanger","Lazr_AmericaInfantryRanger","SupW_AmericaInfantryRanger","AmericaInfantryMissileDefender","AirF_AmericaInfantryMissileDefender","Lazr_AmericaInfantryMissileDefender","SupW_AmericaInfantryMissileDefender","AmericaInfantryPilot","ChinaInfantryRedguard","Infa_ChinaInfantryMiniGunner","Nuke_ChinaInfantryRedguard","Tank_ChinaInfantryRedguard","ChinaInfantryTankHunter","Infa_ChinaInfantryTankHunter","Nuke_ChinaInfantryTankHunter","Tank_ChinaInfantryTankHunter","GLAInfantryRebel","Demo_GLAInfantryRebel","Slth_GLAInfantryRebel","Chem_GLAInfantryRebel","GLAInfantryHijacker","Demo_GLAInfantryHijacker","Slth_GLAInfantryHijacker","GLAInfantrySaboteur","Demo_GLAInfantrySaboteur","Slth_GLAInfantrySaboteur","GLAInfantryTunnelDefender","Demo_GLAInfantryTunnelDefender","Slth_GLAInfantryTunnelDefender","Chem_GLAInfantryTunnelDefender","GLAInfantryAngryMobPistol01","Demo_GLAInfantryAngryMobPistol01","Slth_GLAInfantryAngryMobPistol01","Chem_GLAInfantryAngryMobPistol01","GLAInfantryAngryMobPistol03","Demo_GLAInfantryAngryMobPistol03","Slth_GLAInfantryAngryMobPistol03","Chem_GLAInfantryAngryMobPistol03","GLAInfantryAngryMobPistol05","Demo_GLAInfantryAngryMobPistol05","Demo_GLAInfantryAngryMobPistol05","Chem_GLAInfantryAngryMobPistol05","GLAInfantryAngryMobRock02","Demo_GLAInfantryAngryMobRock02","Slth_GLAInfantryAngryMobRock02","Chem_GLAInfantryAngryMobRock02","GLAInfantryAngryMobRock04","Demo_GLAInfantryAngryMobRock04","Slth_GLAInfantryAngryMobRock04","Chem_GLAInfantryAngryMobRock04"},
		["Artillery"] = {"AmericaVehicleTomahawk","AirF_AmericaVehicleTomahawk","Lazr_AmericaVehicleTomahawk","SupW_AmericaVehicleTomahawk","ChinaVehicleInfernoCannon","Infa_ChinaVehicleInfernoCannon","Nuke_ChinaVehicleInfernoCannon","ChinaVehicleNukeLauncher","Infa_ChinaVehicleNukeLauncher","Nuke_ChinaVehicleNukeLauncher","GLAVehicleRocketBuggy","Demo_GLAVehicleRocketBuggy","Slth_GLAVehicleRocketBuggy","Chem_GLAVehicleRocketBuggy","GLAVehicleScudLauncher","Demo_GLAVehicleScudLauncher","Slth_GLAVehicleScudLauncher","Chem_GLAVehicleScudLauncher"},
		["Super Weapons"] = {"AmericaParticleCannonUplink","AirF_AmericaParticleCannonUplink","Lazr_AmericaParticleCannonUplink","SupW_AmericaParticleCannonUplink","ChinaNuclearMissileLauncher","Infa_ChinaNuclearMissileLauncher","Nuke_ChinaNuclearMissileLauncher","Tank_ChinaNuclearMissileLauncher","GLAScudStorm","Demo_GLAScudStorm","Slth_GLAScudStorm","Chem_GLAScudStorm","GLAHoleScudStorm"},
		["Tech Buildings"] = {"TechOilDerrick","TechHospital","TechOilRefinery","TechArtilleryPlatform","TechReinforcementPad","TechRepairbay"},
		["Spy"] = {"AmericaInfantryColonelBurton","AirF_AmericaInfantryColonelBurton","Lazr_AmericaInfantryColonelBurton","SupW_AmericaInfantryColonelBurton","ChinaInfantryBlackLotus","Infa_ChinaInfantryBlackLotus","Nuke_ChinaInfantryBlackLotus","Tank_ChinaInfantryBlackLotus","GLAInfantryJarmenKell","Demo_GLAInfantryJarmenKell","Slth_GLAInfantryJarmenKell","Chem_GLAInfantryJarmenKell","AmericaInfantryPathfinder","AirF_AmericaInfantryPathfinder","Lazr_AmericaInfantryPathfinder","SupW_AmericaInfantryPathfinder","AmericaVehicleSentryDrone","AirF_AmericaVehicleSentryDrone","Lazr_AmericaVehicleScoutDrone","SupW_AmericaVehicleSentryDrone","ChinaVehicleListeningOutpost","Infa_ChinaVehicleListeningOutpost","Nuke_ChinaVehicleListeningOutpost","Tank_ChinaVehicleListeningOutpost"},
		["Base Factories"] = {"AmericaAirfield","AirF_AmericaAirfield","Lazr_AmericaAirfield","SupW_AmericaAirfield","AmericaBarracks","AirF_AmericaBarracks","Lazr_AmericaBarracks","SupW_AmericaBarracks","AmericaWarFactory","AirF_AmericaWarFactory","Lazr_AmericaWarFactory","SupW_AmericaWarFactory","GLAArmsDealer","Demo_GLAArmsDealer","Slth_GLAArmsDealer","Chem_GLAArmsDealer","GLAHoleArmsDealer","GLABarracks","Demo_GLABarracks","GC_Slth_GLABarracks","Chem_GLABarracks","GLAHoleBarracks","ChinaWarFactory","Infa_ChinaWarFactory","Nuke_ChinaWarFactory","Tank_ChinaWarFactory","ChinaBarracks","Infa_ChinaBarracks","Nuke_ChinaBarracks","Tank_ChinaBarracks","ChinaAirfield","Infa_ChinaAirfield","Nuke_ChinaAirfield","Tank_ChinaAirfield"},
		["Base Buildings"] = {"AmericaCommandCenter","AirF_AmericaCommandCenter","Lazr_AmericaCommandCenter","SupW_AmericaCommandCenter","ChinaCommandCenter","Infa_ChinaCommandCenter","Nuke_ChinaCommandCenter","Tank_ChinaCommandCenter","GLACommandCenter","Demo_GLACommandCenter","Slth_FakeGLACommandCenter","Chem_GLACommandCenter","GLAHoleCommandCenter","GLAHolePalace","GLADemoTrap","Demo_GLADemoTrap","Slth_GLADemoTrap","Chem_GLADemoTrap"},
		["Vehicle"] = {"AmericaVehicleMedic","AirF_AmericaVehicleMedic","Lazr_AmericaVehicleMedic","SupW_AmericaVehicleMedic","ChinaVehicleTroopCrawler","Infa_ChinaVehicleTroopCrawler","Nuke_ChinaVehicleTroopCrawler","Tank_ChinaVehicleTroopCrawler","GLAVehicleTechnical","Demo_GLAVehicleTechnical","Slth_GLAVehicleTechnical","Chem_GLAVehicleTechnical","GLAVehicleBombTruck","Demo_GLAVehicleBombTruck","Slth_GLAVehicleBombTruck","Chem_GLAVehicleBombTruck","GLAVehicleBattleBus","Demo_GLAVehicleBattleBus","Slth_GLAVehicleBattleBus","Chem_GLAVehicleBattleBus","GLAVehicleCombatBike","Demo_GLAVehicleCombatBike","Slth_GLAVehicleCombatBike","Chem_GLAVehicleCombatBike"},
		["Anti-Air Vehicle"] = {"AmericaVehicleHumvee","AirF_AmericaVehicleHumvee","Lazr_AmericaVehicleHumvee","SupW_AmericaVehicleHumvee","ChinaTankGattling","Infa_ChinaTankGattling","Nuke_ChinaTankGattling","Tank_ChinaTankGattling","GLAVehicleQuadCannon","Demo_GLAVehicleQuadCannon","Slth_GLAVehicleQuadCannon","Chem_GLAVehicleQuadCannon"},
		["Utility"] = {"AmericaVehicleDozer","AirF_AmericaVehicleDozer","Lazr_AmericaVehicleDozer","SupW_AmericaVehicleDozer","ChinaVehicleDozer","Infa_ChinaVehicleDozer","Nuke_ChinaVehicleDozer","Tank_ChinaVehicleDozer","GLAVehicleRadarVan","Demo_GLAVehicleRadarVan","Slth_GLAVehicleRadarVan","Chem_GLAVehicleRadarVan"},
		["Tech Center"] = {"AmericaStrategyCenter","AirF_AmericaStrategyCenter","Lazr_AmericaStrategyCenter","SupW_AmericaStrategyCenter","ChinaPropagandaCenter","Infa_ChinaPropagandaCenter","Nuke_ChinaPropagandaCenter","Tank_ChinaPropagandaCenter","GLAPalace","Demo_GLAPalace","Slth_GLAPalace","Chem_GLAPalace"},
		["Supply Lines"] = {"AmericaVehicleChinook","AirF_AmericaVehicleChinook","Lazr_AmericaVehicleChinook","SupW_AmericaVehicleChinook","ChinaVehicleSupplyTruck","Infa_ChinaVehicleSupplyTruck","Nuke_ChinaVehicleSupplyTruck","Tank_ChinaVehicleSupplyTruck","ChinaInfantryHacker","Infa_ChinaInfantryHacker","Nuke_ChinaInfantryHacker","Tank_ChinaInfantryHacker","GLAInfantryWorker","Demo_GLAInfantryWorker","Slth_GLAInfantryWorker","Chem_GLAInfantryWorker"},
		["Supply Lines - Buildings"] = {"AmericaSupplyCenter","AirF_AmericaSupplyCenter","Lazr_AmericaSupplyCenter","SupW_AmericaSupplyCenter","AmericaSupplyDropZone","AirF_AmericaSupplyDropZone","Lazr_AmericaSupplyDropZone","SupW_AmericaSupplyDropZone","ChinaSupplyCenter","Infa_ChinaSupplyCenter","Nuke_ChinaSupplyCenter","Tank_ChinaSupplyCenter","ChinaInternetCenter","Infa_ChinaInternetCenter","Nuke_ChinaInternetCenter","Tank_ChinaInternetCenter","GLASupplyStash","Demo_GLASupplyStash","Slth_GLASupplyStash","Chem_GLASupplyStash","GLABlackMarket","Demo_GLABlackMarket","Slth_GLABlackMarket","Chem_GLABlackMarket"},
		["Power"] = {"AmericaPowerPlant","AirF_AmericaPowerPlant","Lazr_AmericaPowerPlant","SupW_AmericaPowerPlant","ChinaPowerPlant","Infa_ChinaPowerPlant","Nuke_ChinaPowerPlant","Tank_ChinaPowerPlant"},
	},
	[BFME2ROTWK] = 
	{
		["Offensive_Units"] = {"GondorArcherHorde","GondorFighterHorde","GondorTowerShieldGuardHorde","GondorKnightHorde","GondorRangerHorde","IsengardUrukCrossbowHorde","IsengardBallista","IsengardFighterHorde","IsengardPikemanHorde","IsengardWargRiderHorde","MordorArcherHorde","MordorCatapult","MordorCaveTroll","MordorEasterlingHorde","MordorFighterHorde","MordorHaradrimHorde","MordorMumakil","MordorSiegeTower","RohanArcherHorde","RohanRohirrimHorde","RohanElvenWarriorHorde","RohanPeasantHorde"},
		["Horde_Units"] = {"GondorArcherHorde","GondorFighterHorde","GondorTowerShieldGuardHorde","GondorKnightHorde","GondorRangerHorde","IsengardUrukCrossbowHorde","IsengardFighterHorde","IsengardPikemanHorde","IsengardWargRiderHorde","MordorArcherHorde","MordorEasterlingHorde","MordorFighterHorde","MordorHaradrimHorde","RohanArcherHorde","RohanRohirrimHorde","RohanElvenWarriorHorde","RohanPeasantHorde"},
		["Good Units List"] = {"GondorAragorn","GondorAragornMP","GondorBoromir","GondorGandalf","GondorGandalfCavalry","GondorFaramir","GondorArcher","GondorCavalry","GondorFighter","GondorRanger","GondorTowerShieldGuard","GondorTrebuchet","RohanArcher","RohanElvenWarrior","RohanEntAsh","RohanEntBirch","RohanEntFir","RohanEomer","RohanEomerCavalry","RohanEowyn","RohanEowynDisguised","RohanFrodo","RohanGimli","RohanLegolas","RohanMerry","RohanPippin","RohanRohirrim","RohanRohirrimArcher","RohanSam","RohanTheoden","RohanTheodenCavalry","RohanTreeBerd","RohanPeasant","RohanPeasant1","RohanPeasant2","RohanPeasant3","RohanPeasant4"},
		["Hobbitsiss List"] = {"RohanFrodo","RohanSam","RohanMerry","RohanPippin"},
		["Evil Units List"] = {"MordorArcher","MordorBatteringRam","MordorCatapult","MordorCaveTroll","MordorDrummerTroll","MordorEasterling","MordorFighter","MordorHaradrim","MordorMountainTroll","MordorMumakil","MordorSiegeTower","MordorSoldOfRhun","IsengardBallista","IsengardBatteringRam","IsengardBeserker","IsengardExplosiveMine","IsengardFighter","IsengardLurtz","IsengardPikeman","IsengardSaruman","IsengardSiegeLadder","IsengardUrukCrossbow","IsengardWargRider"},
		["Air_Units"] = {"MordorWitchKingOnFellBeast","MordorFellBeast","GondorGwaihir"},
		["Hero_Units"] = {"MordorWitchKingOnFellBeast","MordorFellBeast","IsengardLurtz","IsengardSaruman","GondorAragorn","GondorAragornMP","GondorBoromir","GondorFaramir","GondorGandalfWhite","GondorGandalfCavalry","RohanEomer","RohanEomerCavalry","RohanEowyn","RohanEowynDisguised","RohanFrodo","RohanGimli","RohanLegolas","RohanMerry","RohanPippin","RohanSam","RohanTheoden","RohanTheodenCavalry","RohanTreeBerd"},
		["Ent_Units"] = {"RohanTreeBerd","RohanEntAsh","RohanEntBirch","RohanEntFir"},
		["Fellowship_Units"] = {"GondorBoromir","GondorAragorn","GondorAragornMP","GondorGandalfWhite","GondorGandalfCavalry","RohanFrodo","RohanGimli","RohanLegolas","RohanMerry","RohanPippin","RohanSam"},
		["Artillery_Units"] = {"GondorTrebuchet","GondorTrebuchet","IsengardBallista","IsengardBallista","MordorCatapult","MordorCatapult","GondorWorkshop","IsengardSiegeWorks","MordorSiegeWorks"},
		["Artillery_Factories"] = {"GondorWorkshop","IsengardSiegeWorks","MordorSiegeWorks"},
		["Creeps"] = {"GiantSpider","GiantSpider_Slaved","GiantSpider_Small","MordorGoblinSwordsman_Slaved","MordorGoblinArcher_Slaved","CaveTroll_Slaved","IsengardWargRider_Slaved","CaveTrollLair","MoriarGoblinLair","WargLair","NeutralWarg"},
		["Cavalry_Units"] = {"GondorKnightHorde","GondorKnightHordeWedgeFormation","GondorKnightFighterComboHorde","GondorKnightTowerShieldGuardComboHorde","IsengardWargRiderHorde","IsengardWargRiderHordeLineFormation","MordorCaveTroll","MordorMountainTroll","MordorDrummerTroll","MordorMumakil","RohanRohirrimHorde","RohanRohirrimHordeWedgeFormation","RohanRohirrimPeasantComboHorde","RohanRohirrimArcherHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimArcherPeasantComboHorde","GondorKnightHorde","GondorKnightHordeWedgeFormation","GondorKnightFighterComboHorde","GondorKnightTowerShieldGuardComboHorde","IsengardWargRiderHorde","IsengardWargRiderHordeLineFormation","MordorCaveTroll","MordorMountainTroll","MordorDrummerTroll","MordorMumakil","RohanRohirrimHorde","RohanRohirrimHordeWedgeFormation","RohanRohirrimPeasantComboHorde","RohanRohirrimArcherHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimArcherPeasantComboHorde"},
		["Cavalry_Factories"] = {"GondorStable","IsengardWargPit","MordorTrollCage","MordorMumakilPen","RohanStable"},
		["Flammable List"] = {"GondorKnightHorde","GondorKnightHordeWedgeFormation","GondorKnightFighterComboHorde","IsengardWargRiderHorde","IsengardWargRiderHordeLineFormation","MordorMountainTroll","MordorDrummerTroll","MordorMumakil","RohanRohirrimHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimPeasantComboHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimArcherHorde","GondorAragorn","GondorBoromir","GondorFaramir","GondorGandalf","GondorGwaihir_Summoned","GondorTrebuchet","IsengardBallista","IsengardLurtz","IsengardSaruman","MordorCatapult","MordorFellBeast","MordorWitchKingOnFellBeast","RohanEntAsh","RohanEntBirch","RohanEntBirch_Summoned","RohanEntFir","RohanEntFir_Summoned","RohanEomer","RohanEowyn","RohanGimli","RohanLegolas","RohanMerry","RohanPippin","RohanTheoden","RohanTreeBerd"},
		["Infantry_All"] = {"GondorFighterHorde","GondorFighterHordeBlock","GondorFighterArcherComboHorde","GondorFighterRangerComboHorde","GondorFighterTrebuchetComboHorde","RohanPeasantHorde","RohanPeasantArcherComboHorde","IsengardFighterHorde","IsengardFighterHordeBlock","IsengardFighterCrossbowComboHorde","IsengardFighterLadderComboHorde","IsengardFighterPikemanComboHorde","IsengardBeserker","MordorFighterHorde","MordorFighterArcherComboHorde","MordorFighterTowerComboHorde","MordorHaradrimHorde","MordorHaradrimHordeWedge","MordorEasterlingHorde","MordorEasterlingPorcupineHorde","MordorGoblinFighterHorde","GondorBarracks","IsengardUrukPit","MordorOrcPit","MordorHaradrimPalace","RohanFarm"},
		["Infantry_Units"] = {"GondorFighterHorde","GondorFighterHordeBlock","GondorFighterArcherComboHorde","GondorFighterRangerComboHorde","GondorFighterTrebuchetComboHorde","RohanPeasantHorde","RohanPeasantArcherComboHorde","IsengardFighterHorde","IsengardFighterHordeBlock","IsengardFighterCrossbowComboHorde","IsengardFighterLadderComboHorde","IsengardFighterPikemanComboHorde","IsengardBeserker","MordorFighterHorde","MordorFighterArcherComboHorde","MordorFighterTowerComboHorde","MordorHaradrimHorde","MordorHaradrimHordeWedge","MordorEasterlingHorde","MordorEasterlingPorcupineHorde","MordorGoblinFighterHorde"},
		["Infantry_Factories"] = {"GondorBarracks","IsengardUrukPit","MordorOrcPit","MordorHaradrimPalace","RohanFarm"},
		["Archer_All"] = {"GondorArcherHorde","GondorArcherHordeWedgeFormation","GondorFighterArcherComboHorde","GondorTowerShieldGuardHorde","GondorTowerShieldGuardHordeWallFormation","GondorTowerArcherComboHorde","GondorKnightTowerShieldGuardComboHorde","GondorTowerRangerComboHorde","GondorTowerTrebuchetComboHorde","GondorRangerHorde","GondorRangerHordeAmbushFormation","GondorFighterRangerComboHorde","IsengardUrukCrossbowHorde","IsengardUrukCrossbowHordeWedgeFormation","IsengardFighterCrossbowComboHorde","IsengardCrossbowPikemanComboHorde","IsengardPikemanHorde","IsengardPikemanHordePorcupine","IsengardFighterPikemanComboHorde","MordorArcherHorde","MordorFighterArcherComboHorde","MordorGoblinArcherHorde","RohanArcherHorde","RohanArcherHordeSkirmishFormation","RohanPeasantArcherComboHorde","RohanElvenWarriorHorde","RohanElvenWarriorHorde_Summoned","RohanElvenWarriorDoubleHorde","GondorArcherRange","IsengardUrukPit","MordorOrcPit","MordorHaradrimPalace","RohanArcherRange"},
		["Archer_Units"] = {"GondorArcherHorde","GondorArcherHordeWedgeFormation","GondorFighterArcherComboHorde","GondorTowerShieldGuardHorde","GondorTowerShieldGuardHordeWallFormation","GondorTowerArcherComboHorde","GondorKnightTowerShieldGuardComboHorde","GondorTowerRangerComboHorde","GondorTowerTrebuchetComboHorde","GondorRangerHorde","GondorRangerHordeAmbushFormation","GondorFighterRangerComboHorde","IsengardUrukCrossbowHorde","IsengardUrukCrossbowHordeWedgeFormation","IsengardFighterCrossbowComboHorde","IsengardCrossbowPikemanComboHorde","IsengardPikemanHorde","IsengardPikemanHordePorcupine","IsengardFighterPikemanComboHorde","MordorArcherHorde","MordorFighterArcherComboHorde","MordorGoblinArcherHorde","RohanArcherHorde","RohanArcherHordeSkirmishFormation","RohanPeasantArcherComboHorde","RohanElvenWarriorHorde","RohanElvenWarriorHorde_Summoned","RohanElvenWarriorDoubleHorde"},
		["Archer_Factories"] = {"GondorArcherRange","IsengardUrukPit","MordorOrcPit","MordorHaradrimPalace","RohanArcherRange"},
		["Siege_Units"] = {"MordorSiegeTower","MordorBatteringRam","IsengardBatteringRam","IsengardExplosiveMine","IsengardSiegeLadder","RohanEntBirch","RohanEntBirch_Summoned","RohanEntFir","RohanEntFir_Summoned","RohanTreeBerd"},
		["Siege_All"] = {"MordorSiegeTower","MordorBatteringRam","IsengardBatteringRam","IsengardExplosiveMine","IsengardSiegeLadder","RohanEntBirch","RohanEntBirch_Summoned","RohanEntFir","RohanEntFir_Summoned","RohanTreeBerd","MordorSiegeWorks","IsengardSiegeWorks","EntMoot"},
		["Siege_Factories"] = {"MordorSiegeWorks","IsengardSiegeWorks","EntMoot"},
		["Base_Defenses"] = {"GondorBaseWallTreb","GBCampWall","GBCampWallC","GBCastleWallF","GBCastleWallG","GBCastleWallR","GBCastleWallsA","GBCastleWallsBT","GBCastleWallT1","GBCastleWallT2","GondorCastleWall","GondorCastleUpgrade","GondorTrebuchetWall","GBMGateDoor","RohanWallTower","RohanCastleWall","RohanCastleCorn","RohanCastleAngl01","RohanCastleAngl02","RohanCastleUpgrade","RohanWall","RohanWallAngl15","RohanWallElev","RohanWallFoundation","RohanWallJntI","RohanWallJntO","RohanWallTower","RohanCastleDoor","RohanCastleElevator","GondorSentryTower","EvilSentryTower","RohanSentryTower","GondorTrebuchetWall"},
		["Castle_Gates"] = {"GBMGateDoor","RohanCastleDoor"},
		["Base_Active_Defenses"] = {"EvilSentryTower","GondorBaseWallTreb","GondorBaseTower","GondorBattleTower","GondorSentryTower","GondorTrebuchetWall","GondorKeep","IsengardBattleTower","RohanWallTower","RohanBattleTower","RohanSentryTower","RuinedTower"},
		["Sentry_Towers"] = {"EvilSentryTower","GondorSentryTower","RohanSentryTower","IsengardBattleTower","RohanBattleTower","GondorBattleTower","GondorKeep"},
		["Base_Walls"] = {"GondorCastleWall","GondorCastleUpgrade","GondorCastleGateL","GondorCastleGateR","RohanCastleGateL","RohanCastleGateR","RohanCastleAngl01","RohanCastleAngl02","RohanCastleCorn","RohanCastleUpgrade"},
		["Factory_Buildings"] = {"ElvenBarracks","GondorArcherRange","GondorBarracks","GondorStable","GondorWorkshop","IsengardSiegeWorks","IsengardUrukPit","IsengardWargPit","MordorBarracks","MordorHaradrimPalace","MordorMumakilPen","MordorOrcPit","MordorSiegeWorks","MordorTrollCage","RohanArcherRange","RohanStable","RohanFarm","EntMoot"},
		["Economy_Buildings"] = {"ElvenFarm","GondorFarm","GondorFarmMultiplayer","GondorForge","LumberMill","Furnace","SlaughterHouse","RohanFarm","RohanFarmMultiplayer","RohanWell","GondorWell","RohanHeroStatue","GondorHeroStatue","ElvenFarm","GondorFarm","GondorForge","GondorForge","Furnace","SlaughterHouse"},
		["Economy_Buildings_Non_Flag"] = {"RohanFarm"},
		["Upgrade_Only_Buildings"] = {"GondorMarketPlace","GondorStoneMaker","IsengardArmory","RohanArmory"},
		["Camp_Flags"] = {"CampFlag","CampFlagNE","CampFlagNW","CampFlagSE","CampFlagSW","ExpansionFlag"},
		["Castle_Flags"] = {"CastleFlag","CastleFlagNE","CastleFlagNW","CastleFlagSE","CastleFlagSW"},
		["Flag_All"] = {"CampFlag","CampFlagNE","CampFlagNW","CampFlagSE","CampFlagSW","ExpansionFlag","CastleFlag","CastleFlagNE","CastleFlagNW","CastleFlagSE","CastleFlagSW","OutpostFlag"},
		["Economy_Flags"] = {"EconomyPlotFlag","EconomyPlotFlagMuliplayer"},
		["Flag_Expansion"] = {"EconomyPlotFlag","EconomyPlotFlagMuliplayer","OutpostFlag","ExpansionFlag","CampFlag","CampFlagNE","CampFlagNW","CampFlagSE","CampFlagSW","CastleFlag","CastleFlagNE","CastleFlagNW","CastleFlagSE","CastleFlagSW"},
		["Tactical_Markers"] = {"Backdoor1","Backdoor2","Backdoor3","Flank1","Flank2","Flank3","Forest","Center1","Center2","Center3","ChokePoint","HighGround","BaseDefenseNode1","BaseDefenseNode2","BaseDefenseNode3","BaseDefenseNode4","BaseDefenseNode5","Gate","GenericDefenseNode1","GenericDefenseNode2","GenericDefenseNode3","GenericDefenseNode4","GenericDefenseNode5","CastleBack","CastleFront","CastleLeft","CastleRight","CombatArea01","CombatArea02","CombatArea03","CombatArea04","CombatArea05","CombatArea06","CombatArea07","CombatArea08","CombatArea09","CombatArea10"},
		["CombatAreas"] = {"CombatArea01","CombatArea02","CombatArea03","CombatArea04","CombatArea05","CombatArea06","CombatArea07","CombatArea08","CombatArea09","CombatArea10","MultiplayerBeacon"},
		["Camp_Keeps"] = {"GondorCampKeep","IsengardCampKeep","MordorCampKeep","RohanCampKeep","RohanCastleBaseKeep","GondorCastleBaseKeep"},
		["Treasure_Chests"] = {"TreasureChest","TreasureChest1","TreasureChest100","TreasureChest1000","TreasureChest2","TreasureChest50","TreasureChest500","TreasureChest5000","TreasureChestMEEd"},
		["Spell_Books"] = {"RohanSpellBook","GondorSpellBook","GoodSpellBook","IsengardSpellBook","MordorSpellBook","EvilSpellBook"},
		["Rohan_Units"] = {"RohanArcherHorde","RohanArcherHordeSkirmishFormation","RohanElvenWarriorHorde","RohanElvenWarriorDoubleHorde","RohanElvenWarrior_Summoned","RohanPeasantHorde","RohanPeasantArcherComboHorde","RohanRohirrimHorde","RohanRohirrimHordeWedgeFormation","RohanRohirrim_Summoned","RohanRohirrimPeasantComboHorde","RohanRohirrimArcherHorde","RohanRohirrimArcherHordeWedgeFormation","RohanRohirrimArcherPeasantComboHorde","RohanTheoden","RohanTheodenCavalry","RohanEomer","RohanEomerCavalry","RohanEowyn","RohanEowynDisguised","GondorGandalf","GondorGandalfGrey","GondorGandalfWhite","GondorGandalfCavalry","RohanGimli","RohanLegolas","RohanMerry","RohanTreeBerd","RohanEntAsh","RohanEntBirch","RohanEntFir"},
		["Gondor_Units"] = {"GondorAragorn","RohanGimli","RohanLegolas","RohanPippin","GondorBoromir","GondorFaramir","GondorFaramirCavalry","GondorGandalfGrey","GondorGandalfWhite","GondorGandalfCavalry","GondorIsildur","GondorArcherHorde","GondorArcherHordeWedgeFormation","GondorFighterHorde","GondorFighterHordeBlock","GondorFighterArcherComboHorde","GondorFighterRangerComboHorde","GondorFighterTrebuchetComboHorde","GondorKnightHorde","GondorKnightHordeWedgeFormation","GondorKnightTowerShieldGuardComboHorde","GondorRangerHorde","GondorRangerHordeAmbushFormation","GondorTowerShieldGuardHorde","GondorTowerShieldGuardHordeWallFormation","GondorTowerArcherComboHorde","GondorTowerRangerComboHorde","GondorTowerTrebuchetComboHorde","GondorTrebuchet","RohanElvenWarriorHorde_Summoned","RohanEntBirch_Summoned","RohanEntFir_Summoned","RohanRohirrim_Summoned"},
		["Mordor_Units"] = {"MordorArcherHorde","MordorBatteringRam","MordorCatapult","MordorCaveTroll","MordorDrummerTroll","MordorEasterlingHorde","MordorEasterlingPorcupineHorde","MordorFighter","MordorFighterHorde","MordorFighterArcherComboHorde","MordorGoblinArcherHorde","MordorGoblinFighterHorde","MordorGrond","MordorHaradrimHorde","MordorHaradrimHordeWedge","MordorMountainTroll","MordorMumakil","MordorSauron","MordorSiegeTower","MordorWitchKingOnFellBeast","MordorWorker"},
		["Mordor Monsters"] = {"MordorDrummerTroll","MordorFellBeast","MordorMountainTroll","MordorMumakil","MordorWitchKingOnFellBeast"},
		["Isengard_Units"] = {"IsengardFighterPikemanComboHorde","IsengardFighterLadderComboHorde","IsengardFighterCrossbowComboHorde","IsengardCrossbowPikemanComboHorde","IsengardBallista","IsengardBatteringRam","IsengardBeserker","IsengardExplosiveMine","IsengardFighterHorde","IsengardLurtz","IsengardPikemanHorde","IsengardSaruman","IsengardSiegeLadder","IsengardUrukCrossbowHorde","IsengardUrukCrossbowHordeWedgeFormation","IsengardWargRiderHorde"},
		["Wall Units"] = {"MenWallGate","MenWallGateSmall","MenWallHubSmall","MenWallHubSmallExpansion","MenWallHubSmallUpgradeable","MenWallPosternGate","MenWallPosternGateSmall","MenWallRamp","MenWallSegmentSmall","MenWallTowerSmall","MenWallTrebuchetSmall","MinisWallATrebuchet","MinisWallAUpgrade","MinisWallAUpgradeNoGate","MinisWallBTUpgrade"},
		["Porters"] = {"DwarvenPorter","ElvenPorter","IsengardPorter","MenPorter","MordorPorter","WildPorter"},
	},
	[CNC3KW] = 
	{
		["Alien_All_Structures"] = {"AlienBuzzerHive","AlienControlCenter","AlienDronePlatform","AlienFoundry","AlienGateway","AlienLightningSpike","AlienPhotonCannon","AlienPlasmaMissileBattery","AlienPortal","AlienPowerProjector","AlienReactor","AlienRiftGenerator","AlienSignalTransmitter","AlienSporePod","AlienStatisChamber","AlienStormColumn","AlienTiberiumTower","AlienWarpBeacon"},
		["Alien_Defensive_Structures"] = {"AlienBuzzerHive","AlienLightningSpike","AlienPhotonCannon","AlienPlasmaMissileBattery","AlienStormColumn"},
		["Alien_All_Units"] = {"AlienAnnihilatorTripod","AlienAssimilator","AlienBuzzers","AlienCorrupter","AlienDevastatorWarship","AlienDevourerTank","AlienExplorer","AlienGunWalker","AlienHarvester","AlienMastermind","AlienMCV","AlienMothership","AlienPlanetaryAssaultCarrier","AlienRazorDroneSquad","AlienSeekerTank","AlienShockTrooperSquad","AlienStormrider"},
		["Alien_Air"] = {"AlienDevastatorWarship","AlienMothership","AlienPlanetaryAssaultCarrier","AlienStormrider"},
		["Alien_Vehicles"] = {"AlienAnnihilatorTripod","AlienCorrupter","AlienDevourerTank","AlienExplorer","AlienGunWalker","AlienHarvester","AlienMCV","AlienSeekerTank"},
		["Alien_Infantry"] = {"AlienAssimilator","AlienBuzzers","AlienMastermind","AlienRazorDroneSquad","AlienShockTrooperSquad"},
		["GDI_All_Units"] = {"GDIAPC","GDICommando","GDIEngineer","GDIFireHawk","GDIGrenadeSoldierSquad","GDIHarvester","GDIJuggernaught","GDIMammoth","GDIMCV","GDIMissileSoldierSquad","GDIOrca","GDIPitbull","GDIPredator","GDIRifleSoldierSquad","GDIRig","GDISniperSquad","GDISurveyor","GDIZoneTrooperSquad"},
		["GDI_All_Structures"] = {"GDIAABattery","GDIAirTower","GDIArmory","GDIBarracks","GDIBattleBase","GDICommandPost","GDIConstructionYard","GDICrane","GDIGolumCannon","GDIIonCannonControl","GDIMedicalBay","GDIMiniMCVOutpost","GDIPowerPlant","GDIRefinery","GDISpaceCommandUplink","GDITerraformingStation","GDITiberiumSilo","GDIWarFactory","GDIWatchTower"},
		["GDI_Defensive_Structures"] = {"GDIAABattery","GDIGolumCannon","GDITerraformingStation","GDIWatchTower"},
		["GDI_Air"] = {"GDIFireHawk","GDIOrca","GDIV35Ox"},
		["GDI_Vehicles"] = {"GDIAPC","GDIHarvester","GDIJuggernaught","GDIMammoth","GDIMCV","GDIPitbull","GDIPredator","GDIRig","GDISurveyor"},
		["GDI_Infantry"] = {"GDICommando","GDIEngineer","GDIGrenadeSoldierSquad","GDIMissileSoldierSquad","GDIRifleSoldierSquad","GDISniperSquad","GDIZoneTrooperSquad"},
		["NOD_All_Structures"] = {"NODConstructionYard","NODCrane","NODDisruptionTower","NODDropZone","NODHandOfNOD","NODHangar","NODLaserCannon","NODLaserCannonSpawn","NODMiniMCVOutpost","NODObelisk","NODOperationsCenter","NODPowerPlant","NODRefinery","NODRocketBunker","NODRocketBunkerSpawn","NODShredderTurret","NODShredderTurretHub","NODTechAssemblyPlant","NODTempleOfNOD","NODTiberiumLiquidationFacility"},
		["NOD_All_Defensive_Structures"] = {"NODDisruptionTower","NODLaserCannon","NODLaserCannonSpawn","NODObelisk","NODRocketBunker","NODRocketBunkerSpawn","NODShredderTurret","NODShredderTurretHub"},
		["NOD_All_Units"] = {"NODAttackBike","NODAvatar","NODBeamCannon","NODBlackHandSquad","NODCommando","NODEmissary","NODFanaticSquad","NODFlameTank","NODHarvester","NODMCV","NODMilitantRocketSquad","NODMilitantSquad","NODRaiderTank","NODSaboteur","NODScorpionBuggy","NODShadowSquad","NODStealthTank","NODVenom","NODVertigo"},
		["NOD_Air"] = {"NODVenom","NODVertigo"},
		["NOD_Vehicles"] = {"NODAttackBike","NODAvatar","NODBeamCannon","NODFlameTank","NODHarvester","NODMCV","NODRaiderTank","NODScorpionBuggy","NODStealthTank"},
		["NOD_Infantry"] = {"NODBlackHandSquad","NODCommando","NODEmissary","NODFanaticSquad","NODMilitantRocketSquad","NODMilitantSquad","NODSaboteur","NODShadowSquad"},
		["BlackHand_All_Structures"] = {"BlackHandPowerPlant","BlackHandRefinery","BlackHandHandOfNod","BlackHandDropZone","BlackHandOperationsCenter","BlackHandSecretShrine","BlackHandTechAssemblyPlant","BlackHandShredderTurretHub","BlackHandLaserCannon","BlackHandRocketBunker","BlackHandTiberiumSilo","BlackHandPropagandaTower","BlackHandObelisk","BlackHandTempleOfNOD","BlackHandTiberiumLiquidationFacility","BlackHandCrane","BlackHandEmissary","MG_BlackHand_WarmechFacility"},
		["MarkedOfKane_All_Structures"] = {"MarkedOfKanePowerPlant","MarkedOfKaneRefinery","MarkedOfKaneHandOfNod","MarkedOfKaneDropZone","MarkedOfKaneOperationsCenter","MarkedOfKaneHangar","MarkedOfKaneSecretShrine","MarkedOfKaneTechAssemblyPlant","MarkedOfKaneTiberiumLiquidationFacility","MarkedOfKaneShredderTurretHub","MarkedOfKaneLaserCannon","MarkedOfKaneRocketBunker","MarkedOfKaneTiberiumSilo","MarkedOfKaneDisruptionTower","MarkedOfKanePropagandaTower","MarkedOfKaneObelisk","MarkedOfKaneTempleOfNOD","MarkedOfKaneAirSupport","MarkedOfKaneCrane","MG_MarkedOfKane_WarmechFacility","MarkedOfKaneEmissary"},
		["SteelTalons_All_Structures"] = {"SteelTalonsPowerPlant","SteelTalonsRefinery","SteelTalonsBarracks","SteelTalonsWarfactory","SteelTalonsCommandPost","SteelTalonsAirTower","SteelTalonsTechCenter","SteelTalonsSpaceCommandUplink","MG_SteelTalons_ReclamatorHub","SteelTalonsWatchTower","SteelTalonsGolumCannon","SteelTalonsAABattery","SteelTalonsTiberiumSilo","SteelTalonsIonCannonControl","SteelTalonsCrane","SteelTalonsAirSupport","SteelTalonsSurveyor"},
		["ZOCOM_All_Structures"] = {"ZOCOMPowerPlant","ZOCOMRefinery","ZOCOMBarracks","ZOCOMWarFactory","ZOCOMCommandPost","ZOCOMAirTower","ZOCOMMedicalBay","ZOCOMArmory","ZOCOMSpaceCommandUplink","MG_ZOCOM_ReclamatorHub","ZOCOMWatchTower","ZOCOMGolumCannon","ZOCOMAABattery","ZOCOMTiberiumSilo","ZOCOMTerraformingStation","ZOCOMIonCannonControl","ZOCOMCrane","ZOCOMAirSupport","ZOCOMSurveyor"},
		["Reaper17_All_Structures"] = {"Reaper17PowerProjector","Reaper17TiberiumTower","Reaper17Portal","Reaper17Gateway","Reaper17BuzzerHive","Reaper17PhotonCannon","Reaper17PlasmaMissileBattery","Reaper17GrowthStimulator","Reaper17ControlCenter","Reaper17StormColumn","Reaper17WarpBeacon","Reaper17StasisChamber","Reaper17Reactor","Reaper17SignalTransmitter","Reaper17RiftGenerator","Reaper17Explorer","Reaper17Foundry","MG_Reaper17_Hive"},
		["Traveler59_All_Structures"] = {"Traveler59PowerProjector","Traveler59TiberiumTower","Traveler59Portal","Traveler59Gateway","Traveler59BuzzerHive","Traveler59PhotonCannon","Traveler59PlasmaMissileBattery","Traveler59SporePod","Traveler59ControlCenter","Traveler59StormColumn","Traveler59WarpBeacon","Traveler59StatisChamber","Traveler59Reactor","Traveler59SignalTransmitter","Traveler59RiftGenerator","Traveler59Explorer","Traveler59Foundry","MG_Traveler59_Hive"},
		["AllBaseBuildings"] = {"GDIMCV","SteelTalonsMCV","ZOCOMMCV","NodMCV","BlackHandMCV","MarkedOfKaneMCV","AlienMCV","Reaper17MCV","Traveler59MCV"},
		["AllInfantryUnits"] = {"GDIRifleSoldierSquad","GDIMissileSoldierSquad","NODMilitantSquad","NODMilitantRocketSquad","BlackHandConfessorSquad","AlienBuzzers","AlienRazorDroneSquad","AlienShockTrooperSquad","Traveler59Stalker","BlackHandBlackHandSquad","NODShadowSquad","NodFanaticSquad","ZOCOMZoneRaiderSquad","GDIZoneTrooperSquad","GDIGrenadeSoldierSquad","MarkedOfKaneImprovedCyborgInfantrySquad","GDISniperSquad","Traveler59Cultist","AlienMastermind","NODCommando","GDICommando"},
		["AllVehicleUnits "] = {"NODAttackBike","AlienCustomizableVehicle","NODScorpionBuggy","SteelTalonsWolverine","GDIPitbull","SteelTalonsAPC","NODRaiderTank","AlienGunWalker","Reaper17ShardWalker","AlienSeekerTank","MarkedOfKaneBeamCannon","BlackHandFlameTank","NODStealthTank","BlackHandMobileArtillery","GDIPredator","SteelTalonsTitan","AlienDevourerTank","AlienCorrupter","ZOCOMImprovedSonicTank","NODAvatar","BlackHandCustomWarmech","Reaper17AnnihilatorTripod","SteelTalonsMammoth","GDIJuggernaught","SteelTalonsBehemoth","NodMetaUnit","SteelTalonsMARV","AlienEradicatorHexapod","GDIRig","SteelTalonsRepairAPC"},
		["AllAirUnits"] = {"MarkedOfKaneVenom","ZOCOMHammerhead","Traveler59Stormrider","GDIFireHawk","GDIOrca","NODVertigo","Traveler59DevastatorWarship","Traveler59PlanetaryAssaultCarrier","AlienMothership"},
	},
	[CNCRA3U] = 
	{
		["_OBJECT LIST_Allied All Units and Structures"] = {"AlliedAirfield","AlliedBarracks","AlliedBaseDefense","AlliedBaseDefenseAdvanced","AlliedConstructionYard","AlliedNavalYard","AlliedOutpost","AlliedPowerPlant","AlliedRefinery","AlliedSuperWeapon","AlliedSuperWeaponAdvanced","AlliedWarFactory","AlliedAntiAirShip","AlliedAntiAirVehicleTech1","AlliedAntiGroundAircraft","AlliedAntiInfantryInfantry","AlliedAntiNavalScout","AlliedAntiNavyShipTech1","AlliedAntiStructureShip","AlliedAntiStructureVehicle","AlliedAntiVehicleInfantry","AlliedAntiVehicleVehicleTech1","AlliedAntiVehicleVehicleTech3","AlliedBomberAircraft","AlliedCommandoTech1","AlliedEngineer","AlliedFighterAircraft","AlliedInfiltrationInfantry","AlliedMCV","AlliedMCV_Naval","AlliedMiner","AlliedMiner_Naval","AlliedScoutInfantry","AlliedSupportAircraft","AlliedTechStructure","AlliedArtilleryVehicle","AlliedFutureTank","AlliedGunshipAircraft","AlliedLegionnaireInfantry"},
		["_OBJECT LIST_Allied All Structures"] = {"AlliedAirfield","AlliedBarracks","AlliedBaseDefense","AlliedBaseDefenseAdvanced","AlliedConstructionYard","AlliedNavalYard","AlliedOutpost","AlliedPowerPlant","AlliedRefinery","AlliedSuperWeapon","AlliedSuperWeaponAdvanced","AlliedWarFactory","AlliedTechStructure"},
		["_OBJECT LIST_Allied Production Structures"] = {"AlliedAirfield","AlliedBarracks","AlliedNavalYard","AlliedPowerPlant","AlliedRefinery","AlliedSuperWeapon","AlliedSuperWeaponAdvanced","AlliedWarFactory","AlliedTechStructure"},
		["_OBJECT LIST_Allied Defensive Structures"] = {"AlliedBaseDefense","AlliedBaseDefenseAdvanced"},
		["_OBJECT LIST_Allied All Units"] = {"AlliedAntiAirShip","AlliedAntiAirVehicleTech1","AlliedAntiGroundAircraft","AlliedAntiInfantryInfantry","AlliedAntiNavalScout","AlliedAntiNavyShipTech1","AlliedAntiStructureShip","AlliedAntiStructureVehicle","AlliedAntiVehicleInfantry","AlliedAntiVehicleVehicleTech1","AlliedAntiVehicleVehicleTech3","AlliedBomberAircraft","AlliedCommandoTech1","AlliedEngineer","AlliedFighterAircraft","AlliedInfiltrationInfantry","AlliedMCV","AlliedMCV_Naval","AlliedMiner","AlliedMiner_Naval","AlliedScoutInfantry","AlliedSupportAircraft","AlliedArtilleryVehicle","AlliedFutureTank","AlliedGunshipAircraft","AlliedLegionnaireInfantry"},
		["_OBJECT LIST_Allied Air"] = {"AlliedAntiGroundAircraft","AlliedBomberAircraft","AlliedFighterAircraft","AlliedSupportAircraft","AlliedGunshipAircraft"},
		["_OBJECT LIST_Allied Vehicles"] = {"AlliedAntiAirVehicleTech1","AlliedAntiStructureVehicle","AlliedAntiVehicleVehicleTech1","AlliedAntiVehicleVehicleTech3","AlliedMCV","AlliedMiner","AlliedAntiInfantryVehicle_Ground","AlliedArtilleryVehicle","AlliedFutureTank"},
		["_OBJECT LIST_Allied Infantry"] = {"AlliedAntiInfantryInfantry","AlliedAntiVehicleInfantry","AlliedCommandoTech1","AlliedEngineer","AlliedInfiltrationInfantry","AlliedScoutInfantry","AlliedLegionnaireInfantry"},
		["_OBJECT LIST_Allied Navy"] = {"AlliedAntiAirShip","AlliedAntiNavalScout","AlliedAntiNavyShipTech1","AlliedAntiStructureShip","AlliedMCV_Naval","AlliedMiner_Naval","AlliedAntiInfantryVehicle","AlliedArtilleryVehicle"},
		["_OBJECT LIST_Allied Walls"] = {"AlliedWallPiece"},
		["_OBJECT LIST_Soviet All Units and Structures"] = {"SovietAirfield","SovietBarracks","SovietCrane","SovietBaseDefenseAdvanced","SovietBaseDefenseAir","SovietBaseDefenseGround","SovietConstructionYard","SovietNavalYard","SovietOutpost","SovietPowerPlant","SovietPowerPlantAdvanced","SovietRefinery","SovietSuperWeapon","SovietSuperWeaponAdvanced","SovietTechStructure","SovietWarFactory","SovietAntiAirShip","SovietAntiGroundAircraft","SovietAntiInfantryInfantry","SovietAntiInfantryVehicle","SovietAntiNavyShipTech1","SovietAntiNavyShipTech2","SovietAntiStructureShip","SovietAntiStructureVehicle","SovietAntiVehicleInfantry","SovietAntiVehicleVehicleTech1","SovietAntiVehicleVehicleTech3","SovietBomberAircraft","SovietCommandoTech1","SovietEngineer","SovietFighterAircraft","SovietHeavyAntiVehicleInfantry","SovietMCV","SovietMCV_Naval","SovietMiner","SovietMiner_Naval","SovietScoutInfantry","SovietScoutVehicle","SovietSurveyor","SovietSurveyor_Naval","SovietDesolatorInfantry","SovietGrinderVehicle","SovietHeavyWalkerVehicle","SovietMortarcycle","SovietChiefEngineer"},
		["_OBJECT LIST_Soviet All Structures"] = {"SovietAirfield","SovietCrane","SovietBarracks","SovietBaseDefenseAdvanced","SovietBaseDefenseAir","SovietBaseDefenseGround","SovietConstructionYard","SovietNavalYard","SovietOutpost","SovietPowerPlant","SovietPowerPlantAdvanced","SovietRefinery","SovietSuperWeapon","SovietSuperWeaponAdvanced","SovietTechStructure","SovietWarFactory"},
		["_OBJECT LIST_Soviet Production Structures"] = {"SovietAirfield","SovietBarracks","SovietConstructionYard","SovietNavalYard","SovietOutpost","SovietPowerPlant","SovietPowerPlantAdvanced","SovietRefinery","SovietSuperWeapon","SovietSuperWeaponAdvanced","SovietTechStructure","SovietWarFactory"},
		["_OBJECT LIST_Soviet Defensive Structures"] = {"SovietBaseDefenseAdvanced","SovietBaseDefenseAir","SovietBaseDefenseGround"},
		["_OBJECT LIST_Soviet All Units"] = {"SovietAntiAirShip","SovietAntiGroundAircraft","SovietAntiInfantryInfantry","SovietAntiInfantryVehicle","SovietAntiNavyShipTech1","SovietAntiNavyShipTech2","SovietAntiStructureShip","SovietAntiStructureVehicle","SovietAntiVehicleInfantry","SovietAntiVehicleVehicleTech1","SovietAntiVehicleVehicleTech3","SovietBomberAircraft","SovietCommandoTech1","SovietEngineer","SovietFighterAircraft","SovietHeavyAntiVehicleInfantry","SovietMCV","SovietMCV_Naval","SovietMiner","SovietMiner_Naval","SovietScoutInfantry","SovietScoutVehicle","SovietSurveyor","SovietSurveyor_Naval","SovietDesolatorInfantry","SovietGrinderVehicle","SovietHeavyWalkerVehicle","SovietMortarcycle","SovietChiefEngineer"},
		["_OBJECT LIST_Soviet Air"] = {"SovietAntiGroundAircraft","SovietBomberAircraft","SovietFighterAircraft"},
		["_OBJECT LIST_Soviet Vehicles"] = {"SovietAntiInfantryVehicle","SovietAntiStructureVehicle","SovietAntiVehicleVehicleTech1","SovietAntiVehicleVehicleTech3","SovietMCV","SovietMiner","SovietScoutVehicle","SovietSurveyor","SovietGrinderVehicle","SovietHeavyWalkerVehicle","SovietMortarcycle"},
		["_OBJECT LIST_Soviet Infantry"] = {"SovietAntiInfantryInfantry","SovietAntiVehicleInfantry","SovietCommandoTech1","SovietEngineer","SovietHeavyAntiVehicleInfantry","SovietScoutInfantry","SovietDesolatorInfantry","SovietChiefEngineer"},
		["_OBJECT LIST_Soviet Navy"] = {"SovietAntiAirShip","SovietAntiNavyShipTech1","SovietAntiNavyShipTech2","SovietAntiStructureShip","SovietMCV_Naval","SovietMiner_Naval","SovietSurveyor_Naval"},
		["_OBJECT LIST_Soviet Walls"] = {"SovietWallPiece"},
		["_OBJECT LIST_Japan All Units and Structures"] = {"JapanBarracks","JapanBaseDefense","JapanBaseDefenseAdvanced","JapanConstructionYard","AlliedNavalYard","JapanPowerPlant","JapanRefinery","JapanSuperWeapon","JapanSuperWeaponAdvanced","JapanWarFactory","JapanAntiAirShip","JapanAntiAirVehicleTech1","JapanAntiInfantryInfantry","JapanAntiInfantryVehicle","JapanAntiStructureShip","JapanAntiStructureVehicle","JapanAntiVehicleInfantry","JapanAntiVehicleInfantryTech3","JapanAntiVehicleShip","JapanAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech3","JapanCommandoTech1","JapanEngineer","JapanInfiltrationInfantry","JapanLightTransportVehicle","JapanMCV","JapanMCV_Naval","JapanMiner","JapanMiner_Naval","JapanNavyScoutShip","JapanScoutInfantry","JapanTechStructure","JapanArcherInfantry","JapanSentinelVehicle","JapanFortressShip"},
		["_OBJECT LIST_Japan All Structures"] = {"JapanBarracks","JapanBaseDefense","JapanBaseDefenseAdvanced","JapanConstructionYard","JapanNavalYard","JapanPowerPlant","JapanRefinery","JapanSuperWeapon","JapanSuperWeaponAdvanced","JapanWarFactory","JapanTechStructure"},
		["_OBJECT LIST_Japan Production Structures"] = {"JapanBarracks","JapanConstructionYard","JapanNavalYard","JapanPowerPlant","JapanRefinery","JapanSuperWeapon","JapanSuperWeaponAdvanced","JapanWarFactory","JapanTechStructure"},
		["_OBJECT LIST_Japan Defensive Structures"] = {"JapanBaseDefense","JapanBaseDefenseAdvanced"},
		["_OBJECT LIST_Japan All Units"] = {"JapanAntiAirShip","JapanAntiAirVehicleTech1","JapanAntiInfantryInfantry","JapanAntiInfantryVehicle","JapanAntiStructureShip","JapanAntiStructureVehicle","JapanAntiVehicleInfantry","JapanAntiVehicleInfantryTech3","JapanAntiVehicleShip","JapanAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech3","JapanCommandoTech1","JapanEngineer","JapanInfiltrationInfantry","JapanLightTransportVehicle","JapanMCV","JapanMCV_Naval","JapanMiner","JapanMiner_Naval","JapanNavyScoutShip","JapanScoutInfantry","JapanArcherInfantry","JapanSentinelVehicle","JapanFortressShip"},
		["_OBJECT LIST_Japan Vehicles"] = {"JapanAntiAirVehicleTech1","JapanAntiInfantryVehicle","JapanAntiStructureVehicle","JapanAntiVehicleVehicleTech1","JapanAntiVehicleVehicleTech3","JapanLightTransportVehicle","JapanMCV","JapanMiner","JapanSentinelVehicle"},
		["_OBJECT LIST_Japan Infantry"] = {"JapanAntiInfantryInfantry","JapanAntiVehicleInfantry","JapanAntiVehicleInfantryTech3","JapanCommandoTech1","JapanEngineer","JapanInfiltrationInfantry","JapanScoutInfantry","JapanArcherInfantry"},
		["_OBJECT LIST_Japan Navy"] = {"JapanAntiAirShip","JapanAntiStructureShip","JapanAntiVehicleShip","JapanMCV_Naval","JapanMiner_Naval","JapanNavyScoutShip","JapanFortressShip"},
		["_OBJECT LIST_Japan Walls"] = {"JapanWallPiece"},
		["_OBJECT LIST_Japan Eggs"] = {"JapanBarracksEgg","JapanBaseDefenseAdvancedEgg","JapanBaseDefenseEgg","JapanNavalYardEgg","JapanPowerPlantEgg","JapanRefineryEgg","JapanSuperWeaponAdvancedEgg","JapanSuperWeaponEgg","JapanWarFactoryEgg","JapanFortressShipEgg"},
	}
}