function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx ~= nil) then
		addAttack(cid,itemEx,1)
	end
	return false
end