NAME	 	= "Only Infantry"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNCGEN,CNCZH,CNC3TW,CNC3KW,CNCRA3,CNCRA3U"
DESCRIPTION = "Allow only infantry"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

OBJECT_LIST1 = {}
OBJECT_LIST2 = {}

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
	
if SAGE_GAME == CNCGEN or SAGE_GAME == CNCZH then
	OBJECT_LIST1 = CNCZH_WARFACTORY
	OBJECT_LIST2 = CNCZH_AIRFIELD
elseif SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then

elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
	OBJECT_LIST1 = CNC3_WARFACTORY
	OBJECT_LIST2 = CNC3_AIRFIELD
elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
	OBJECT_LIST1 = CNCRA3_WARFACTORY
	OBJECT_LIST2 = CNCRA3_AIRFIELD
end

BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}	
for i=1,getn(OBJECT_LIST1),1 do
	ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", OBJECT_LIST1[i], BUILDABILITY_TYPE["NO"])
	for j=1,getn(Players),1 do
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", Players[j], OBJECT_LIST1[i], 0)
	end
end
for i=1,getn(OBJECT_LIST2),1 do
	ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", OBJECT_LIST2[i], BUILDABILITY_TYPE["NO"])
	for j=1,getn(Players),1 do
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", Players[j], OBJECT_LIST2[i], 0)
	end
end
