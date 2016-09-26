local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. What do you want? If you want to be helpful just say {mission}, if not, just go away!! Freaking noob...") 
-- XVX FORGER START --

function amulet(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,8262) >= 1 and getPlayerItemCount(cid,8263) >= 1 and getPlayerItemCount(cid,8264) >= 1 and  getPlayerItemCount(cid,8265) >= 1 then
        if doPlayerRemoveItem(cid,8262,1) and doPlayerRemoveItem(cid,8263,1) and doPlayerRemoveItem(cid,8264,1) and  doPlayerRemoveItem(cid,8265,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,8266,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function obsidian(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2516) >= 1 and getPlayerItemCount(cid,2425) >= 1 then
        if doPlayerRemoveItem(cid,2516,1) and doPlayerRemoveItem(cid,2425,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5908,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end	

function crude(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2393) >= 1 then
        if doPlayerRemoveItem(cid,2393,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5892,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
    end
end

function draconian(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
        if getPlayerItemCount(cid,2516) >= 1 then
        if doPlayerRemoveItem(cid,2516,1) then
            npcHandler:say('Here is your item!', cid)
            doPlayerAddItem(cid,5889,1)
        end
        else
            npcHandler:say('You don\'t have these items!', cid)
   end   
end

function mission(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if (parameters.confirm == true) then
        npcHandler:say('YOU SAID YES',cid)
    end
    if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == -1) then
        npcHandler:say('Hahahaha do you really think you can take this mission?',cid)

    elseif(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 0) then
        npcHandler:say('Well, long time ago I used to own a big mansion with lots of minions working at my word; until I was banished of the island by the great {Luci}...', cid)
        doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 1)

    elseif(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 3) then
        npcHandler:say('Did you gather everything I need?', cid)
    end
end

function help(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    npcHandler:say('Esta es la seccion de ayuda', cid)
end

function luci(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 1) then
        npcHandler:say('Oh my, you shall never say his full name, Anyway, I\'m seeking my revenge, trying to regain my status as the queen and getting back my mansion, but in order to do this, I need to recover my strenght first. For this I have prepared a list of {items} that I require to accomplish this.',cid)
        doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 2)
    end
end

function items(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then
        return false
    end
    if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 2 or getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 3) then
        npcHandler:say('Thank you! Take note because I will need the following:',cid)
        npcHandler:say('200 Demon horns\n500 Hardened bones\n100 Vampire dusts\n10 Beholder eyes\n20 Vials of blood\n1000 Demonic essences\n20 Black skulls\n10 Ghastly dragon head',cid)
        npcHandler:say('When you got everything, come back and say {mission}.',cid)
        doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 3)
    end
end

-- XVX FORGER END --

keywordHandler:addKeyword({'help'}, help, {npcHandler = npcHandler, onlyFocus = true, reset = true})

local yesNode = KeywordNode:new({'yes'}, mission, {confirm = true}) 


local node1 = keywordHandler:addKeyword({'mission'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true,text = 'Just as I thought... What a pussy.'})
    node1:addChildKeyword(yesNode)
    node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Just as I thought... What a pussy.', reset = true})

local node2 = keywordHandler:addKeyword({'luci'}, luci, {npcHandler = npcHandler, onlyFocus = true})

local node3 = keywordHandler:addKeyword({'items'}, items, {npcHandler = npcHandler, onlyFocus = true})

npcHandler:addModule(FocusModule:new())