NAME	 	= "Resource Race"
VERSION		= "1.0"
TYPE		= "GAMEMODE"
GAME		= "ANY"
DESCRIPTION = "The first Player that gains 30k resources wins.\nThis gamemode is inspired by the LodR Battle for Middle Earth Xbox exclusive gamemode."
AUTHOR 		= "Mjstral"
PASTEBIN	= ""

-----------------------------------------------------------------
----------------------SCRIPT SECTION-----------------------------
-----------------------------------------------------------------

GAMEMODE = "RESOURCERACE"

ExecuteAction("SHOW_MILITARY_CAPTION", "APT:Resources", 10)
ExecuteAction("DISPLAY_TEXT", "APT:GameMode")

RESOURCES_TO_WIN = 30000
TIME_LIMIT = 600

MONEY = {}

function InitGamemode()
	for i=1,getn(Players),1 do
		MONEY[Players[i]] = GetPlayerMoney(Players[i])
		--MONEY[Players[i]] = RESOURCES_TO_WIN
		SetCounter(Player .. "_COUNTER", RESOURCES_TO_WIN-MONEY[Players[i]], "NUMBER:" .. strsub(Player,8,8))	
	end
	--SetTimerCounter(value, text, counter)
	SetCounter("TIMER", TIME_LIMIT, "APT:Time")
	SetScriptTimer(1,ResourceRace_Coroutine,-1)
	MONEY_MAX = 0
end

function GetPlayerMoney(Player)
	ExecuteAction("SET_PLAYER_MONEY_TO_COUNTER", Player, Player .. "_Money")
	return GetCounterValue(Player .. "_Money")
end

function SetWinnerPlayer(WINNER_PLAYER)
	for i=1,getn(Players),1 do
		if Players[i] ~= WINNER_PLAYER then
			ExecuteAction("PLAYER_KILL", Players[i])
		end
	end	
end

function ResourceRace_Coroutine()
	for i=1,getn(Players),1 do
		MONEY[Players[i]] = GetPlayerMoney(Players[i])
		SetCounter(Player .. "_COUNTER", RESOURCES_TO_WIN-MONEY[Players[i]], "NUMBER:" .. strsub(Player,8,8))
		if MONEY[Players[i]] >= RESOURCES_TO_WIN then
			WINNER_PLAYER = Players[i]
			SetWinnerPlayer()
		end
	end
	TIME_LIMIT = TIME_LIMIT - 1
	ExecuteAction("COUNTER_MATH_COUNTER", "TIMER", MathOpTable["Subtract"], CounterTable[1])
	--SetCounter("TIMER", TIME_LIMIT, "APT:Time")
	CountdownSpeechCheck(TIME_LIMIT)
	if TIME_LIMIT <= 0 then
		for i=1,getn(Players),1 do
			if MONEY[Players[i]] >= MONEY_MAX then
				WINNER_PLAYER = Players[i]
			end
		end
		SetWinnerPlayer(WINNER_PLAYER)
	end
end

InitGamemode()
