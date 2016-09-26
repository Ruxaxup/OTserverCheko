function onDeath(cid, corpse, killer)

	registerCreatureEvent(cid, "inquisitionPortals")

	local creaturename = getCreatureName(cid)
	
--- positions where the teleports will be created:

	local ushuriel_in_pos = {x=970, y=1420, z=8, stackpos=2} 
	local annihilon_in_pos = {x=1001, y=1383, z=8, stackpos=2} 
	local hellgorak_in_pos = {x=943, y=1382, z=8, stackpos=2} 
	local madareth_in_pos = {x=998, y=1446, z=8, stackpos=2} 
	local zugurosh_in_pos = {x=974, y=1382, z=8, stackpos=2} 
	local brothers_in_pos = {x=967, y=1438, z=8, stackpos=2}

--- positions where the teleports will be teleported you:

	local ushuriel_to_pos = {x=997, y=1314, z=11, stackpos=1}
	local annihilon_to_pos = {x=775, y=1469, z=11, stackpos=1}  
	local hellgorak_to_pos = {x=833, y=1403, z=8, stackpos=1} 
	local madareth_to_pos = {x=1100, y=1478, z=8, stackpos=1} 
	local zugurosh_to_pos = {x=1157, y=1382, z=11, stackpos=1} 
	local brothers_to_pos = {x=892, y=1329, z=8, stackpos=1}

	local time_to_pass = 180 -- in seconds
	local tpID = 1387
	local doEffect = CONST_ME_TELEPORT
	local message = "You now have 3 minutes to exit this room through the teleporter. It will bring you to the next room only during his time or the teleporter will disappear"

	if creaturename == 'Ushuriel' then
			print(creaturename)
			teleport = doCreateTeleport(tpID, ushuriel_to_pos, ushuriel_in_pos)

			doSendMagicEffect(ushuriel_in_pos, doEffect)

			doCreatureSay(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInUshurielWard, (180*time_to_pass))

	elseif creaturename == 'Annihilon' then

			teleport = doCreateTeleport(tpID, annihilon_to_pos, annihilon_in_pos)

			doSendMagicEffect(annihilon_in_pos, doEffect)

			doCreatureSay(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInAnnihilonWard, (180*time_to_pass))

	elseif creaturename == 'Madareth' then

			teleport = doCreateTeleport(tpID, madareth_to_pos, madareth_in_pos)

			doSendMagicEffect(madareth_in_pos, doEffect)

			doCreatureSay(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInMadarethWard, (180*time_to_pass)) 

	elseif creaturename == 'Hellgorak' then

			teleport = doCreateTeleport(tpID, hellgorak_to_pos, hellgorak_in_pos)

			doSendMagicEffect(hellgorak_in_pos, doEffect)

			doCreatureSay(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInHellgorakWard, (180*time_to_pass)) 

	elseif creaturename == 'Zugurosh' then

			teleport = doCreateTeleport(tpID, zugurosh_to_pos, zugurosh_in_pos)

			doSendMagicEffect(zugurosh_in_pos, doEffect)

			doCreatureSay(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInZuguroshWard, (180*time_to_pass))

	elseif creaturename == 'Latrivan' then

			teleport = doCreateTeleport(tpID, brothers_to_pos, brothers_in_pos)

			doSendMagicEffect(brothers_in_pos, doEffect)

			doCreatureSay(cid, message, TALKTYPE_ORANGE_1)

			addEvent(removeTeleportInBrothersWard, (180*time_to_pass))

	elseif creaturename == 'Brigand' then
		local param = {}		
		tpPosition	= getClosestFreeTile(cid, getCreaturePosition(cid), true, false)
		tpPosition.stackpos = 2
		param.pos = tpPosition
		teleport = doCreateTeleport(tpID, teleportPosition, tpPosition)
		doSendAnimatedText(tpPosition, "Secret...",TEXTCOLOR_YELLOW)
		addEvent(removeBrigandTeleport, 30, param)
	
	end 
end

function removeTeleportInUshurielWard()
	if getThingfromPos({x=970, y=1420, z=8, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({970, y=1420, z=8, stackpos=2}).uid,1)
	doSendMagicEffect({970, y=1420, z=8, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInAnnihilonWard()
	if getThingfromPos({x=1001, y=1383, z=8, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=1001, y=1383, z=8, stackpos=2}).uid,1)
	doSendMagicEffect({x=1001, y=1383, z=8, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInHellgorakWard()
	if getThingfromPos({x=943, y=1382, z=8, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=943, y=1382, z=8, stackpos=2}).uid,1)
	doSendMagicEffect({x=943, y=1382, z=8, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInMadarethWard()
	if getThingfromPos({x=998, y=1446, z=8, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=998, y=1446, z=8, stackpos=2}).uid,1)
	doSendMagicEffect({x=998, y=1446, z=8, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInZuguroshWard()
	if getThingfromPos({x=974, y=1382, z=8, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=974, y=1382, z=8, stackpos=2}).uid,1)
	doSendMagicEffect({x=983, y=1391, z=7, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end

function removeTeleportInBrothersWard()
	if getThingfromPos({x=967, y=1438, z=8, stackpos=2}).itemid == 1387 then
	doRemoveItem(getThingfromPos({x=967, y=1438, z=8, stackpos=2}).uid,1)
	doSendMagicEffect({x=967, y=1438, z=8, stackpos=1}, CONST_ME_POFF)
	return TRUE
	end
end 

function removeBrigandTeleport(param)
	if getThingfromPos(param.position).itemid == 1387 then
		doRemoveItem(getThingfromPos(param.position).uid,1)
		doSendMagicEffect(param.position, CONST_ME_POFF)	
		return TRUE
	end
end