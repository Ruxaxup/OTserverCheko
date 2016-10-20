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
		--addEvent(removeBrigandTeleport, 30 * 1000, tpPosition)
		addEvent(removeBrigandTeleport, 0, tpPosition, 10)
	end
	return true
end

function removeBrigandTeleport(pos, segundos)
	if(segundos == 0) then
		if getThingfromPos(pos).itemid == 1387 then
			doRemoveItem(getThingfromPos(pos).uid,1)
			doSendMagicEffect(pos, CONST_ME_POFF)
		end
	else
		local textColor = TEXTCOLOR_GREEN		
			
		if(segundos > 10 and segundos < 20) then
			textColor = TEXTCOLOR_YELLOW
		elseif(segundos < 10) then
			textColor = TEXTCOLOR_RED
		end
		doSendAnimatedText(pos, segundos, textColor)
		addEvent(removeBrigandTeleport,1000,pos, segundos - 1)
	end
	return TRUE
end