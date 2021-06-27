NAME	 	= "No Vehicle Units"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNCGEN,CNCZH,CNC3TW,CNC3KW,CNCRA3,CNCRA3U"
DESCRIPTION = "Disable vehicle units"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

OBJECT_LIST = {}

CNC3_WARFACTORY = {
	"GDIWarfactory", "MG_GDI_ReclamatorHub", "ZOCOMWarfactory", "MG_ZOCOM_ReclamatorHub", "SteelTalonsWarfactory", "MG_SteelTalons_ReclamatorHub", 
	"NODDropZone", "MG_NOD_WarmechFacility", "MarkedOfKaneDropZone", "MG_MarkedOfKane_WarmechFacility", "BlackHandDropZone", "MG_BlackHand_WarmechFacility", 
	"AlienGateway", "Reaper17Gateway", "Traveler59Gateway", "MG_Alien_Hive", "MG_Reaper17_Hive", "MG_Traveler59_Hive"
}

CNCRA3_WARFACTORY = {
	"AlliedWarFactory", "AlliedNavalYard", 
	"JapanNavalYard", "JapanWarFactory", 
	"SovietNavalYard", "SovietWarFactory"
}

CNCZH_WARFACTORY = {
	"AmericaWarFactory", "SupW_AmericaWarFactory", "Lazr_AmericaWarFactory", "AirF_AmericaWarFactory",
	"SupW_AmericaWarFactory", "Tank_ChinaWarFactory", "Nuke_ChinaWarFactory", "Infa_ChinaWarFactory",
	"GLAArmsDealer", "Demo_GLAArmsDealer", "Chem_GLAArmsDealer", "Slth_GLAArmsDealer",
}

if SAGE_GAME == CNCGEN or SAGE_GAME == CNCZH then
	OBJECT_LIST = CNCZH_WARFACTORY
elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then

elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
	OBJECT_LIST = CNC3_WARFACTORY
elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
	OBJECT_LIST = CNCRA3_WARFACTORY
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