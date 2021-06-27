NAME	 	= "No Superweapons"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNC3TW,CNC3KW,CNCRA3,CNCRA3U"
DESCRIPTION = "Disable superweapons, in RA3 except the human player"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function SuperweaponsBuildabilityCNC3(what)
	local BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}	
	local Superweapon_Buildings = 
	{ 
		"GDIIonCannonControl", "SteelTalonsIonCannonControl", "ZOCOMIonCannonControl", 
		"NODTempleOfNOD", "BlackHandTempleOfNOD", "MarkedOfKaneTempleOfNOD",
		"AlienRiftGenerator", "Reaper17RiftGenerator","Traveler59RiftGenerator" 
	}
	for n=1,getn(Superweapon_Buildings),1 do
		ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", Superweapon_Buildings[n], BUILDABILITY_TYPE[what])
	end
end

function DisableSuperweaponsCNCRA3()
    local BUILDABILITY_TYPE = {["YES"]=0, ["IGNORE_PREREQUISITES"]=1, ["NO"]=2, ["ONLY_BY_AI"]=3}
    local Superweapon_Buildings = 
    { 
		"JapanSuperWeaponAdvanced", "JapanSuperWeapon", 
		"JapanSuperWeaponAdvancedEgg", "JapanSuperWeaponEgg", 
		"AlliedSuperWeaponAdvanced", "AlliedSuperWeapon", 
		"SovietSuperWeaponAdvanced", "SovietSuperWeapon"
    }
    for i=1,getn(Superweapon_Buildings),1 do
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<1st Human Player's Enemies>", Superweapon_Buildings[i], 0)
		ExecuteAction("ALLOW_DISALLOW_ONE_BUILDING", "<1st Human Player's Allies>", Superweapon_Buildings[i], 0)
        --ExecuteAction("TECHTREE_MODIFY_BUILDABILITY_OBJECT", Superweapon_Buildings[i], BUILDABILITY_TYPE["NO"])
		--ExecuteAction("DISABLE_UI_BUILD_BUTTON", "Command_Construct" .. Superweapon_Buildings[i], 1)	
    end
end

if SAGE_GAME == BFME2 or SAGE_GAME == BFME2ROTWK then

elseif SAGE_GAME == CNC3TW or SAGE_GAME == CNC3KW then
	SuperweaponsBuildabilityCNC3("NO")
elseif SAGE_GAME == CNCRA3 or SAGE_GAME == CNCRA3U then
	DisableSuperweaponsCNCRA3()
end


