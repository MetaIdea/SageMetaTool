NAME	 	= "Info Counters"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Add counter(s) to the ui that show live stats"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

--SetCounter("UNITS_P1_COUNTER", 5, "APT:Units")
ExecuteAction("DISPLAY_COUNTER", "UNITS_P1_COUNTER", "APT:Units")
KindOf = KindOfIndexTable[GetIndexOfTableElement(KindOfIndexTable,"AIRCRAFT")-1]
function InfoCounterCoroutine() 
	ExecuteAction("SET_COUNTER_TO_NUMBER_OBJECTS_PLAYER_OWNS_WITH_KINDOF", "<Local Player>", KindOf, "UNITS_P1_COUNTER" )  --"<Local Player's Enemies>"
	--ExecuteAction("DISPLAY_COUNTER", "UNITS_P1_COUNTER", "APT:Units")
end
InfoCounterCoroutine()
--ExecuteAction("DISPLAY_COUNTER", "UNITS_P1_COUNTER", "APT:Units")
SetScriptTimer(1,InfoCounterCoroutine,-1)