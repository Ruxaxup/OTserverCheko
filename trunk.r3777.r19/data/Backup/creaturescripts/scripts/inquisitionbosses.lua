
local config = {
        timeToRemove = 60, -- seconds
		message = "Go into the teleport in 60 seconds, else it will disappear.",
        teleportId = 9773,
        bosses = { -- Monster Name,  Teleport Position
                ["Ushuriel"] = {  pos={ x=2272, y=2330, z=5, stackpos=2 }, aid=7001},
				["Zugurosh"] = {  pos={ x=2306, y=2329, z=5, stackpos=2 }, aid=7002},
				["Madareth"] = {  pos={ x=2269, y=2356, z=5, stackpos=2 }, aid=7003},
                ["Annihilon"] = {  pos={ x=2344, y=2314, z=5, stackpos=2 }, aid=7005},
                ["Hellgorak"] = {  pos={ x=2349, y=2356, z=5, stackpos=2 }, aid=7006}
				},
		brothers ={
        ["Golgordan"] = {pos={ x=2304, y=2360, z=5, stackpos=1 },aid=7004, brother = "Latrivan"},
        ["Latrivan"] = {pos={ x=2304, y=2360, z=5, stackpos=1 },aid=7004, brother = "Golgordan"},
        brothersArea ={
                fromPos = {x = 2293, y = 2350, z = 5},
                toPos = {x = 2314, y = 2372, z = 5}	}	}
}
local function change(position)
	doItemSetAttribute(getTileItemById(position, config.teleportId).uid, "aid", 7200)
    return TRUE
end

function onKill(cid, target, lastHit)
    if(config.bosses[getCreatureName(target)]) then
		local t = config.bosses[getCreatureName(target)]
		local position = t.pos
		doItemSetAttribute(getTileItemById(position, config.teleportId).uid, "aid", t.aid)
        doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
		addEvent(change, config.timeToRemove * 1000, position)
	elseif(config.brothers[getCreatureName(target)]) then
		local t = config.brothers[getCreatureName(target)]
        local brother = getCreatureByName(t.brother)
		if(isMonster(brother) == true) then
            if(isInRange(getCreaturePosition(brother), config.brothers.brothersArea.fromPos, config.brothers.brothersArea.toPos) == true) then
                return TRUE
			end
        else
			local position = t.pos
			doItemSetAttribute(getTileItemById(position, config.teleportId).uid, "aid", t.aid)
			doItemSetAttribute(teleport, "aid", t.aid)
			doCreatureSay(cid, config.message, TALKTYPE_ORANGE_1)
			addEvent(removal, config.timeToRemove * 1000, position)
		end
	end
	return TRUE
end