local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 

NpcSystem.parseParameters(npcHandler) 

local islandName = "Debora's Mansion"
local islandPosition = {x = 1584, y = 987, z = 10}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end 
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end 
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end 
function onThink()                             npcHandler:onThink()                         end 

npcHandler:setMessage(MESSAGE_GREET, "Heee... lloooo... |PLAYERNAME|. Whaaat do yoooou {need}.") 
npcHandler:setMessage(MESSAGE_FAREWELL, "Waaatch your baack Sir. |PLAYERNAME|...") 

function needInfo(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then 
        if(getPlayerPremiumDays(cid) == 0) and (parameters.premium == true) then 
            npcHandler:say('Sorry, but this quest is only for premium players!', cid) 
            npcHandler:resetNpc() 
            return true 
        end
        if (getPlayerStorageValue(cid, DEVOVORGA_QUEST) < 5) then
            npcHandler:say('Aaaaask Mrs. Debora for a miiiisssion first. Until theeeen, I can\'t help yoooou...',cid)
            npcHandler:resetNpc() 
            return true 
        else
            npcHandler:say('I can use some of my power to teleport you to ' .. islandName.. '. When you\'re reeeeeady, just ask for {teleport}. Beeeeee careful as I won\'t be going wiiiiiiith you, I can\'t taaaaake you back. So you must fiiiiiind a way out by yourseeeeelf.',cid)
            npcHandler:resetNpc() 
        end

        return true
    elseif (parameters.confirm == true) then         
        npcHandler:say('Taaaaake care...', cid) 
        npcHandler:resetNpc() 
        return true 
    elseif (parameters.decline == true) then 
        npcHandler:say('Seeeee you sooon...', cid) 
        npcHandler:releaseFocus(cid)
        return true 
    end 
    return false 
end 

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

function teleportNode(cid, message, keywords, parameters, node)
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 

    if (parameters.confirm ~= true) and (parameters.decline ~= true) then 
        if(getPlayerStorageValue(cid, DEVOVORGA_QUEST) == 5) then
            npcHandler:say('Are you ready to travel theeeeeere? I warn you!!!! Strong monsters now inhabit my former hooooome.',cid)
        end
        return true 
    elseif (parameters.confirm == true) then
        --DoTeleportThing        
        if (isInParty(cid)) then
            npcHandler:say('Watch your baaack warrior!!.',cid)
            teleportParty(cid)
        else
            npcHandler:say('A Sooolo MACHO UH? Waaanna see thaaat...',cid)
            doTeleportThing(cid, islandPosition)
            doSendMagicEffect(islandPosition, CONST_ME_HOLYDAMAGE)
        end        
        npcHandler:resetNpc() 
        return true 
    elseif (parameters.decline == true) then 
        npcHandler:say('Seeeee you sooon...', cid) 
        npcHandler:resetNpc()
        npcHandler:releaseFocus(cid) 
        return true         
    end    
end

local noNode = KeywordNode:new({'no'}, teleportNode, {decline = true}) 
local yesNode = KeywordNode:new({'yes'}, teleportNode, {confirm = true}) 

local outfit_node = keywordHandler:addKeyword({'need'}, needInfo, {premium = true})

local teleport_node = keywordHandler:addKeyword({'teleport'}, teleportNode, {premium = true}) 
    teleport_node:addChildKeywordNode(yesNode) 
    teleport_node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())  