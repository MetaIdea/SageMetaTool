NAME	 	= "Infinite SupplyDock Ressources"
VERSION		= "1.0"
TYPE		= "INI"
GAME		= "CNCZH,CNCGEN"
DESCRIPTION = "Spawns permenently supply crates on SupplyDock"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

#INI
;Infinite SupplyDock Ressources

ObjectCreationList OCL_SupplyDockDrop
	CreateObject
		ObjectNames = SupplyPileSmall
		Count       = 1
	End
End

Object SupplyDock
	AddModule
		Behavior    	 = OCLUpdate ModuleTag_07
			OCL          = OCL_SupplyDockDrop
			MinDelay     = 180000
			MaxDelay     = 250000
			CreateAtEdge = No
		End
	End
End

Object SupplyWarehouse
	AddModule
		Behavior    	 = OCLUpdate ModuleTag_07
			OCL          = OCL_SupplyDockDrop
			MinDelay     = 180000
			MaxDelay     = 250000
			CreateAtEdge = No
		End
	End
End

Object SupplyPile
	AddModule
		Behavior    	 = OCLUpdate ModuleTag_07
			OCL          = OCL_SupplyDockDrop
			MinDelay     = 180000
			MaxDelay     = 250000
			CreateAtEdge = No
		End
	End
End