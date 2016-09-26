local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic, Description = {}, {}
 
local t = {
	price = 100000, -- How much it will cost, using GP's.
	maxlen = 20, -- Maximum length of description
	altPayment = {9020, 150}, -- Pay with a different item (e.g. Chistmas Tokens)
	yellFrequency = 250 -- The higher, the less frequent.
}
 
local thinkMsg = {
	"I can personalise your items, come to me!",
	"Want to bind your items to your name? Come to me!"
}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 							npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid], Description[cid] = 1, nil
	return true
end
 
function thinkCallback(cid)
	local rand = math.random(t.yellFrequency)
	if thinkMsg[rand] then
		doCreatureSay(getNpcCid(), thinkMsg[rand], TALKTYPE_YELL)
	end
	return true
end
 
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		npcHandler:say('Would you like me to perform this service for you? If so, place the item you want personalized in your arrow slot and say {continue}.', cid)
		Topic[cid] = 2
	elseif isInArray({1,2,4}, Topic[cid]) and msgcontains(msg, 'no') then
		npcHandler:say('Okay well, I guess you don\'t care if someone steals your stuff... You will have no idea if it\'s yours...', cid)
		Topic[cid] = nil
		npcHandler:releaseFocus(cid)
	elseif Topic[cid] == 2 and (msgcontains(msg, 'continue') or msgcontains(msg, 'yes')) then
		local v = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
		if v.uid < 1 then
			npcHandler:say('Well, are you gonna put an item in your arrow slot or no?', cid)
		elseif v.actionid > 0 and v.actionid - 100 ~= getPlayerGUID(cid) then
			npcHandler:say('Hey, I recognise this! THIEF!', cid)
			Topic[cid] = nil
			npcHandler:releaseFocus(cid)
		elseif getItemInfo(v.itemid).stackable then
			npcHandler:say('Sorry, but stackable items aren\'t allowed. Say {continue} after you\'ve put another item.', cid)
		else
			npcHandler:say('Now you must write the {description} for your newly personalized item.', cid)
			Topic[cid] = 3
		end
	elseif Topic[cid] == 3 then
		if msg:len() > t.maxlen then
			npcHandler:say('That description is longer than ' .. t.maxlen .. ' characters, please choose a shorter one.', cid)
		else
			npcHandler:say('Do you really want me to personalize your item for ' .. t.price .. ' gold or ' .. t.altPayment[2] .. ' ' .. getItemInfo(t.altPayment[1]).plural .. '?', cid)
			Description[cid] = msg
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 and msgcontains(msg, 'yes') then
		local v = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
		if v.uid < 1 or getItemInfo(v.itemid).stackable or (v.actionid > 0 and v.actionid - 100 ~= getPlayerGUID(cid)) then
			npcHandler:say('What the fuck are you trying to do?', cid)
			npcHandler:releaseFocus(cid)
		elseif doPlayerRemoveMoney(cid, t.price) or doPlayerRemoveItem(cid, t.altPayment[1], t.altPayment[2]) then
			local n = getCreatureName(cid)
			doItemSetAttribute(v.uid, "name", n .. "'" .. (n:sub(-1)=="s" and "" or "s") .. " " .. getItemInfo(v.itemid).name .. " (" .. Description[cid] .. ")")
			if v.actionid == 0 then
				doItemSetAttribute(v.uid, "aid", getPlayerGUID(cid) + 100)
			end
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
			npcHandler:say('Well, congratulations! You have personalized your ' .. getItemInfo(v.itemid).name .. '.', cid)
		else
			npcHandler:say('Well, it seems like you miss out on the money duper exploit, better ask one of them scammers to lend you a nugget.', cid)
			npcHandler:releaseFocus(cid)
		end
		Topic[cid] = nil
		Description[cid] = nil
	end
	return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, 'I hope you made the right choice, have a wonderful day.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Okay well, I guess you don\'t care if someone steals your stuff... You will have no idea if it\'s yours...')
npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|! I am a brander. I can personalize any of your items for a price, would you like to continue to the next step?')
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())