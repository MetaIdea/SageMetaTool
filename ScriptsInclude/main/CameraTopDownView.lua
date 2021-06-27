NAME	 	= "Cam Top Down View"
VERSION		= "1.0"
TYPE		= "CONFIG"
GAME		= "ANY"
DESCRIPTION = ""
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function CameraTopDownView()
	MapSize = {}
	MapSize.x, MapSize.y, MapSize.z = GetMapSize()
	ScaleFactor = 1
	ExecuteAction("SET_CAMERA_CLIP_DEPTH_MULTIPLIER", 100)
	ExecuteAction("ZOOM_CAMERA", ScaleFactor*max(MapSize.x, MapSize.y) / 500, 1, 1, 1)
	ExecuteAction("PITCH_CAMERA", 500, 1, 1, 1)
	--ExecuteAction("ROTATE_CAMERA", 1, 50, 1, 1)
	--ExecuteAction("LOCK_CAMERA_ZOOM", 1)
end

CameraTopDownView()