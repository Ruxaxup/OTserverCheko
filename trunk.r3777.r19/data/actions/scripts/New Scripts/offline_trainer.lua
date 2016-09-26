-- Offline trainers by Hauni :] 
function onUse(cid, item, frompos, item2, topos)

	local 	accid 		= 	getAccountNumberByPlayerName(getCreatureName(cid))
	local 	name 		= 	getCreatureName(cid)
	local   statueIDs	=  { [8834]=SKILL__MAGLEVEL, [3739]=SKILL_DISTANCE,[8626]=SKILL_CLUB, [1449]=SKILL_AXE,[1448]=SKILL_SWORD}

	if statueIDs[item.itemid] then
		--doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, accid .. " -- " .. name .. " -- " .. statueIDs[item.itemid] .. ".")
		
		--db.executeQuery("INSERT INTO offline_training (`account_id`,`name`,`start_training`,`type`) VALUES(".. accid ..",'".. name .."',".. os.time()..",'".. statueIDs[item.itemid] .." ');")
		print("> Player: " .. name .. " is offline training.")
		doPlayerSetStorageValue(cid, OFFLINE_TRAINING, statueIDs[item.itemid])
		doPlayerSetStorageValue(cid, OFFLINE_TRAINING_TIME, os.time())
		doRemoveCreature(cid)
    	return TRUE
    end
end