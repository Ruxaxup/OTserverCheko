function onSay(cid, words, param, channel)
	local player = getPlayerByNameWildcard(param)
	if (player ~= nil) then
		doPlayerAddStatPoint(player)
	else
		doPlayerSendCancel(cid, "Offline player or invalid name.")
	end

end