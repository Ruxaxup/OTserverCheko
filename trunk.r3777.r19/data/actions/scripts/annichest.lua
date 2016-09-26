--[[
	Annihaltor Chest's	
	by Maxi (Shawak)
]]--

	config = {
		storage = 5010,
		items = { --     id,count
			item_1 = {2494,1},  -- Demon Armor 
			item_2 = {2400,1},  -- Magic Sword
			item_3 = {2431,1},  -- Stonecutter Axe
			item_4 = {2421,1}   -- Thunder Hammer
		}
	}

function onUse(cid, item, frompos, item2, topos)

   	if getPlayerStorageValue(cid,config.storage) == -1 then
   		if item.uid == 5001 then
			newItem = config.items.item_1[1]
			count = config.items.item_1[2]
   		elseif item.uid == 5002 then
			newItem = config.items.item_2[1]
			count = config.items.item_2[2]
   		elseif item.uid == 5003 then
			newItem = config.items.item_3[1]
			count = config.items.item_3[2]
   		elseif item.uid == 5004 then
			newItem = config.items.item_4[1]
			count = config.items.item_4[2]
		end

		-- MSG  Config -----------------------------------------------------------------------------------------------------------------
		msgEmpty = "It is empty."
		msgGetItem = "You have found "..getItemArticleById(newItem).." "..getItemNameById(newItem).."."
		msgNoCap = "You have found a "..getItemNameById(newItem).." weighing "..getItemWeightById(newItem,count).." oz it is too heavy."
		--------------------------------------------------------------------------------------------------------------------------------

		if getPlayerFreeCap(cid) >= getItemWeightById(newItem,count) then
   			setPlayerStorageValue(cid,config.storage,1)
   			doPlayerAddItem(cid,newItem,count)
   			doPlayerSendTextMessage(cid,21,msgGetItem)
		else
			doPlayerSendTextMessage(cid,21,msgNoCap)
		end
   	else
   		doPlayerSendTextMessage(cid,21,msgEmpty)
   	end
   	return TRUE
end