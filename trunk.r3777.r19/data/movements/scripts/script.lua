function onStepIn(cid, item, position, fromPosition)	

local newnPosition = {x=834, y=1379, z=8}	
local tilepos1 = {x=837, y=1425, z=8}
local tilepos2 = {x=839, y=1425, z=8}
local tilepos5 = {x=838, y=1424, z=8}
local tilepos3 = {x=837, y=1422, z=8}
local tilepos4 = {x=838, y=1422, z=8}
local tilepos6 = {x=839, y=1422, z=8}
local tilepos7 = {x=837, y=1423, z=8}
local tilepos8 = {x=838, y=1423, z=8}
local tilepos9 = {x=839, y=1423, z=8}

doTeleportThing(cid, newnPosition)		doSendMagicEffect(position, CONST_ME_TELEPORT)	doSendMagicEffect(pos, CONST_ME_TELEPORT)		doSendMagicEffect(tilepos5,15)	doSendMagicEffect(tilepos1,5)		doSendMagicEffect(tilepos2,5)		doSendMagicEffect(tilepos3,5)		doSendMagicEffect(tilepos4,5)		doSendMagicEffect(tilepos6,5)		doSendMagicEffect(tilepos7,5)		doSendMagicEffect(tilepos8,5)		doSendMagicEffect(tilepos9,5)		setPlayerStorageValue(cid, 1883, 1)		doCreatureSay(cid, 'You succesfully destroyed the Shadow Nexus', 19, false, cid)	end