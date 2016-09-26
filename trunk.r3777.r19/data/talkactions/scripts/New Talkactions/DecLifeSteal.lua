function onSay(cid, words, param, channel)
	local player = getPlayerByNameWildcard(param)
	if (player ~= nil) then
		doPlayerDecreaseLifeStealPoint(player)
	else
		doPlayerSendCancel(cid, "Offline player or invalid name.")
	end
	return true
end