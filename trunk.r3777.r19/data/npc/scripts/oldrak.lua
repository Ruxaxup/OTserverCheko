local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
 
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	if msgcontains(msg, "hallowed axe") then
		selfSay("Do you want to buy a Hallowed Axe for " .. HALLOWEDAXE_PRICE .. " gold coins?", cid)
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		if getPlayerItemCount(cid, 2386) >= 1 and getPlayerMoney(cid) >= HALLOWEDAXE_PRICE then
			if doPlayerRemoveMoney(cid, HALLOWEDAXE_PRICE) then
				selfSay("Here you are. You can now defeat the demon oak with this axe.", cid)
				doPlayerRemoveItem(cid, 2386, 1)
				doPlayerAddItem(cid, 8293, 1)
				talkState[talkUser] = 0
			end
		else
			selfSay("I need an axe and " .. HALLOWEDAXE_PRICE.. " gold coins to make you a {hallowed axe}.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "demon oak") then
		selfSay("Did you defeat the demon oak?", cid)
		talkState[talkUser] = 2
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 2 then
		if getCreatureStorage(cid, storages.done) == 1 then
			selfSay("Good job!", cid)
			doCreatureSetStorage(cid, storages.done, 2)
			talkState[talkUser] = 0
		else
			selfSay("Go defeat the demon oak first.", cid)
			talkState[talkUser] = 0
		end
	elseif msgcontains(msg, "no") and (talkState[talkUser] >= 1 and talkState[talkUser] <= 3) then
		selfSay("Ok thanks.", cid)
		talkState[talkUser] = 0
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())