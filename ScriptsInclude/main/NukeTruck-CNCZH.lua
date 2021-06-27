NAME	 	= "Nuke Truck"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Buildable NukeTruck fixed for self detonation"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI

CommandButton Command_DetonateConvoyTruckNuke
  Command       	= SPECIAL_POWER
  SpecialPower  	= SuperweaponDetonateDirtyNuke
  Options       	= NEED_SPECIAL_POWER_SCIENCE OK_FOR_MULTI_SELECT
  TextLabel         = CONTROLBAR:DetonateNuke
  ButtonImage       = SNNukeLaunch
  ButtonBorderType  = ACTION
  DescriptLabel     = CONTROLBAR:TooltipDetonateNuke
End

CommandButton Command_DetonateConvoyTruckNuke2
  Command           = FIRE_WEAPON 
  WeaponSlot        = PRIMARY 
  Options           = OK_FOR_MULTI_SELECT
  TextLabel         = CONTROLBAR:DetonateNuke
  ButtonImage       = SNNukeLaunch
  ButtonBorderType  = ACTION
  DescriptLabel     = CONTROLBAR:TooltipDetonateNuke
End

CommandSet CivilianTransportWithNukeCommandSet
  1 = Command_DetonateConvoyTruckNuke
  2 = Command_DetonateConvoyTruckNuke2
 14 = Command_Stop
End

SpecialPower SuperweaponDetonateDirtyNuke
  Enum                = SPECIAL_DETONATE_DIRTY_NUKE
  ReloadTime          = 0;30000; 
  PublicTimer         = No
  InitiateSound       = MisGLA07Convoy16
  ViewObjectDuration  = 30000
  ViewObjectRange     = 250
  RadiusCursorRadius  = 100
End



