function onSay(cid, words, param, channel)
	param = tonumber(param)
	if(not param or param < 0 or param > 69) then
		doPlayerSendCancel(cid, "Numeric param may not be lower than 0 and higher than 69.")
		return true
	end

	doSendMagicEffect(getCreaturePosition(cid), param)
	return true
end
