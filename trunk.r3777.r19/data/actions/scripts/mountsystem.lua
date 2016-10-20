--------------------
---- CONDITION -----
--------------------
local wolfCondition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(wolfCondition, CONDITION_PARAM_TICKS, -1)
addOutfitCondition(wolfCondition, {lookType = 4, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0})

local condHaste = createConditionObject(CONDITION_HASTE)
setConditionParam(condHaste, CONDITION_PARAM_TICKS, -1)
setConditionFormula(condHaste, 0.3, -54, 0.3, -54)
--------------------
----- config -------
--------------------
local t = {
	[8072] = {article='a' ,name='wolf', text='Mount, wolf!', dtext='Demount, wolf!', s=MOUNT_ID, condition=wolfCondition},
}      
 
------------------------------------
--- don't change if you are noob ---
------------------------------------
function onUse(cid, item, fromPosition, itemEx, toPosition)
	local v, r = getCreaturePosition(cid), t[item.itemid]
	local s = r.s
	local pos = {x = v.x, y = v.y, z = v.z}
	if r then
		if getPlayerStorageValue(cid, s) <= 0 then
			doSendMagicEffect(pos, 10)
			doCreatureSay(cid, r.text, 19)
			setPlayerStorageValue(cid, s, 1)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'You have mounted ' .. r.article .. ' '.. r.name .. '.')
			doAddCondition(cid, condHaste)
			return doAddCondition(cid, r.condition)   
		elseif getPlayerStorageValue(cid, s) == 1 then
			doSendMagicEffect(pos, 10)
			doCreatureSay(cid, r.dtext, 19)
			setPlayerStorageValue(cid, s, 0)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, 'You have demounted ' .. r.article .. ' '.. r.name .. '.')
			doRemoveCondition(cid, CONDITION_HASTE)
			return doRemoveCondition(cid, CONDITION_OUTFIT)
		else
			return doPlayerSendCancel(cid, 'You can\'t do this.')
		end
	else
		return doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_BLUE, 'There has been some error, try contacting a staff member.')
	end
end