NAME	 	= "Sandbox"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "Sandbox mode, map revealed, high finance, construction speed, base power, invincibility, builability"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

ExecuteAction("SHOW_MILITARY_CAPTION", "GUI:SandboxMode", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")


PLAYER = "<Local Player>"
ExecuteAction("MAP_REVEAL_ALL_PERM", PLAYER)
ExecuteAction("PLAYER_SET_MONEY", PLAYER, 777777)
ExecuteAction("SET_BASE_CONSTRUCTION_SPEED", PLAYER, 5)
ExecuteAction("PLAYER_SET_BASE_POWER", PLAYER, 10000)
--ExecuteAction("ALLOW_DISALLOW_ALL_BUILDINGS", PLAYER, BOOLEAN)

if SAGE_GAME <= CNCZH then
	ExecuteAction("PLAYER_SET_RANKLEVEL", PLAYER, 5)
	ExecuteAction("PLAYER_SET_PLAYER_POWER_POINTS", PLAYER, 99)
end

function InvincibleCoroutine()
	ExecuteAction("TEAM_AFFECT_OBJECT_PANEL_FLAGS", HumanTeams[1], "Indestructible", 1) --"SkirmishHuman/teamSkirmishHuman"
end

BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}	

Buildings = 
{ 
	"GDIIonCannonControl", "SteelTalonsIonCannonControl", "ZOCOMIonCannonControl", 
	"NODTempleOfNOD", "BlackHandTempleOfNOD", "MarkedOfKaneTempleOfNOD",
	"AlienRiftGenerator", "Reaper17RiftGenerator","Traveler59RiftGenerator" 
}

for n=1,getn(Buildings),1 do
	ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", Buildings[n], BUILDABILITY_TYPE["IGNORE_PREREQUISITES"])
end

SetScriptTimer(1,InvincibleCoroutine,-1)

--or ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", PLAYER, OBJECT_TYPE, BOOLEAN)