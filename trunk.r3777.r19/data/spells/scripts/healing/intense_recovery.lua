local healing = 40
local ticks = 3000
local time =  (60 * 1000) / ticks-- seconds

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)


local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_TICKS, 1 * 60 * 1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, healing)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, ticks)
setConditionParam(condition, CONDITION_PARAM_BUFF, true)

setCombatCondition(combat, condition)


function healingText(cid, seconds)
	if(seconds ~= 0) then
		doSendAnimatedText(getCreaturePosition(cid),"+"..healing,TEXTCOLOR_GREEN)
		addEvent(healingText, ticks, cid, seconds - 1)
	else
		doPlayerSetStorageValue(cid, RECOVERY_ID, -1)
	end
end

function onCastSpell(cid, var)
	local condition = getPlayerStorageValue(cid,RECOVERY_ID)
	if(condition == 1) then
		doPlayerSendDefaultCancel(cid, RETURNVALUE_YOUAREEXHAUSTED)
		doSendMagicEffect(getCreaturePosition(cid),CONST_ME_POFF)
		return false
	end
	
	addEvent(healingText, ticks, cid, time)
	doPlayerSetStorageValue(cid, RECOVERY_ID, 1)
	return doCombat(cid, combat, var)	
end
