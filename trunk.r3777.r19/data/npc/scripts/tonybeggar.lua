  local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                         npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
    -- Place all your code in here. Remember that hi, bye and all that stuff is already handled by the npcsystem, so you do not have to take care of that yourself.
    if(npcHandler.focus ~= cid) then
        return false
    end

        if msgcontains(msg, 'beggar') then
            npcHandler:say('You want to hear that story now. Loooonga and sad.', cid)
                        talk_state = 1
                        elseif msgcontains(msg, 'yes') and talk_state == 1 then
                                if getPlayerItemCount(cid,2160) >= 1 then
                                        doPlayerTakeItem(cid,2160,2)
                                        npcHandler:say('Oh, shit! I hate mosquitoes ... What did you say?', cid)
                                        talk_state = 0
                                        else
                                                npcHandler:say('Oh, sorry. I remembered that I need to do something. Thanks for your ... for your ... for your kindness.', cid)
                                                talk_state = 0
                                        end
                                elseif msgcontains(msg, 'no') and talk_state == 1 then
                                        npcHandler:say('Ok, bye!', cid)
                                        talk_state = 0
                                end
                                return true
                        end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new()) 