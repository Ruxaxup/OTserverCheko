function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end
--OFFLINE TRAINING
function onLogin(cid)
	if(isPlayerPzLocked(cid)) then
		doPlayerSendCancel(cid, "You can't train during a fight.")
		return true
	end

	-- CONFIG
	local secondsPerHit       =   2			-- THE ATTACKSPEED (1 hit per 2 seconds; default) 
	local manaGenPerSec       =   10 		-- MANA USED PER SEC
	local offlineModifier     =   1 		-- FROM 0-1 (or higher if you wish). How fast you are skillin on offline training compared to normal (0.5 = 50%)
	local maxSecondsTraining  =   60 * 60 * 12 -- (Default 12 hours)
	--END of config

	local accid 			= 	getAccountNumberByPlayerName(getCreatureName(cid))
	local name 				= 	getCreatureName(cid)
	local checkTraining 	=   getPlayerStorageValue(cid, OFFLINE_TRAINING)
	local skills 			=   {[7]=SKILL__MAGLEVEL, [4]=SKILL_DISTANCE,[1]=SKILL_CLUB, [3]=SKILL_AXE,[2]=SKILL_SWORD}
	local skillNames 		=   {[7]="Magic Level", [4]="Distance Fighting",[1]="Club Fighting", [3]="AxeFighting",[2]="Sword Fighting"}
	print("> checkTraining: " .. checkTraining)
	if (checkTraining ~= -1) then	
		local skill				= 	checkTraining
		local timeTrained		= 	getPlayerStorageValue(cid, OFFLINE_TRAINING_TIME)
		local secondsTrained 	= 	os.time()-timeTrained 
		local skillTries       	=   math.floor((secondsTrained/secondsPerHit)*offlineModifier)
		local skillBefore
		local skillAfter
		local triesNeeded
		local beforeSkillTries
		local percentBefore
		local percentNow
		local nowSkillTries
		local newTriesNeeded
		if timeTrained > maxSecondsTraining then
			timeTrained = maxSecondsTraining 
		end
			
		if skill ~= SKILL__MAGLEVEL then --Todo menos Magic Level			
			skillBefore 		= getPlayerSkillLevel(cid, skills[skill])	
			beforeSkillTries 	= getPlayerSkillTries(cid, skill)
			triesNeeded 		= getPlayerRequiredSkillTries(cid, skill, skillBefore + 1)
			percentBefore = 100 - (beforeSkillTries / triesNeeded * 100)
			print("> Skill type: " .. skill .. " > Training time: " .. timeTrained)
			print("> BeforeSkillTries: " .. beforeSkillTries .. " > Tries needed: " .. triesNeeded)
			doPlayerAddSkillTry(cid, skills[skill], skillTries)

			skillAfter		= getPlayerSkillLevel(cid, skills[skill])
			nowSkillTries	= getPlayerSkillTries(cid, skill)
			newTriesNeeded	= getPlayerRequiredSkillTries(cid, skill, skillAfter + 1)
			percentNow = 100 - (nowSkillTries / newTriesNeeded * 100)
		else -- Magic level
			skillBefore = getPlayerMagLevel(cid)
			doPlayerAddSpentMana(cid, manaGenPerSec*secondsTrained)
			skillAfter	= getPlayerMagLevel(cid)
		end

		local skillBeforeShield = getPlayerSkillLevel(cid, 5)
		doPlayerAddSkillTry(cid, 5, skillTries)
		local skillAfterShield = getPlayerSkillLevel(cid, 5)
		local horas = math.floor((secondsTrained / 3600))
		local minu = math.floor( (secondsTrained - (horas * 3600)) /60 )
		local segundos = secondsTrained - ((horas * 3600)+(minu * 60))

		if(horas ~= 0 and minu ~= 0) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have trained for "..horas.." hours, "..minu.." minutes")
		end

		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your ".. skillNames[skill] .." skill changed from level ".. skillBefore.." to level ".. skillAfter ..".")
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Your Shielding skill changed from level ".. skillBeforeShield.." to level ".. skillAfterShield ..". ")
		doPlayerSetStorageValue(cid, OFFLINE_TRAINING, -1) -- Resetea el skill
	end
	return TRUE
end