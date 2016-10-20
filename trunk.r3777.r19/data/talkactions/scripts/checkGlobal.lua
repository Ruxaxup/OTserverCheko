
function onSay(cid, words, param, channel)
	local questID = tonumber(param)
	
	if(not questID) then
		return true
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "GLOBAL ["..param.."] = "..getGlobalStorageValue(param)) 

	return true
end
