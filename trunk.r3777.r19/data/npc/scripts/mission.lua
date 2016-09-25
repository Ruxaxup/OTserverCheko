local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
return false
end
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
if(msgcontains(msg, 'Task')) then
selfSay('Very good! Do you want to start the {first} mission?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'First')) then
selfSay('Oh, bring it to me 4 {Golden Armor}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'golden armor') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,100) > 0) then
selfSay('Congratulations, you completed the mission!', cid)
else
if(doPlayerRemoveItem(cid, 2466, 4) == TRUE) then
setPlayerStorageValue(cid,100,1)
doPlayerAddExperience(cid,10000)
doPlayeraddItem(cid, 2470, 1)
selfSay('Very well! You started the {second} mission .. (you received 10000 experience points and a Golden Legs)', cid)
else
selfSay('You need to get more items.', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'second')) then
selfSay('Bring it to me 20 {Demonrage Sword}.', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'Demonrage Sword') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,101) > 0) then
selfSay('You completed the mission, I see that you should not underestimate more.', cid)
else
if(doPlayerRemoveItem(cid, 7382, 20) == TRUE) then
setPlayerStorageValue(cid,101,1)
doPlayerAddExperience(cid,20000)
doPlayeraddItem(cid, 8926, 1)
selfSay('You started {third} mission ... (You received 20,000 experience points and Demonwing Axe)', cid)
else
selfSay('You need to get more items.', cid)
end
end
return true
end
---------------------------------------------------------
if(msgcontains(msg, 'third')) then
selfSay('Traga-me dois {orshabaal brain}."', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'orshabaal brain') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,102) > 0) then
selfSay('You completed!', cid)
else
if(doPlayerRemoveItem(cid, 5808, 2) == TRUE) then
setPlayerStorageValue(cid,102,1)
doPlayerAddExperience(cid,40000)
doPlayeraddItem(cid, 7422, 1)
selfSay('Congratulations! You completed all the missions, now back to your Pokeball. (hehe) (You have received 40,000 experience points and Jade Hammer.)', cid)
else
selfSay('You need to get more items.', cid)
end
end
return true
end


end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  