
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(itemEx ~= nil) then
		if (addAttack(cid,itemEx,1))then
			doRemoveItem(item.uid, 1)
		end
	end
	return true
end