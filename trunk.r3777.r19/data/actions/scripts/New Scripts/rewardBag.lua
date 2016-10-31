function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

local function getBossName(description)
	local tokens = string.explode(description, "%.")
	return tokens[3]
end

local function generateLoot(cid, creatureName)
	local info = getMonsterInfo(creatureName)
	local lootList = info.loot
	local str = ""
	local reward = {}	
	local playerCap = getPlayerFreeCap(cid)
	local rewardWeight = 17 --backpackWeight
	
	for i = 1, #lootList do
		--print("Item("..lootList[i].id.."): " .. getItemNameById(lootList[i].id) ..", Chance: ".. (lootList[i].chance / 1000) .. "%, Count: "..lootList[i].count)	
		local chance = math.random(0, 100)
		local count = math.random(1,lootList[i].count)
		if(chance < (lootList[i].chance / 1000)) then
			local object = {id=lootList[i].id,c=count}
			table.insert(reward, object)
			rewardWeight = rewardWeight + getItemWeightById(lootList[i].id,count,true)
			--doPlayerAddItem(cid, lootList[i].id, count, true)
			str = str .. count .. " ".. getItemNameById(lootList[i].id)
			if(i ~= #lootList) then
				str = str .. ", "
			end
		end		
	end
	if(playerCap < rewardWeight) then
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Your reward weighs "..string.format("%.2f",rewardWeight).." oz. It\'s too heavy.")
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
	else
		local backpack = doPlayerAddItem(cid, 10522, 1)
		addDescription(backpack, "You got this backpack by defeating "..creatureName ..".")
		for _,oid in ipairs(reward) do
			doAddContainerItem(backpack, oid.id, oid.c)
		end
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You got " .. str .. ". Congratulations!")
		doPlayerRemoveItem(cid, REWARD_BAG_ID, 1)
	end
	
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local description = getItemAttribute(item.uid, "description")	
	generateLoot(cid, getBossName(description))
	return false
end