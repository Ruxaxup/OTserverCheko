local tilepos = {x=952, y=1309, z=11, stackpos=0}
local tilepos2 = {x=952, y=1309, z=11, stackpos=1}
local tilepos3 = {x=952, y=1309, z=11, stackpos=2}

function onUse(cid, item, frompos, item2, topos)

local tile = getThingfromPos(tilepos)
local tile2 = getThingfromPos(tilepos2)
local tile3 = getThingfromPos(tilepos3)

if (item.uid == 10224 and item.itemid == 1945 and tile.itemid == 598) then
doRemoveItem(tile2.uid,1)
doRemoveItem(tile3.uid,1)
doTransformItem(tile.uid,5770)
doTransformItem(item.uid,1946)

elseif (item.uid == 10224 and item.itemid == 1946) then
doTransformItem(tile.uid,598)
		doCreateItem(4810,1,tilepos2)
		doCreateItem(4808,1,tilepos3)
doTransformItem(item.uid,1945)
	else
		doPlayerSendCancel(cid,"Sorry, not possible.")
	end
   return 1
end
