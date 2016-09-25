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
        local crystalid = 9980
        local storage = 9980
        local getstorage = getPlayerStorageValue(cid, storage)
        local sorrymessage = "Sorry, you do not have all Crystal Of Power NEEDED to complete missions..."
        local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
        if msgcontains(msg, 'crystal of power') then
                if getstorage == 6 then
                        npcHandler:say("You completed the Jah quest", cid)
                elseif getstorage < 6 then
                        npcHandler:say("Do you have all the Crystal of Power NEEDED?", cid)
                        talkState[talkUser] = 1
                end
        elseif msgcontains(msg, 'quest') then
                if getstorage < 1 then
                        npcHandler:say("You need 1 {crystal of power} to start.", cid)
                elseif getstorage == 1 then
                        npcHandler:say("You are in the second mission and need 5 more Crystal of Power to continue.", cid)
                elseif getstorage == 2 then
                        npcHandler:say("You are in the third mission and need 7 Crystal of power para continuar.", cid)
                elseif getstorage == 3 then
                        npcHandler:say("You are in fourth mission and need more 10 Crystal of power to continue.", cid)
                elseif getstorage == 4 then
                        npcHandler:say("You are in the fifth mission and needs more 15 Crystal of power to continue.", cid)
                elseif getstorage == 5 then
                        npcHandler:say("You are in the sixth and last mission and needs more 50 Crystal of power to continue.", cid)
                elseif getstorage == 6 then
                        npcHandler:say("You completed all missions.", cid)
                end
        elseif msgcontains(msg, 'yes') then
                if talkState[talkUser] == 1 then
                        if getstorage < 0 then
                                if doPlayerRemoveItem(cid, crystalid, 1) == TRUE then
                                        npcHandler:say("You gave me jah 1 crystal of power. Now I will need more {5}.", cid)
                                        setPlayerStorageValue(cid, storage, 1)
                                        doPlayerAddExp(cid, 1000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 1) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 1 then
                                if doPlayerRemoveItem(cid, crystalid, 5) == TRUE then
                                        npcHandler:say("You gave me jah 5 crystal of power. Now I will need more {7}.", cid)
                                        setPlayerStorageValue(cid, storage, 2)
                                        doPlayerAddExp(cid, 5000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 5) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 2 then
                                if doPlayerRemoveItem(cid, crystalid, 7) == TRUE then
                                        npcHandler:say("You gave me jah 7 crystal of power. Now I will need more {10}.", cid)
                                        setPlayerStorageValue(cid, storage, 3)
                                        doPlayerAddExp(cid, 7000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 7) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 3 then
                                if doPlayerRemoveItem(cid, crystalid, 10) == TRUE then
                                        npcHandler:say("You gave me jah 10 crystal of power. Now I will need more {15}.", cid)
                                        setPlayerStorageValue(cid, storage, 4)
                                        doPlayerAddExp(cid, 10000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 10) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 4 then
                                if doPlayerRemoveItem(cid, crystalid, 15) == TRUE then
                                        npcHandler:say("You gave me jah 15 crystal of power. Now I will need more {50}.", cid)
                                        setPlayerStorageValue(cid, storage, 5)
                                        doPlayerAddExp(cid, 15000)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 15) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        elseif getstorage == 5 then
                                if doPlayerRemoveItem(cid, crystalid, 50) == TRUE then
                                        npcHandler:say("Parabens hehehehehehe, you completed all missions. I will give you a {Golden Falcon} and some experience.", cid)
                                        setPlayerStorageValue(cid, storage, 6)
                                        doPlayerAddExp(cid, 900000)
                                        doPlayerAddItem(cid, 8976, 1)
                                        talkState[talkUser] = 0
                                elseif doPlayerRemoveItem(cid, crystalid, 50) == FALSE then
                                        npcHandler:say(sorrymessage, cid)
                                        talkState[talkUser] = 0
                                end
                        end
                end
        elseif(msgcontains(msg, 'no') and talkState[talkUser] == 1) then
                npcHandler:say("OK, Come back when you're ready.", cid)
                talkState[talkUser] = 0
        end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 