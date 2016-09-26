-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5991 then
   		queststatus = getPlayerStorageValue(cid,5991)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Royal Axe.")
   			doPlayerAddItem(cid,7434,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		   	   		end
	else
		return 0
   	end

   	return 1
end
