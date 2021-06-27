NAME	 	= "Display Allied Credits"
VERSION		= "1.00"
TYPE		= "CONFIG"
GAME		= "ANY"
DESCRIPTION = "Show allied credits"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function DisplayCreditRefresh()
	for i=1,getn(Players),1 do
		if LocalPlayer ~= Players[i] and Relation[LocalPlayer][Players[i]] == RELATION_TYPE["Friend"] then
			ExecuteAction("SET_PLAYER_MONEY_TO_COUNTER", Players[i], Players[i] .. "_money")
			ExecuteAction("DISPLAY_COUNTER", Players[i] .. "_money", "GUI:MoneySymbol")
		end
	end
end

SetScriptTimer(1,DisplayCreditRefresh,-1)