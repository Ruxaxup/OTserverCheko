-- dwarfs chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6664 then
   		queststatus = getPlayerStorageValue(cid,6664)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Obsidian Knife.")
   			doPlayerAddItem(cid,5908,1)
   			setPlayerStorageValue(cid,6664,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 6665 then
   		queststatus = getPlayerStorageValue(cid,6665)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Yalahari Armor.")
   			doPlayerAddItem(cid,9776,1)
   			setPlayerStorageValue(cid,6665,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	else
		return 0
   	end

   	return 1
end
