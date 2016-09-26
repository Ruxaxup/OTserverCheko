function onSay(cid, words, param, channel)
	local tile = string.explode(param, ",")

	if(tile ~= nil) then
		if(tile[2]) then
			local player = getPlayerByNameWildcard(tile[1])
			local points = tile[2]
			if(player ~= nil) then
				if(not doPlayerSetStatPoint(player, points)) then
					doPlayerSendCancel(cid, "Couldn't add stats.")
				end
			end
		end
	end

	return TRUE

end