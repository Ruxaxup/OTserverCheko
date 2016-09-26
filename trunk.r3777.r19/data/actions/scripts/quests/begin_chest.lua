-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5952 then
   		queststatus = getPlayerStorageValue(cid,5952)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Blue Robe.")
   			doPlayerAddItem(cid,2656,1)
   			setPlayerStorageValue(cid,5952,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5951 then
   		queststatus = getPlayerStorageValue(cid,5951)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Tribal Mask.")
   			doPlayerAddItem(cid,3967,1)
   			setPlayerStorageValue(cid,5951,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5950 then
   		queststatus = getPlayerStorageValue(cid,5950)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Tusk Shield.")
   			doPlayerAddItem(cid,3973,1)
   			setPlayerStorageValue(cid,5950,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5949 then
   		queststatus = getPlayerStorageValue(cid,5949)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Vampire Shield.")
   			doPlayerAddItem(cid,2534,1)
   			setPlayerStorageValue(cid,5949,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5948 then
   		queststatus = getPlayerStorageValue(cid,5948)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Lighting Boots.")
   			doPlayerAddItem(cid,7893,1)
   			setPlayerStorageValue(cid,5948,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5947 then
   		queststatus = getPlayerStorageValue(cid,5947)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Lighting Legs.")
   			doPlayerAddItem(cid,7895,1)
   			setPlayerStorageValue(cid,5947,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5946 then
   		queststatus = getPlayerStorageValue(cid,5946)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Lavor Armor.")
   			doPlayerAddItem(cid,8877,1)
   			setPlayerStorageValue(cid,5946,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

elseif item.uid == 5945 then
   		queststatus = getPlayerStorageValue(cid,5945)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Serpent Coat.")
   			doPlayerAddItem(cid,8877,1)
   			setPlayerStorageValue(cid,5945,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
elseif item.uid == 5944 then
   		queststatus = getPlayerStorageValue(cid,5944)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Ironworker.")
   			doPlayerAddItem(cid,8853,1)
   			setPlayerStorageValue(cid,5944,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
elseif item.uid == 5943 then
   		queststatus = getPlayerStorageValue(cid,5943)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Crystal Wand.")
   			doPlayerAddItem(cid,2184,1)
   			setPlayerStorageValue(cid,5943,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end



elseif item.uid == 5942 then
   		queststatus = getPlayerStorageValue(cid,5942)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Elvish Bow.")
   			doPlayerAddItem(cid,7438,1)
   			setPlayerStorageValue(cid,5942,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
elseif item.uid == 5941 then
   		queststatus = getPlayerStorageValue(cid,5941)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Solar Axe.")
   			doPlayerAddItem(cid,8925,1)
   			setPlayerStorageValue(cid,5941,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
elseif item.uid == 5940 then
   		queststatus = getPlayerStorageValue(cid,5940)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Terra Hood.")
   			doPlayerAddItem(cid,7903,1)
   			setPlayerStorageValue(cid,5940,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
elseif item.uid == 63547 then
   		queststatus = getPlayerStorageValue(cid,63547)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Golden Helmet.")
   			doPlayerAddItem(cid,2471,1)
   			setPlayerStorageValue(cid,63547,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end

	else
		return 0
   	end

   	return 1
end
