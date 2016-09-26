local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 

local itemsCount = {
    [5954] = 200,    --demon horn
    [5925] = 500,    --hardened bone
    [6551] = 100,    --vampire dust
    [5898] = 10,     --beholder eyes
    [6558] = 20,     --concentrated demonic blood
    [6500] = 1000,   --demonic essence
    [9969] = 20,     --black skull
    [11360] = 100    --ghastly dragon head
}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end 
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end 
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end 
function onThink()                             npcHandler:onThink()                         end 

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. What do you want? If you want to be helpful just say {mission}, if not, just go away!! Freaking noob...") 

local islandPosition = {x = 765, y = 962, z = 2}

function teleportParty(cid)
    local pos, memberlist = getCreaturePosition(cid), getPartyMembers(cid)
    if(memberlist == nil or type(memberlist) ~= 'table' or table.maxn(memberlist) <= 1) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
        doSendMagicEffect(pos, CONST_ME_POFF)
        return false
    end

    local affectedList = {}
    for _, pid in ipairs(memberlist) do
        if(getDistanceBetween(getCreaturePosition(pid), pos) <= 36) then
            table.insert(affectedList, pid)
        end
    end

    local tmp = table.maxn(affectedList)
    if(tmp <= 1) then
        doPlayerSendDefaultCancel(cid, RETURNVALUE_NOPARTYMEMBERSINRANGE)
        doSendMagicEffect(pos, CONST_ME_POFF)
        return false
    else
        for _, pid in ipairs(affectedList) do
            doCreatureSetNoMove(pid, true)
            doTeleportThing(pid, getClosestFreeTile(cid, islandPosition, true, false))
            doSendMagicEffect(islandPosition, CONST_ME_HOLYDAMAGE)
            doCreatureSetNoMove(pid, false)
        end
    end
end

function devovorgaQuest(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then 
        if(getPlayerPremiumDays(cid) == 0) and (parameters.premium == true) then 
            npcHandler:say('Sorry, but this quest is only for premium players!', cid) 
            npcHandler:resetNpc() 
            return true 
        end
        if(getPlayerLevel(cid) < 200) then
            npcHandler:say('You are still a little noob! Come back at level 200 at least!! Muahahaha!',cid)
            npcHandler:resetNpc() 
            return true 
        end

        --Primera Etapa si es lvl 200
        if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == -1) then
            npcHandler:say('You definetly look like a real MACHO, I could really use your help. Just say {mission} when you are ready to begin.', cid)
            doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 0)
            npcHandler:resetNpc()
        --Segunda Etapa, Luci
        elseif (getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 0) then
            npcHandler:say('Well, long time ago I used to own a big mansion with lots of minions working at my word; until I was banished of the island by the great {Luci}...', cid)
            doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 1)
            npcHandler:resetNpc()
        --Tercera Etapa, Obtencion de objetos
        elseif (getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 3) then
            npcHandler:say('Did you gather everything I need?', cid)        
        elseif (getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 4) then
            npcHandler:say('Before I start my ritual I need one last favor.', cid)
            npcHandler:say('I need that you enter in my old mansion and look for my magnificent tiara. Can you bring it to me?', cid)
        elseif (getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 5) then
            npcHandler:say('Did you retrieve my magnificent tiara?',cid)        
        elseif (getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 6) then
            npcHandler:say('...',cid)            
            npcHandler:releaseFocus(cid)
            npcHandler:resetNpc()
        end
        return true 
    elseif (parameters.confirm == true) then 
        local allItems = true

        --Verificar cada uno de los objetos
        if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 3) then
            for k,v in pairs(itemsCount) do                
                if(getPlayerItemCount(cid,k) < v) then                    
                    allItems = false
                    break;                  
                end
            end
            if(allItems) then
                --Pasamos a la siguiente etapa
                npcHandler:say('Excellent! Now I can begin my ritual. Ask for a {mission} when you are ready for the next one.',cid)
                doSendMagicEffect(getCreaturePosition(cid),CONST_ME_BLOODYSTEPS)
                doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 4)
                --Borrar items
                for k,v in pairs(itemsCount) do                
                    doPlayerRemoveItem(cid, k, v)                 
                end            
            else
                npcHandler:say('What? You don\'t have all the {items}. Check again!!!.',cid)
            end    
        --Poder hablar con el minion
        elseif(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 4) then
            npcHandler:say('Great! you can ask my loyal minion to take you there. I do recomend you not to go alone, he can take your entire party there if you request him to.',cid)
            doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 5)

        elseif (getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 5) then
            if(getPlayerItemCount(cid,2139) > 0) then
                if(isInParty(cid))then
                    npcHandler:say('Oh... my magnificent tiara... You don\'t know what you have done!!!',cid)
                    teleportParty(cid)
                else
                    npcHandler:say('I demand that all your party be here right NOW. Bring them, and then give me my tiara!!',cid)
                    npcHandler:releaseFocus(cid)
                end
            else
                npcHandler:say('Are you **** kidding me? You have none! GO AWAY AND COME BACK WHEN YOU HAVE IT!!!',cid)
                npcHandler:releaseFocus(cid)
            end
        end

        npcHandler:resetNpc() 
        return true 
    elseif (parameters.decline == true) then 
        npcHandler:say('Stop WASTING MY TIME THEN!!!! (sucker...)', cid) 
        npcHandler:resetNpc() 
        npcHandler:releaseFocus(cid)
        return true 
    end 
    return false 
end 

function luciStage(cid, message, keywords, parameters, node)
    if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 1) then
        npcHandler:say('Oh my, you shall never say his full name... Anyway, I\'m seeking my revenge, trying to regain my status as the queen and getting back my mansion, but in order to do this, I need to recover my strenght first. For this I have prepared a list of {items} that I require to accomplish this.',cid)
        --Pasamos a la etapa de pedir objetos
        doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 2)
        npcHandler:resetNpc() 
        return true 
    end
end

function itemStage(cid, message, keywords, parameters, node)
    if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 2 or getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 3) then
        npcHandler:say('Thank you! Take note because I will need the following:',cid)
        npcHandler:say('200 Demon horns, 500 Hardened bones, 100 Vampire dusts, 10 Beholder eyes, 20 Vials of blood, 1000 Demonic essences, 20 Black skulls, 10 Ghastly dragon head',cid)
        npcHandler:say('When you got everything, come back and say {mission}.',cid)
        doPlayerSetStorageValue(cid, DEVOVORGA_QUEST, 3)
        npcHandler:resetNpc() 
        return true 
    end
end

local noNode = KeywordNode:new({'no'}, devovorgaQuest, {decline = true}) 
local yesNode = KeywordNode:new({'yes'}, devovorgaQuest, {confirm = true}) 

-- citizen (done) 
local outfit_node = keywordHandler:addKeyword({'mission'}, devovorgaQuest, {premium = true}) 
    outfit_node:addChildKeywordNode(yesNode) 
    outfit_node:addChildKeywordNode(noNode) 

local luci_node = keywordHandler:addKeyword({'luci'}, luciStage, {}) 
local items_node = keywordHandler:addKeyword({'items'}, itemStage, {}) 

--keywordHandler:addKeyword({'addons'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I can give you citizen, hunter, knight, mage, nobleman, summoner, warrior, barbarian, druid, wizard, oriental, pirate, assassin, beggar, shaman, norseman, nightmare, jester, yalaharian and brotherhood addons.'}) 
--keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'To buy the first addon say \'first NAME addon\', for the second addon say \'second NAME addon\'.'}) 

npcHandler:addModule(FocusModule:new())  