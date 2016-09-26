--LIFE_STEAL_PERC = 65003
--MANA_LEECH_PERC = 65004

function onCombat(cid, target)
	if (getPlayerStorageValue(cid,LIFE_STEAL_PERC) == -1) then
		doPlayerSetStorageValue(cid,LIFE_STEAL_PERC,0)
	end

	--local monsterInfo = getMonsterInfo(getCreatureName(target))
	--print("Name: " .. monsterInfo.name ..", Race: "..monsterInfo.race)
	--[[local hpTarget = getCreatureHealth(target)
	local healing = hpTarget / (getPlayerLevel(cid) + getCreatureHealth(cid))
	local lifeStealPerc = getPlayerStorageValue(cid,LIFE_STEAL_PERC)
	print("Creature ("..getCreatureName(target)..") HP: " ..hpTarget)
	if (lifeStealPerc == -1) then
		lifeStealPerc = 0.01
		doPlayerSetStorageValue(cid,LIFE_STEAL_PERC,0.01)
	end

	if (math.ceil(math.random()) == 1)then
		doCreatureAddHealth(cid,healing * lifeStealPerc)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HEARTS)
		doSendAnimatedText(getCreaturePosition(cid), ""..healing*lifeStealPerc, TEXTCOLOR_LIGHTGREEN)
	end]]
	
	return TRUE
end