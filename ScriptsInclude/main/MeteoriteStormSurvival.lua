NAME	 	= "Meteorite Storm Survival"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Meteorites appear at random positions everywhere on the map"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("DISPLAY_TEXT", "Random Meteorites Gamemode active") 

START_DELAY = 30

SOURCE_REF = "object_" .. floor(GetRandomNumber()*99999999)
ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",SOURCE_REF,"AlienSignalTransmitter","team",{0, 0, -300}, 0)
ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", SOURCE_REF, "Indestructible", 1) 
ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN", SOURCE_REF, "SpecialPower_OverlordsWrath", 0)
ExecuteAction("PLAYER_SET_BASE_POWER", "PlyrNeutral", 999)

MAP_SIZE_X, MAP_SIZE_Y, MAP_HEIGHT = GetMapSize()

function SpawnMeteoriteCoroutine()
	LOCATION_REF = "object_" .. floor(GetRandomNumber()*99999999)
	ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION",LOCATION_REF,"PlayerSpellBook","team",{random(MAP_SIZE_X), random(MAP_SIZE_Y), MAP_HEIGHT}, 0)
	ExecuteAction("NAMED_FIRE_SPECIAL_POWER_AT_NAMED", SOURCE_REF, "SpecialPower_OverlordsWrath", LOCATION_REF)	
	--ExecuteAction("NAMED_USE_COMMANDBUTTON_ABILITY_ON_NAMED", SOURCE_REF, "Command_SpecialPowerOverlordsWrath", LOCATION_REF)
	ExecuteAction("NAMED_DELETE", LOCATION_REF)
	ExecuteAction("NAMED_SET_SPECIAL_POWER_COUNTDOWN", SOURCE_REF, "SpecialPower_OverlordsWrath", 0)
	--RemoveAllTiberium()
end

function Start()
	SetScriptTimer(5,SpawnMeteoriteCoroutine,-1)
end

SetScriptTimer(START_DELAY,Start)