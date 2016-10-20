local obsPos1 = {x = 1098, y = 802, z = 14}
local obsPos2 = {x = 1099, y = 802, z = 14}
local obsPos3 = {x = 1100, y = 802, z = 14}
local obsPos4 = {x = 1101, y = 802, z = 14}
--local obstaclePos = {x = 1593, y = 1016, z = 8}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 10302 and item.itemid == 9825) then -- Primer Columna
		local obstacle = getTileItemById(obsPos1, 9788).uid
		if(obstacle > 0) then
			doRemoveItem(obstacle,1)
			doCreatureSay(cid,"I heard something coming from south east...",MESSAGE_EVENT_ORANGE)
		end
	elseif(item.uid == 10302 and item.itemid == 9826) then
		local obstacle = getTileItemById(obsPos1, 9788).uid
		if(obstacle == 0) then
			doRelocate(obsPos1, obsPos1)
           	doCreateItem(9788, 1, obsPos1)
			--doCreatureSay(cid,"I heard something upstairs... I should take a look.",MESSAGE_EVENT_ORANGE)
		end

	elseif(item.uid == 10303 and item.itemid == 9825) then -- Segunda Columna
		local obstacle = getTileItemById(obsPos2, 9789).uid
		if(obstacle > 0) then
			doRemoveItem(obstacle,1)
			doCreatureSay(cid,"I heard something coming from south east...",MESSAGE_EVENT_ORANGE)
		end
	elseif(item.uid == 10303 and item.itemid == 9826) then
		local obstacle = getTileItemById(obsPos2, 9789).uid
		if(obstacle == 0) then
			doRelocate(obsPos2, obsPos2)
           	doCreateItem(9789, 1, obsPos2)
			--doCreatureSay(cid,"I heard something upstairs... I should take a look.",MESSAGE_EVENT_ORANGE)
		end

	elseif(item.uid == 10304 and item.itemid == 9825) then -- Tercera Columna
		local obstacle = getTileItemById(obsPos3, 9790).uid
		if(obstacle > 0) then
			doRemoveItem(obstacle,1)
			doCreatureSay(cid,"I heard something coming from north east...",MESSAGE_EVENT_ORANGE)
		end
	elseif(item.uid == 10304 and item.itemid == 9826) then
		local obstacle = getTileItemById(obsPos3, 9790).uid
		if(obstacle == 0) then
			doRelocate(obsPos3, obsPos3)
           	doCreateItem(9790, 1, obsPos3)
			--doCreatureSay(cid,"I heard something upstairs... I should take a look.",MESSAGE_EVENT_ORANGE)
		end

	elseif(item.uid == 10305 and item.itemid == 9825) then -- Cuarta Columna
		local obstacle = getTileItemById(obsPos4, 9791).uid
		if(obstacle > 0) then
			doRemoveItem(obstacle,1)
			doCreatureSay(cid,"I heard something coming from north east...",MESSAGE_EVENT_ORANGE)
		end
	elseif(item.uid == 10305 and item.itemid == 9826) then
		local obstacle = getTileItemById(obsPos4, 9791).uid
		if(obstacle == 0) then
			doRelocate(obsPos4, obsPos4)
           	doCreateItem(9791, 1, obsPos4)
			--doCreatureSay(cid,"I heard something upstairs... I should take a look.",MESSAGE_EVENT_ORANGE)
		end
	
	end --If principal
end