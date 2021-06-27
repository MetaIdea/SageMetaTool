NAME	 	= "Maze Generator Pathfinding"
VERSION		= "1.0"
TYPE		= "MOD"
GAME		= "CNC3KW"
DESCRIPTION = "Generates a random maze"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function CreateMaze(objectType, width, height, startX, startY)
	--true = 1
	--false = nil
	randomseed(gsub(gsub(date(),"%p", ""),"%s",""))
	
	--CREATE EMPTY MAZE
	maze = {}
	visited = {}
	for y = 1,height*2+1,1 do
		maze[y] = {}
		visited[y] = {}
		for x = 1,width*2+1,1 do
			maze[y][x] = true
			visited[y][x] = false
		end
	end
	--ENTRY AND EXIT
	maze[2][2*width+1] = false
	maze[2][2*width] = false	
	maze[2*height+1][2] = false
	maze[2*height][2] = false	
	--visited[2][2*width+1] = true
	--visited[2*height+1][2] = true
	
	--CREATE MAZE
	function Create(x, y, width,height)
		local stack = {}
		local directions = {"North","East","South","West"}
		visited[y][x] = true
		maze[y][x] = false
		tinsert(stack,{x=x,y=y})
		
		while getn(stack) > 0 do
			local index = 1
			local nextX = x
			local nextY = y
			
			for i = getn(directions), 2, -1 do
				local r = random(1,i)
				directions[i], directions[r] = directions[r], directions[i]
			end
			
			while index <= getn(directions) and nextX == x and nextY == y do
				if directions[index] == "North" and y > 2 and visited[y-2] and not visited[y-2][x] then
					maze[y-1][x]= false
					maze[y][x]= false
					nextY = y-2
				elseif directions[index] == "East" and x < width*2 and visited[y] and not visited[y][x+2] then
					maze[y][x+1]= false
					maze[y][x]= false
					nextX = x+2
				elseif directions[index] == "South" and y < height*2 and visited[y+2] and not visited[y+2][x] then
					maze[y+1][x]= false
					maze[y][x]= false
					nextY = y+2
				elseif directions[index] == "West" and x > 2 and visited[y] and not visited[y][x-2] then
					maze[y][x-1]= false
					maze[y][x]= false
					nextX = x-2
				else
					index = index + 1
				end
			end			
			if nextX ~= x or nextY ~= y then
				x = nextX
				y = nextY
				visited[y][x] = true
				tinsert(stack,{x=x,y=y})
			else    
				x = stack[getn(stack)].x
				y = stack[getn(stack)].y
				tremove(stack,getn(stack))
			end
		end
	end
	Create(2*height, 2, width, height)
	
	--PRINT FINAL MAZE
	local MazeString = ""
	for y = 1,height*2+1,1 do
		for x = 1,width*2+1,1 do
			if maze[y][x] then
				MazeString = MazeString .. "#"
				local ObjectName1 = GetUnitName()
				local ObjectName2 = GetUnitName()
				ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", ObjectName1, objectType, "PlyrCivilian/teamPlyrCivilian",{startX+x*20+40*x, startY+y*20+40*y, 0}, 0)
				ExecuteAction("UNIT_SPAWN_NAMED_LOCATION_ORIENTATION", ObjectName2, objectType, "PlyrCivilian/teamPlyrCivilian",{startX+x*20+40*x+20, startY+y*20+40*y, 0}, 0)
				ExecuteAction("NAMED_KILL", ObjectName1)
				ExecuteAction("NAMED_KILL", ObjectName2)
			else
				MazeString = MazeString .. " "
			end
		end
		MazeString = MazeString .. "\n"
	end
	ExecuteAction("PLAYER_SET_BASE_POWER", "PlyrCivilian", 1000000)
	--ExecuteAction("TEAM_CHANGE_OBJECT_STATUS", "PlyrCivilian/teamPlyrCivilian", GetObjectStatus("NO_COLLISIONS"), 1)
	--ExecuteAction("TEAM_CHANGE_OBJECT_STATUS", "PlyrCivilian/teamPlyrCivilian", GetObjectStatus("NO_COLLISIONS"), 0)	
	print(MazeString)
end


--CreateMaze("NODObelisk", 60, 60, 300, 300)
--"NOD_StrongholdBuilding1"
CreateMaze("NOD_StrongholdBuilding1", 20, 20, 300, 300)
--CreateMaze("ASPSculp03", 10, 10, 300, 300)
--CreateMaze("DCBCargo09", 60, 60, 300, 300)



-- ExecuteAction("NAMED_SET_HELD", ObjectName, 1)
-- ExecuteAction("NAMED_SET_STRICT_CONTROL_ENABLED", ObjectName, 1)
-- ExecuteAction("NAMED_SET_SLEEP_STATUS", ObjectName, 1)
-- ExecuteAction("UNIT_SET_STANCE", ObjectName, "HOLD_POSITION") 
-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ObjectName, "Enabled", 0) 		  
-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ObjectName, "Indestructible", 1)	 
-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ObjectName, "Selectable", 0)	
-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ObjectName, "Player Targetable", 0)	
-- ExecuteAction("UNIT_AFFECT_OBJECT_PANEL_FLAGS", ObjectName, "Unsellable", 0)
-- ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", ObjectName, GetObjectStatus("NO_COLLISIONS"), 0)
-- ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", ObjectName, GetObjectStatus("CAN_NOT_WALK_ON"), 1)
-- ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", ObjectName, GetObjectStatus("BRIDGE_IMPASSABLE"), 1)
-- ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", ObjectName, GetObjectStatus("OCLMONITOR_COMPLETED_TASK"), 1)
-- ExecuteAction("UNIT_CHANGE_OBJECT_STATUS", ObjectName, GetObjectStatus("OCLMONITOR_MONITOR_RELEASED"), 1)