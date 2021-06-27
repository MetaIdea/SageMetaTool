NAME	 	= "No Air Units"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNCGEN,CNCZH,CNC3TW,CNC3KW,CNCRA3,CNCRA3U"
DESCRIPTION = "Disable air units"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

OBJECT_LIST = {}

CNC3_AIRFIELD = {
	"AlienWarpBeacon", "Reaper17WarpBeacon", "Traveler59WarpBeacon", 
	"GDIAirTower", "SteelTalonsAirTower", "ZOCOMAirTower", 
	"NODHangar", "MarkedOfKaneHangar", "BlackHandHangar"
}

CNCRA3_AIRFIELD = {
	"AlliedAirfield", "SovietAirfield"
}

CNCZH_AIRFIELD = {
	"AmericaAirfield", "SupW_AmericaAirfield", "Lazr_AmericaAirfield", "AirF_AmericaAirfield",
	"ChinaAirfield", "Tank_ChinaAirfield", "Nuke_ChinaAirfield", "Infa_ChinaAirfield",
}

CNC3_AIRUNITS = { 
	"MarkedOfKaneVenom", "ZOCOMHammerhead", "Traveler59Stormrider", 
	"GDIFireHawk","GDIOrca","NODVertigo","Traveler59DevastatorWarship", 
	"Traveler59PlanetaryAssaultCarrier","AlienMothership" 
}
	
if SAGE_GAME == CNCGEN or SAGE_GAME == CNCZH then
	OBJECT_LIST = CNCZH_AIRFIELD
elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then

elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
	OBJECT_LIST = CNC3_AIRFIELD
elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
	OBJECT_LIST = CNCRA3_AIRFIELD
end

function Init()
	BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}	
	for i=1,getn(OBJECT_LIST),1 do
		ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", OBJECT_LIST[i], BUILDABILITY_TYPE["NO"])
		for j=1,getn(Players),1 do
			ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", Players[j], OBJECT_LIST[i], 0)
		end
	end
end
	
Init()