NAME	 	= "Tower Defense"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Defend the tower against waves of enemies"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

TowerOffsetPositionBehindLocalPlayerBase = 200
PlaceTowerInMapCenter = false

ExecuteAction("DISPLAY_TEXT", "APT:GameMode")
ExecuteAction("SHOW_MILITARY_CAPTION", "APT:GameMode", 7)

function MoveCameraToObject(object)
	-- ExecuteAction("SELECT_OBJECT", LocalPlayer, object)
	-- ExecuteAction("MOVE_CAMERA_TO_SELECTION")
	-- ExecuteAction("DESELECT")
	ExecuteAction("CAMERA_FOLLOW_NAMED", TOWER, 0, 200)
	SetScriptTimer(3,[[ExecuteAction("CAMERA_STOP_FOLLOW")]],1)
end

function SetTowerObject()
	if SAGE_GAME == CNCZH or SAGE_GAME == CNCGEN then
		TowerObject = GENERIC_DUMMY
	elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then
		TowerObject = "SignalFire"
		HealthCounterStr = "CAH:HealthMenuLabel"
	elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
		TowerObject = "NodPowerPlant"
		HealthCounterStr = "APT:OnSortStatus" --"TOOLTIP:MaxHealth"
	elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
		TowerObject = GENERIC_DUMMY
	end	
end

function InitGamemode()
	SetTowerObject()
	MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
	if not PlaceTowerInMapCenter then
		local offset = TowerOffsetPositionBehindLocalPlayerBase
		local Position1 = WaypointPosition[GetPlayerStartWaypointByTeam(LocalTeam)]
		local x1 = Position1.x
		local y1 = Position1.y
		-- local Position2 = WaypointPosition[GetFarthestWaypoint(LocalTeam)]
		-- local x2 = Position2.x
		-- local y2 = Position2.y
		local directionalVectorX = x1 - (MapSizeX/2)
		local directionalVectorY = y1 - (MapSizeY/2)
		local norm = 1/sqrt(directionalVectorX^2 + directionalVectorY^2)
		local x = x1 + offset * directionalVectorX * norm
		local y = y1 + offset * directionalVectorY * norm
	else
		local x = MapSizeX/2
		local y = MapSizeY/2
	end
	TOWER = GetUnitName()
	ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', TOWER, TowerObject, NeutralTeam, {x,y,GetHeightAtPosition(x,y)}, 0)
	ColorUnit(TOWER, 255, 0, 255)
	MoveCameraToObject(TOWER)
	SetCounter("HealthCounter", GetHealth(TOWER), HealthCounterStr)
	
end

InitGamemode()