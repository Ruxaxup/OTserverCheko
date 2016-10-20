local t = {'\nWisdom of Solitude', '\nSpark of the Phoenix', '\nFire of the Suns', '\nSpiritual Shielding', '\nEmbrace of Tibia'}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local r = ''

	for i = 1, 5 do
		if getPlayerBlessing(cid, i) then
			r = r .. t[i]
		end
	end

	return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, r == '' and 'No blessings received.' or 'Received blessings:' .. r)
end