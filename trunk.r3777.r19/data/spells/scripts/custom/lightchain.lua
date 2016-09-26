local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 3000)
setConditionFormula(condition, -0.2, 0, -0.2, 0)
setCombatCondition(combat, condition)

local combatSmall = createCombatObject()
setCombatParam(combatSmall, COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)

function getSpellDamageLightChain(cid, level, maglevel)
	local damage = -math.floor(((math.random(200, 400) * level) + (math.random(200, 300) * maglevel)) / 100)
	return damage, damage --The random part of the formula has already been made, just return the normal damage
end

function getSpellDamageLightChainSmall(cid, level, maglevel)
	local damage = -math.floor(((math.random(200, 400) * level) + (math.random(200, 300) * maglevel)) / 400)
	return damage, damage --The random part of the formula has already been made, just return the normal damage
end

function lightChainHit(param)
	if isCreature(param.cid) == TRUE and isCreature(variantToNumber(param.var)) == TRUE then
		doSendDistanceShoot(param.fromcidpos, getCreaturePosition(variantToNumber(param.var)), CONST_ANI_HOLY)
		doCombat(param.cid, param.combat, param.var)
		param.fromcidpos = getCreaturePosition(variantToNumber(param.var))
		param.count = param.count + 1
		local enemies = getMonstersInArea3(param.fromcidpos, param.notHitCidArray)
		if (enemies.number > 0) and (param.count < 5) then
			local enemiesList = enemies.list
			local randenemy = math.random(1, enemies.number)
			param.var = numberToVariant(enemiesList[randenemy])
			table.insert(param.notHitCidArray, variantToNumber(param.var))
			local subenemies = getMonstersInArea1(param.fromcidpos, param.notHitCidArray)
			if (subenemies.number > 0) then
				local nearenemieslist = subenemies.list
				for i = 1, subenemies.number do
					doCombat(param.cid, param.combatSmall, numberToVariant(nearenemieslist[i]))
					doSendDistanceShoot(param.fromcidpos, numberToVariant(nearenemieslist[i]), CONST_ANI_ENERGY)
				end
			end
			addEvent(lightChainHit, 200, param)
		end
	end
end

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "getSpellDamageLightChain")
setCombatCallback(combatSmall, CALLBACK_PARAM_LEVELMAGICVALUE, "getSpellDamageLightChainSmall")

function onCastSpell(cid, var)
	if(variantToNumber(var) ~= 0) then
		if isCreature(variantToNumber(var)) == TRUE then
			local param = {}
			param.cid = cid
			param.fromcidpos = getCreaturePosition(cid)
			param.var = var
			param.combat = combat
			param.combatSmall = combatSmall
			param.count = 0
			param.lastshot = 0
			param.notHitCidArray = {cid, variantToNumber(var)}
			addEvent(lightChainHit, 50, param)
		end
	end
	return true
end
