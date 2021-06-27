NAME	 	= "Radar Scan Cheat"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "ANY"
DESCRIPTION = "Scan Enemy on Radar every second"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

init()

RADAR_EVENT	= { ["Information"]=0, ["Construction"]=1, ["Upgrade"]=2, ["UnderAttack"]=3, ["Infiltration"]=4, ["Banner"]=5 }	

function RadarScanRoutine()
	ExecuteAction("RADAR_ENABLE")
	ExecuteAction("RADAR_FORCE_ENABLE")
	ExecuteAction("RADAR_REVERT_TO_NORMAL")
	ExecuteAction("REFRESH_RADAR")
	-- for i=1,getn(Teams),1 do
		-- if Teams[i] ~= LocalTeam and Relation[LocalTeam][Teams[i]] == RELATION_TYPE["Enemy"] then
			-- ExecuteAction("TEAM_CREATE_RADAR_EVENT", Teams[i], RADAR_EVENT["Information"])
		-- end
	-- end		
	local Action = function(object)
		if GetTeam(object) and GetTeam(object) ~= LocalTeam and Relation[LocalTeam][GetTeam(object)] == RELATION_TYPE["Enemy"] and not strfind(ObjectDescription(object),"PlayerSpellBook") then
			--local PosX, PosY, PosZ = ObjectGetPosition(object)
			--ExecuteAction("RADAR_CREATE_EVENT", {PosX, PosY, PosZ}, RADAR_EVENT["Information"])
			ExecuteAction("OBJECT_CREATE_RADAR_EVENT", object, RADAR_EVENT["Information"])
		end
	end
	ActionOnAllObjects(Action)
end
	
SetScriptTimer(1,RadarScanRoutine,-1)
