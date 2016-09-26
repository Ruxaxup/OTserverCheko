local teleportPosition = {x = 1046, y = 694, z =7}
local tpID = 1387


function onKill(cid, target, lastHit)

	local name = string.lower(getCreatureName(target))
	if (name == "brigand") then	
		--local tpPosition	= getClosestFreeTile(cid, getCreaturePosition(cid), true, false)
		local tpPosition = getCreaturePosition(target)
		tpPosition.stackpos = 1
		teleport = doCreateTeleport(tpID, teleportPosition, tpPosition)
		doItemSetAttribute(teleport, "aid", 1000)
		doSendAnimatedText(tpPosition, "Secret...",TEXTCOLOR_YELLOW)
		addEvent(removeBrigandTeleport, 30 * 1000, tpPosition)
	end
	return true
end

function removeBrigandTeleport(tpPosition)
	if getThingfromPos(tpPosition).itemid == 1387 then
		doRemoveItem(getThingfromPos(tpPosition).uid,1)
		doSendMagicEffect(tpPosition, CONST_ME_POFF)	
		return TRUE
	end

end