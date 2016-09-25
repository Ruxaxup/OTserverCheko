  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid)                        end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid)                     end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg)                end
function onThink()                                      npcHandler:onThink()                                    end
function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        local crystalid = 2349
        local storage = 2349
        local getstorage = getPlayerStorageValue(cid, storage)
        local sorrymessage = "Sorry, you do not have all the Blue note needed to complete missions..."
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
        if msgcontains(msg, 'Blue Note') then
                if getstorage == 6 then
                        npcHandler:say("You have already completed the quest", cid)
                elseif getstorage < 6 then
                        npcHandler:say("You have all Blue note NEEDED?", cid)
                        talkState[talkUser] = 1
                end
        elseif msgcontains(msg, 'quest') then
                if getstorage < 1 then
                        npcHandler:say("You need 1 {Blue note} to start.", cid)
                elseif getstorage == 1 then
                        npcHandler:say("You are the second mission and needs more Blue note 1 to continue.", cid)
                elseif getstorage == 2 then
                        npcHandler:say("You are the third mission and needs more Blue note 1 to continue.", cid)
                elseif getstorage == 3 then
                        npcHandler:say("You are the fourth mission and needs more Blue note 1 to continue.", cid)
                elseif getstorage == 4 then
                        npcHandler:say("You are the fift mission and needs more Blue note 1 to continue.", cid)
                elseif getstorage == 5 then
                        npcHandler:say("You are the sixth mission and needs more Blue note 1 to continue.", cid)
                elseif getstorage == 6 then
                        npcHandler:say("You've completed all missions.", cid)
                end
        elseif msgcontains(msg, 'yes') then
                if talkState[talkUser] == 1 then
                        if getstorage < 0 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("You already gave me 1 Blue note. Now I will need more {1}.", cid)
                                        setPlayerStorageValue(cid, storage, 1)
                                        doPlayerAddExp(cid, 10000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 1 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("You already gave me 2 Blue note. Now I will need more {1}.", cid)
                                        setPlayerStorageValue(cid, storage, 2)
                                        doPlayerAddExp(cid, 50000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 2 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("You already gave me 3 Blue note. Now I will need more {1}.", cid)
                                        setPlayerStorageValue(cid, storage, 3)
                                        doPlayerAddExp(cid, 70000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 3 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("You already gave me 4 Blue note. Now I will need more {1}.", cid)
                                        setPlayerStorageValue(cid, storage, 4)
                                        doPlayerAddExp(cid, 10000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 4 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("You already gave me 5 Blue note. Now I will need more {1}.", cid)
                                        setPlayerStorageValue(cid, storage, 5)
                                        doPlayerAddExp(cid, 150000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 5 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("Well done, you completed all missions. I will give you experience and {blessed shield} as prize.", cid)
                                        setPlayerStorageValue(cid, storage, 6)
                                        doPlayerAddExp(cid, 900000)
                                        doPlayerAddItem(cid, 2523, 1)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        end
                end
        elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
                npcHandler:say("OK, back when you are ready.", cid)
                talkState[talkUser] = 0
        end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 