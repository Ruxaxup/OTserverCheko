function getStringFromBoolean(var)
	if var then
		return "true"
	else
		return "false"
	end
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local info = getTileInfo(toPosition)	

	if info ~= nil then
		if info ~= true and info ~= false then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE,
	 			"--protection: " .. getStringFromBoolean(info.protection) .. " --nologout: " .. getStringFromBoolean(info.nologout) .. " --refresh: " .. getStringFromBoolean(info.refresh) .. " --house: " .. getStringFromBoolean(info.house) .. " --trashed: " .. getStringFromBoolean(info.trashed) .. " --Items: " .. info.things)
		end

	end
	
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "--Count: " .. itemEx.type)
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "--Distance: " .. getDistanceBetween(getCreaturePosition(cid),toPosition))
	return true
end