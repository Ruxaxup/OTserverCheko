-- haste
local combatHaste = createCombatObject()
setCombatParam(combatHaste, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combatHaste, COMBAT_PARAM_AGGRESSIVE, 0)
setCombatParam(combatHaste, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)


local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 14000)
setConditionFormula(condition, 0, 350, 0, 350)
setCombatCondition(combatHaste, condition)

-- outfit
local outCombat = createCombatObject()
setCombatParam(outCombat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_GREEN)

local condition = createConditionObject(CONDITION_OUTFIT)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3 * 24 * 3600 * 1000) -- here time in miliseconds, default 3 days
addOutfitCondition(condition, 0, 12, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 35, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 300, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 287, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 303, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 231, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 243, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 244, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 246, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 240, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 326, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 307, 114, 114, 94, 94)
addOutfitCondition(condition, 0, 55, 114, 114, 94, 94)
setCombatCondition(outCombat, condition) 

-- exevo san
local sanCombat = createCombatObject()
setCombatParam(sanCombat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(sanCombat, COMBAT_PARAM_EFFECT, CONST_ME_FIREDAMAGE)
setCombatParam(sanCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLFIRE)
function onGetDmg1(cid, level, maglevel)
    return -60, -200
end


setCombatCallback(sanCombat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetDmg1")
-- SD
local sdCombat = createCombatObject()
setCombatParam(sdCombat, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
setCombatParam(sdCombat, COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)
setCombatParam(sdCombat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
function onGetDmg2(cid, level, maglevel)
    return 250, 500
end

setCombatCallback(sdCombat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetDmg2")

function onCastSpell(cid, var)
    if(isCreature(variantToNumber(var)) == TRUE) then
        if(getCreatureCondition(cid, CONDITION_OUTFIT) == 0) then -- random outfit
            doCombat(0, outCombat, numberToVariant(cid))
        end
        if(getCreatureHealth(cid) < 500 and getCreatureCondition(cid, CONDITION_HASTE) == 0) then
            doCombat(0, combatHaste, numberToVariant(cid))
            doCreatureSay(cid,"Speed",TALKTYPE_SAY)
        else
            if(math.random(0,99) > 80 and (getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 450)) then -- 20% percent chance to heal when hp lose higher then 450
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 600, 800, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid,"Heal",TALKTYPE_SAY)
            elseif(math.random(0,99) > 60 and (getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 750)) then -- 40% percent chance to heal when hp lose higher then 750
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 600, 800, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid,"Heal",TALKTYPE_SAY)
            elseif(math.random(0,99) > 20 and (getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 950)) then -- 80% percent chance to heal when hp lose higher then 950
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 600, 800, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid,"Heal",TALKTYPE_SAY)
            elseif(getCreatureMaxHealth(cid) - getCreatureHealth(cid) > 300) then -- 100% to drink great spirit potion if hp lose higher then 100
                doTargetCombatHealth(0, cid, COMBAT_HEALING, 200, 400, CONST_ME_MAGIC_BLUE)
                doCreatureSay(cid, "Aaaah...", TALKTYPE_ORANGE_1)
            end
        end
        if(math.random(0,99) > 60) then -- 40% to shot sd
            doCombat(cid, sdCombat, var)
            doTargetCombatHealth(cid, variantToNumber(var), COMBAT_DEATHDAMAGE, -100, -150, CONST_ME_NONE)
        elseif(math.random(0,99) > 30) then -- 70% to shot exori san
            doCombat(cid, sanCombat, var)
            doTargetCombatHealth(cid, variantToNumber(var), COMBAT_HOLYDAMAGE, -60, -200, CONST_ME_NONE)
            doCreatureSay(cid,"Hell Core",TALKTYPE_SAY)
        end
    end
end  