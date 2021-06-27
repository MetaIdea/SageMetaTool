NAME	 	= "Super Avatar"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "CNC3TW,CNC3KW"
DESCRIPTION = "Gives each player a super avatar as starting unit"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function GetSuperAvatar()
    local ref = spawn("NodAvatar")
    local self=GetObj.Table(ref)
	ObjectHideSubObjectPermanently( self, "NUBEAM", false )
	ObjectHideSubObjectPermanently( self, "FLAMETANK", false )
	ObjectHideSubObjectPermanently( self, "S_DETECTOR", false )
	ObjectHideSubObjectPermanently( self, "S_GENERATOR", false )
    ObjectGrantUpgrade(self, "Upgrade_AvatarBeamCannon")
    ObjectGrantUpgrade(self, "Upgrade_AvatarStealthDetect")
    ObjectGrantUpgrade(self, "Upgrade_AvatarFlamer")
    ObjectGrantUpgrade(self, "Upgrade_AvatarStealthDetect")
    ObjectGrantUpgrade(self, "Upgrade_AvatarInvisibility")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_VETERAN")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_ELITE")
    ObjectGrantUpgrade(self, "Upgrade_Veterancy_HEROIC")
	ExecuteAction("UNIT_SET_EXPERIENCE_POINTS",ref,50000) 
    --ExecuteAction("UNIT_GIVE_EXPERIENCE_LEVEL",Asset)
	return ref
end

GetSuperAvatar()