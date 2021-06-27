NAME	 	= "No Infantry Units"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNCGEN,CNCZH,CNC3TW,CNC3KW,CNCRA3,CNCRA3U"
DESCRIPTION = "Disable infantry units"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

OBJECT_LIST = {}

CNC3_BARRACKS = {
	"GDIBarracks", "SteelTalonsBarracks","ZOCOMBarracks", 
	"NODHandOfNOD", "BlackHandHandOfNOD", "MarkedOfKaneHandOfNOD", 
	"AlienPortal", "Reaper17Portal", "Traveler59Portal"
}

CNCRA3_BARRACKS = {
	"AlliedBarracks", "JapanBarracks", "SovietBarracks"
}

CNCZH_BARRACKS = {
	"AmericaBarracks", "SupW_AmericaBarracks", "Lazr_AmericaBarracks", "AirF_AmericaBarracks",
	"ChinaBarracks", "Tank_ChinaBarracks", "Nuke_ChinaBarracks", "Infa_ChinaBarracks",
	"GLABarracks", "Demo_GLABarracks", "Chem_GLABarracks", "Slth_GLABarracks",
}

if SAGE_GAME == CNCGEN or SAGE_GAME == CNCZH then
	OBJECT_LIST = CNCZH_BARRACKS
elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then

elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
	OBJECT_LIST = CNC3_BARRACKS
elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
	OBJECT_LIST = CNCRA3_BARRACKS
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