NAME	 	= "Lua Savegame"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "DISABLED"
DESCRIPTION = "This is an example gamemode template"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------
function GetSaveIdentID()
	local SaveID = GetFrame() + ObjectCounter
	local ObjectCounter = 0
	for k,v in globals() do
		if strfind(k, "ObjID") then
			ObjectCounter = ObjectCounter + 1
		end
	end
	return SaveID
end

function SaveLuaState(savepath)
	local Save =  ""
	for index,value in globals() do
		if type(value) == "number" then
			Save = Save .. index .. " = " .. value .."\n"
		elseif type(value) == "string" then
			if strfind(value,"\\") or strfind(value,"\n") then
				Save = Save .. index .. " = " .. strrep(strchar(91),2) .. value .. strrep(strchar(93),2) .. "\n"
			else
				Save = Save .. index .. " = " .. "'" .. value .. "'" .. "\n"
			end
		elseif type(value) == "table" and not strfind(index,"ObjID") then
			Save = Save .. index .. " = {"
			for t_index,t_value in value do
				if type(t_value) == "number" then
					if type(t_index) == "number" then
						Save = Save .. "\t[" .. t_index .. "]=" .. t_value .. ","
					elseif type(t_index) == "string" then
						Save = Save .. "\t['" .. t_index .. "']=" .. t_value .. ","
					end
				elseif type(t_value) == "string" then
					if type(t_index) == "number" then
						Save = Save .. "\t[" .. t_index .. "]='" .. t_value .. "',"
					elseif type(t_index) == "string" then
						Save = Save .. "\t['" .. t_index .. "']='" .. t_value .. "',"
					end		
				else
					--Save = Save .. "\n\t['" .. t_index .. "']=" .. t_value .. ","
				end
			end
			Save = Save .. "}\n" 
		end
	end
	local filehandle = openfile(savepath, 'w')
	if filehandle ~= nil then
		write(filehandle, Save)
		flush(filehandle)
		closefile(filehandle)	
	end
end

--SaveLuaState("C:\\Users\\Maxi\\Documents\\Command & Conquer 3 Kane's Wrath\\Meta\\SAVEGAMES\\SAVE1.LUA")