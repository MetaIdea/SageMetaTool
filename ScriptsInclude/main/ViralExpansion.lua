NAME	 	= "Viral Expansion"
VERSION		= "1.00"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION	= "Stop the CABAL AI virus from building up his spiral defense line before it covers the entire map"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("DISPLAY_TEXT", "APT:GameMode")
ExecuteAction("SHOW_MILITARY_CAPTION", "APT:GameMode", 7)

EXPANSIONS_PER_MINUTE = 10

if SAGE_GAME == CNCZH or SAGE_GAME == CNCGEN then
	VirusExpansionStructures = { "AmericaPatriotBattery" }
elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then
	VirusExpansionStructures = { "RivBellTower", "EvilSentryTower", "ArnorSentryTower", "GondorSentryTower" }
elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
	VirusExpansionStructures = { "NODObelisk","GDIGolumCannon", "AlienStormColumn", "GDIWatchTower", "GDIAABattery", "GDITerraformingStation" }
	AllDefenseStructuresTable = { "NODObelisk","GDIGolumCannon","AlienStormColumn","GDIWatchTower","AlienPlasmaMissileBattery","GDIAABattery","AlienPhotonCannon","GDITerraformingStation","AlienBuzzerHive", "NODDisruptionTower","NODLaserCannon","NODLaserCannonSpawn","NODRocketBunker","NODRocketBunkerSpawn","NODShredderTurret","NODShredderTurretHub" }
elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
	AllDefenseStructuresTable = { 
		"AlliedBaseDefense", "AlliedBaseDefenseAdvanced", "BaseEgg", "BB_EuropeCoastalGun", "FI_FloatingFortressMainGun", "KR_ArtilleryDome", "SA_ObservatoryDefensiveGun", "JapanBaseDefense", "JapanBaseDefenseAdvanced", "DefensiveStructureTechStructure", "SovietBaseDefenseAdvanced", "SovietBaseDefenseAir", "SovietBaseDefenseGround", "SovietTeslaWallHub",
		"SovietHeavyWalkerDeployedTurret", 
	}
	VirusExpansionStructures = { "AlliedBaseDefense", "AlliedBaseDefenseAdvanced", "JapanBaseDefense", "JapanBaseDefenseAdvanced", "SovietBaseDefenseAdvanced", "SovietBaseDefenseAir", "SovietBaseDefenseGround" }
end


function GetNextSpiralPosition(step, centerX, centerY)
	local distance_between_points = 30
	local distance_between_line_levels = 50
    local r = distance_between_points
    local b = distance_between_line_levels / (2 * PI)
    local phi = r / b;
	local n = 0
	while n < step-1 do
        phi = phi + (distance_between_points / r)
        r = b * phi
		n = n + 1
    end
    local x = centerX + r * cos(deg(phi))
    local y = centerY + r * sin(deg(phi))
	return x,y
end

function GetNextSpiralPositionOld(index,centerX,centerY)
	local alpha=1
	local start=65
	local step=5.457
	local t = start + step*index
	return round(centerX+alpha*t*cos(deg(t))), round(centerY+alpha*t*sin(deg(t)))
end

SPIRAL_INDEX = 1

function ViralExpansionCoroutine()
	if SPIRAL_INDEX > 6 and CountTeamsKindOf(CreepsTeam,"FS_BASE_DEFENSE") == 0 then
		ExecuteAction("PLAYER_KILL", "PlyrCreeps")
		ExecuteAction("VICTORY")
	else
		local x,y = GetNextSpiralPosition(SPIRAL_INDEX,MapSizeX/2,MapSizeY/2)
		SPIRAL_INDEX = SPIRAL_INDEX + 1
		while not (x > 0 and x < MapSizeX and y > 0 and y < MapSizeY) and SPIRAL_INDEX < 10000 do
			SPIRAL_INDEX = SPIRAL_INDEX + 1
			x,y = GetNextSpiralPosition(SPIRAL_INDEX,MapSizeX/2,MapSizeY/2)
		end
		ExecuteAction('UNIT_SPAWN_NAMED_LOCATION_ORIENTATION', GetUnitName(), VirusExpansionStructures[random(getn(VirusExpansionStructures))], CreepsTeam, {x,y,GetHeightAtPosition(x,y)}, 0)
	end
end

function InitGamemode()
	MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
	ExecuteAction("PLAYER_SET_BASE_POWER", "PlyrCreeps", 1000000)
	ViralExpansionCoroutine()
	SetScriptTimer(60/EXPANSIONS_PER_MINUTE,ViralExpansionCoroutine,-1)
	--SetScriptTimerFast(0.01,ViralExpansionCoroutine,-1)
end

InitGamemode()