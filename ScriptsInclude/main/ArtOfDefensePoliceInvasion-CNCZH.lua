NAME	 	= "Art Of Defense Police Invasion"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Defeat the waves of police forces before they reach your base, endless mode"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

SPAWN_OBJECTS =
{
"PoliceCar",
"CarAmbulance",
"Firetruck",
"CarEuroPoliceVan",
}

WAVE = 1
UNITS = {}

NeutralPlayer 	= "" --yes it's void empty
NeutralTeam 	= "team"
CivilianPlayer 	= "PlyrCivilian"
CivilianTeam 	= "teamPlyrCivilian"

EnemyTeam = CivilianTeam
EnemyPlayer = CivilianPlayer

LocalPlayer 	= "player0"
LocalTeam 		= "teamplayer0"
LocalPlayerStart = "Player_1_Start"

EnemyPlayerStart = "Player_2_Start"

CurrentRoundLasts = 0

StartDelay = 30
TimeBetweenWaves = 60
LoseConditionApproachRadius = 200

function SpawnWave()
	print("SpawnWave")
	CurrentRoundLasts = CurrentRoundLasts + TimeBetweenWaves
	if CurrentRoundLasts >= 3*TimeBetweenWaves then
		UNITS = {}
		CurrentRoundLasts = 0
	end
	if not IsEnemyUnitAlive() then	--1<2 then -
		ExecuteAction("DISPLAY_TEXT", "Next Wave: " .. WAVE)
		UNITS = {}
		local SPAWN_MULTIPLIER = WAVE * 2
		for i=1,SPAWN_MULTIPLIER,1 do
			local UnitName = GetUnitName()
			tinsert(UNITS, UnitName)
			ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", UnitName, SPAWN_OBJECTS[random(getn(SPAWN_OBJECTS))], EnemyTeam, EnemyPlayerStart)
			--ExecuteAction("NAMED_SET_BOOBYTRAPPED", OBJECT_TYPE, UNIT)
		end
		WAVE = WAVE + 1
	end
	AICoroutine()
end

function IsEnemyUnitAlive()
	for i=1,getn(UNITS),1 do
		if EvaluateCondition("NAMED_NOT_DESTROYED", UNITS[i]) then
			return true
		end
	end
end

function AICoroutine()
	ExecuteAction("MOVE_TEAM_TO", EnemyTeam, LocalPlayerStart)
	-- ExecuteAction("TEAM_HUNT", EnemyTeam) 
	-- ExecuteAction("TEAM_ATTACK_TEAM", EnemyTeam, LocalTeam)
end

function SetWaypoints()
	for i=1,8,1 do
		if EvaluateCondition("START_POSITION_IS", LocalPlayer, i) then
			LocalPlayerStart = "Player_" .. i .. "_Start"
			if i == 1 then
				EnemyPlayerStart = "Player_" .. i+1 .. "_Start"
			else
				EnemyPlayerStart = "Player_" .. i-1 .. "_Start"	
			end
			print(EnemyPlayerStart)
		end
	end	
end

function CheckLooseCondition()
	if getn(UNITS) > 0 then
		for i=1,getn(UNITS),1 do
			if ObjectGetDistance(BaseRefObject, UNITS[i]) < LoseConditionApproachRadius then
				ExecuteAction("PLAYER_KILL", LocalPlayer)
				ExecuteAction("LOCALDEFEAT")
			end
		end
	end
end

function CircleLineSpawn(Object,offset,radius,team)
	if not team then team = "team" end
	local number = 30
	local position={}
	for i=1,number,1 do
		position.x=round(offset[1]+radius*cos((360/number)*i))
		position.y=round(offset[2]+radius*sin((360/number)*i))
		ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), "SelectIcon", team, {position.x,position.y,GetGroundHeight(position.x,position.y)}, 0)
	end
end

function CircleLineSpawnWall(Object,offset,radius,team) --unused
	if not team then team = "team" end
	local number = 50
	local height = 30
	local position={}
	for j=1,height,1 do
		for i=1,number,1 do
			position.x=round(offset[1]+radius*cos((360/number)*i))
			position.y=round(offset[2]+radius*sin((360/number)*i))
			ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), "SelectIcon", team, {position.x,position.y,GetGroundHeight(position.x,position.y)+j*10}, 0)
		end
	end
end

function InitGamemode()
	--ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", "object_" .. tostring(random(9999999)), "PoliceCar", "teamReplayObserver", "Player_2_Start")
	print("Art of Defense Gamemode")
	SetWaypoints()
	BaseRefObject = GetUnitName()
	ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT", BaseRefObject, "SelectIcon", LocalTeam, LocalPlayerStart)
	local x,y,z = ObjectGetPosition(BaseRefObject)
	CircleLineSpawn("SelectIcon",{x,y,z},LoseConditionApproachRadius)
	ExecuteAction("PLAYER_RELATES_PLAYER", EnemyPlayer, LocalPlayer, RELATION_TYPE["Enemy"])
	ExecuteAction("PLAYER_RELATES_PLAYER", LocalPlayer, EnemyPlayer, RELATION_TYPE["Enemy"])
	ExecuteAction("PLAYER_TRANSFER_OWNERSHIP_PLAYER", EnemyPlayer, LocalPlayer)
	SetScriptTimer(StartDelay+1,"SetScriptTimer(3,CheckLooseCondition,-1)",1)
	SetScriptTimer(StartDelay,"SetScriptTimer(TimeBetweenWaves,SpawnWave,-1)",1)
end

InitGamemode()