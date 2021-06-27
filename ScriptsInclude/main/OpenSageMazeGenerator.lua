NAME	 	= "Maze Generator"
VERSION		= "1.0"
TYPE		= "DISABLED"--"CONFIG"
GAME		= "OpenSage"
DESCRIPTION = "Generates a random maze"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

--USEAGE: 
--	dofile("C:\\OpenSageMazeGenerator.lua") 
--	CreateMaze("AmericaPatriotBattery", 15, 15, 900, 100)

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

function CreateMaze(objectType, width, height, startX, startY)
	--randomseed(string.gsub(string.gsub(os.date(),"%p", ""),"%s",""))
	
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
	
	--CREATE MAZE
	function Create(x, y, width,height)
		local stack = {}
		local directions = {"North","East","South","West"}
		visited[y][x] = true
		maze[y][x] = false
		tinsert(stack,{x=x,y=y})
		
		while #stack > 0 do
			local index = 1
			local nextX = x
			local nextY = y
			
			for i = #directions, 2, -1 do
				local r = random(1,i)
				directions[i], directions[r] = directions[r], directions[i]
			end
			
			while index <= #directions and nextX == x and nextY == y do
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
				x = stack[#stack].x
				y = stack[#stack].y
				tremove(stack,#stack)
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
				--VERTICAL: Spawn2("AmericaPatriotBattery", 0+x*20, 800, y*20, 0)
				Spawn2("AmericaPatriotBattery", startX+y*20, startY+x*20, 0, 0)
			else
				MazeString = MazeString .. " "
			end
		end
		MazeString = MazeString .. "\n"
	end
	print(MazeString)
end

--CreateMaze("AmericaPatriotBattery", 15, 15, 900, 100)

