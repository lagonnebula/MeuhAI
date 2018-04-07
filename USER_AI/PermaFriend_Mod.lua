--------------------------------------------------
-- Perma Friend Mod
--------------------------------------------------
-- A mod that fixes the Mir AI's friend system
-- Friends are now permanent.
--------------------------------------------------
-- HOW TO ACTIVATE THIS MOD:
-- 1. open the Control Panel,
-- 2. choose the "Extra" Tab,
-- 3. and select PermaFriend_Mod.lua
--------------------------------------------------
-- Perma Friend Mod by Zenia-chan
-- Mir AI by Miranda Blade
--------------------------------------------------
-- Extra Globals

PERMAFRIENDLIST_FILE = "AI_sakray\\USER_AI\\PermaFriends.txt"

--------------------------------------------------
function ModInit()
-- plugin initialization
--------------------------------------------------
	-- Mir AI function replacement
	FriendList_Save = PermaFriendList_Save

	PermaFriendList_Load()
end

--------------------------------------------------
function PermaFriendList_Load()
--------------------------------------------------
	local f_in = io.open(PERMAFRIENDLIST_FILE, "r")
	if f_in ~= nil then
		FriendList_Clear()
		local ln = f_in:read()
		while ln ~= nil do
			Friends[tonumber(ln)] = tonumber(ln)
			ln = f_in:read()
		end
		f_in:close()
		TraceAI("Perma friend list loaded")
	else
		TraceAI("Cannot load perma friend list")
	end
end

--------------------------------------------------
function PermaFriendList_Save()
--------------------------------------------------
	local f_out = io.open(PERMAFRIENDLIST_FILE, "w")
	if f_out ~= nil then
		for i,v in Friends do
			f_out:write(v .. "\n")
			-- TraceAI(string.format("Friend %d saved", v))
		end
		f_out:close()
		TraceAI("Perma friend list has been saved")
	else
		TraceAI("Cannot save perma friend list")
	end
end
