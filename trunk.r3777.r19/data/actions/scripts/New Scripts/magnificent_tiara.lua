local doorPos = {x = 1585, y = 1027, z = 6, stackpos=0}
--local doorPos = {x = 1593, y = 1016, z = 8}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	print("itemid: "..item.itemid..", action: "..item.actionid..", unique: "..item.uid)
	if(item.uid == 10300) then
		if (getPlayerStorageValue(cid,10300) ~= 1) then
			doPlayerAddItem(cid,2139,1)
			doPlayerSetStorageValue(cid, 10300, 1)
		else
			doPlayerSendTextMessage(cid,22,"It is empty.")
		end		
	elseif(item.uid == 10301 and item.itemid == 9827) then
		if(getPlayerStorageValue(cid,DEVOVORGA_QUEST) > 5)then
			local door = getTileItemById(doorPos, 3515).uid
			print(door)
			if(door > 0) then
				doRemoveItem(door,1)
				doCreatureSay(cid,"I heard something upstairs... I should take a look.",MESSAGE_EVENT_ORANGE)
			end
		else
			doCreatureSay(cid,"This lever is protected by some evil force.",MESSAGE_EVENT_ORANGE)
		end
	elseif(item.uid == 10301 and item.itemid == 9828) then
		if(getPlayerStorageValue(cid,DEVOVORGA_QUEST) > 5)then
			local door = getTileItemById(doorPos, 3515).uid
			print(door)
			if(door == 0) then
				doRelocate(doorPos, doorPos)
               	doCreateItem(3515, 1, doorPos)
				--doCreatureSay(cid,"I heard something upstairs... I should take a look.",MESSAGE_EVENT_ORANGE)
			end
		else
			doCreatureSay(cid,"This lever is protected by some evil force.",MESSAGE_EVENT_ORANGE)
		end
	end
end