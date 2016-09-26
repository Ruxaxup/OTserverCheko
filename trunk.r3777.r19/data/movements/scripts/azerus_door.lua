function onStepIn(cid, item, pos)
	if isPlayer(cid) == TRUE then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "It seems by defeating Azerus you have stoped this army from entering your world! Better leave this ghastly place forever.")
		setPlayerStorageValue(cid, 4765, 1)
	return TRUE
end
end