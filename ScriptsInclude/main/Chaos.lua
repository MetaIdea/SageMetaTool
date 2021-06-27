NAME	 	= "Chaos"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "CNC3KW"
DESCRIPTION = "Destroy the constantly growing hive base that tries to cover the entire map"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ObjectList = {}

ChaosObjectList={
	"NODObelisk","GDIGolumCannon","AlienStormColumn","GDIWatchTower","AlienPlasmaMissileBattery","GDIAABattery","AlienPhotonCannon","GDITerraformingStation","AlienBuzzerHive","NODLaserCannon","NODLaserCannonSpawn","NODRocketBunker","NODRocketBunkerSpawn","NODShredderTurret","NODShredderTurretHub",
	--"NodMetaUnit", "SteelTalonsMARV", "AlienEradicatorHexapod","AlienMothership",
	--"MarkedOfKaneBeamCannon", "BlackHandFlameTank", "GDIPredator", "SteelTalonsTitan", "AlienDevourerTank", "AlienCorrupter","ZOCOMImprovedSonicTank",
	--"NODAvatar", "BlackHandCustomWarmech","Reaper17AnnihilatorTripod","SteelTalonsMammoth","GDIJuggernaught","SteelTalonsBehemoth"
}

NAOD.UnitTable.Vehicle2  = {  } 
NAOD.UnitTable.Vehicle3  = {  }
NAOD.UnitTable.Vehicle4  = {  }

function GetObjectType()
	return ChaosObjectList[random(getn(ChaosObjectList))]
end

function RectangularSpiralLineSpawn2(ObjectType,team,centerX,centerY,number)
	local mindist = 60
	local x,y
	for i=0,number-1,1 do
	    x,y=rectSpiral(centerX,centerY,mindist,i)
		if type(ObjectType) == "function" then 
			tinsert(ObjectList, SpawnAtPosition(ObjectType(),team,x,y,MAP_HEIGHT))
		else 
			tinsert(ObjectList, SpawnAtPosition(ObjectType,team,x,y,MAP_HEIGHT))
		end
	end
end

function RandomCrateSpawner()
	Harms = {"NODExplosiveCharge"} --{ "GDIMine", "MarkedOfKaneMagneticMine", "NODExplosiveCharge", "NODTechBuildingBoobyTrap" }
	Crates = { "HealCrateMP", "MoneyCrateMP", "VeterancyCrateMP" } --"HealCrate", "SalvageCrate", "ShroudCrate", "UnitCrate", "VeterancyCrate" }
	--ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), Crates[random(getn(Crates))], NeutralTeam, {random(MapSizeX*0.1,MapSizeX*0.9),random(MapSizeY*0.1,MapSizeY*0.9),MAP_HEIGHT}, 0) 
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", GetUnitName(), Harms[random(getn(Harms))], NeutralTeam, {random(MapSizeX*0.1,MapSizeX*0.9),random(MapSizeY*0.1,MapSizeY*0.9),MAP_HEIGHT}, 0) 
end

function SpawnCoroutine()
	for i=1,getn(ObjectList),1 do
		ExecuteAction("NAMED_DELETE", ObjectList[i])
	end
	RectangularSpiralLineSpawn2(GetObjectType,CreepsTeam,MapSizeX/2,MapSizeY/2,300)
end

function RandomCrateSpawnerActivate()
	SetScriptTimer(1,RandomCrateSpawner,-1)	
end


function GamemodeInit()
	MapSizeX, MapSizeY, MapSizeZ = GetMapSize()
	ExecuteAction("PLAYER_SET_BASE_POWER", CreepsPlayer, 100000)
	--SpawnCoroutine()
	SetScriptTimer(30,SpawnCoroutine,-1)
	SetScriptTimer(30,RandomCrateSpawnerActivate,-1)
end

GamemodeInit()


