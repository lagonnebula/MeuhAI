--------------------------------------------------
-- Fast attack Mod by Des, aka Zenia-chan
--------------------------------------------------
-- Your Homunculus will move while attacking
-- and can attack faster. However, it will not
-- recover HP/SP while attacking, due to these
-- movements.
--------------------------------------------------

HomunS = false
OldHomunType = LIF
--------------------------------------------------
function ModInit()
-- plugin initialization
--------------------------------------------------
	StdOnATTACK_ST = OnATTACK_ST
	OnATTACK_ST = FastOnATTACK_ST

end

--------------------------------------------------
function FastOnATTACK_ST()
--------------------------------------------------
	local zx, zy = GetV( V_POSITION, MyEnemy )
	StdOnATTACK_ST ()
	Move(MyID,zx+1,zy)
	Move(MyID,zx-1,zy)
	StdOnATTACK_ST ()
	Move(MyID,zx,zy+1)
	Move(MyID,zx,zy-1)
end
