local playerPosition =
{
	{x = 247, y = 72, z = 7, stackpos = STACKPOS_TOP_CREATURE},
	{x = 246, y = 72, z = 7, stackpos = STACKPOS_TOP_CREATURE},
	{x = 245, y = 72, z = 7, stackpos = STACKPOS_TOP_CREATURE},
	{x = 244, y = 72, z = 7, stackpos = STACKPOS_TOP_CREATURE}
}

local newPosition =
{
	{x = 247, y = 72, z = 8},
 	{x = 246, y = 72, z = 8},
	{x = 245, y = 72, z = 8},
	{x = 245, y = 72, z = 8}
}

-- Do not modify the declaration lines below.
local player = {0, 0, 0, 0}
local failed = TRUE

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.itemid == 1945 then
		for i = 1, 4 do
			player[i] = getThingfromPos(playerPosition[i])
			if player[i].itemid > 0 then
				if isPlayer(player[i].uid) == TRUE then
					if getPlayerStorageValue(player[i].uid, 30015) == -1 then
						if getPlayerLevel(player[i].uid) >= 100 then
							failed = FALSE
						end
					end
				end
			end

			if failed == TRUE then
				doPlayerSendCancel(cid, "Sorry, not possible.")
				return TRUE
			end

			failed = TRUE
		end

		for i = 1, 4 do
			doSendMagicEffect(playerPosition[i], CONST_ME_POFF)
			doTeleportThing(player[i].uid, newPosition[i], FALSE)
			doSendMagicEffect(newPosition[i], CONST_ME_ENERGYAREA)
		end
		doTransformItem(item.uid, item.itemid + 1)
	elseif item.itemid == 1945 then
		doPlayerSendCancel(cid, "Sorry, not possible.")
	end

	return TRUE
end
