NAME	 	= "Lua Savegame 2"
VERSION		= "1.0"
TYPE		= "DISABLED"
GAME		= "CNC3"
DESCRIPTION = "This is an example gamemode template"
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

-- Copyright (c) 2001 by Peter Prade - all rights reserved

-- this file introduces a new table "type" that is persistent between sessions
-- each entry in such a table will be saved as a seperate file which 
-- returns the value when executed with dofile

-- tag methods are used to keep those files up to date and to load values that
-- are not yet loaded

-- todo: make all the globals local
persistent_tag = newtag()
persistent_location = {} -- lookup table for locations of each persistent table
persistent_delimiter = "." -- how to delimit one index from another in filenames
persistent_debug = nil -- set to non-nil for debugging output

-- we need to convert any type index to a string (which we use for the location)
function index_to_string(index)
  if type(index) == "string" then
    return index
  end
  if type(index) == "number" then
    return "-"..tostring(index)
  end
  
  -- todo: at least allow persistent tables as indizes (via links ;-)
  print("cannot make indexstring from type: "..type(index)) 
  return nil
end

-- loads a value from the given location
function persistent_load(location)
  if persistent_debug then print("load from", location) end
  local value = dofile(location)
  if type(value) == "table" then
    make_persistent(value, location)
  end
  return value
end

-- save a value to the given location
function persistent_save(location, value)
  local string_to_save = ""
  -- todo: check if old value was a table, and if so, delete old contents
  if type(value) == "nil" then
    string_to_save = "return nil" -- todo: better delete file
  elseif type(value) == "table" then
    make_persistent(value, location)
    string_to_save = "return {}"
  elseif type(value) == "string" then
    string_to_save = "return \""..value.."\""
  elseif type(value) == "number" then
    string_to_save = "return "..value..""
  else
    -- todo: at least functions can be saved as chunks
    print("cannot save type "..type(value).." yet!") 
    return
  end
  -- todo: if we want to build a directory tree (using a delimiter of "/") 
  -- we need to create the directories here: create_path(location)
  if persistent_debug then print("save to", location) end
  local f = openfile(location,"w")
  write(f, string_to_save)
  closefile(f)
end

-- tag method for reading from persistent tables
function persistent_get(table, index)
  local value = rawget(table, index)
  if value == nil then	
    local index_string = index_to_string(index)
    if index_string then
      value = persistent_load(persistent_location[table]..
                  persistent_delimiter..index_string)
      rawset(table, index, value)
    end
  end
  return value
end

-- tag method for writing to persistent tables
function persistent_set(table, index, value)
  rawset(table, index, value) -- todo: if i overwrite a table here, free it!
  local index_string = index_to_string(index)
  if index_string then
    persistent_save(persistent_location[table]..
              persistent_delimiter..index_string, value)
  end
end

-- activate tag methods
settagmethod (persistent_tag, "gettable", persistent_get)
settagmethod (persistent_tag, "settable", persistent_set)

-- you only need to call this once for your "root" persistent table.
-- but you can make as many tables persistent as you like 
-- (as long as those tables are stored at different locations)
-- any table within this table will be made persistent as well
function make_persistent(table,location)
  if tag(table)~=persistent_tag then
    persistent_location[table] = location
    settag(table,persistent_tag)
    for index,value in table do
      persistent_set(table,index,value) -- rewrite table contents
    end
  else
    if persistent_location[table] ~= location then
      print("table with location of", persistent_location[table])
      print("reused at",location)
      print("-> cannot store other than simple trees yet!")
      -- todo: store links to other location...
    end
  end
end

---------------------------------------------------------------------

make_persistent(globals(),"C:\\Users\\Maxi\\source\\repos\\sage-meta-tool\\sage-meta-tool-d3d9-wrapper\\SageLua\\SAVEGAMES\\")



-- use any directory you'd like as "root": (just make sure the directory 
-- exists, as i cannot create it with just the baselib)
-- persistent_root = "~/persistent_lua/" 

-- -- make a table persistent for testing:
-- persistent = {}
-- make_persistent(persistent,persistent_root)

-- -- works also nice: make_persistent(globals(),"C:/Anywhere/")

-- -- now let's do some fancy testing.
-- -- any contents of the table "persistent" will also be kept as files

-- if persistent.test == nil then
  -- persistent.test = "hello!"
  -- persistent.table = {"hello!","world!";x=1,y=999}
-- end

-- print(persistent.test, persistent.table[2], persistent.table.y)

-- for i = 1,20 do
  -- print(persistent.table[i])
-- end

-- for i = 1,10 do
  -- -- watch the strings grow every time you call this file:
  -- persistent.table[i] = tostring(persistent.table[i])..tostring(i)
-- end
-- for i = 11,20 do
  -- persistent.table[i] = i
-- end
-- for i = 8,12 do
  -- persistent.table[i] = nil
-- end

-- persistent.table.parent = persistent -- doesn't work correctly yet.