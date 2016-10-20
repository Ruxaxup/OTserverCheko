local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 

NpcSystem.parseParameters(npcHandler) 


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end 
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end 
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end 
function onThink()                             npcHandler:onThink()                         end 

npcHandler:setMessage(MESSAGE_GREET, "Hello young one <cough>. Did you came yo hear some of my interesting {stories}?") 
npcHandler:setMessage(MESSAGE_FAREWELL, "Come back soon |PLAYERNAME|, I really enjoyed your stay.") 

local pieces_spot = {
    {},
    {},
    {},
    {},
    {},
    {},
    {}
}

function storiesNode(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then 
        npcHandler:say('Which tale will you like to hear today? {hota}, {devovorga}, {annihilator}, {poi} or {inquisition}',cid)
    elseif (parameters.confirm == true) then

    elseif (parameters.decline == true) then

    end 
    return false 
end 

function HotANode( cid, message, keywords, parameters, node )
    if(message == "hota") then        
        print("Quest: "..HOTA_QUEST)
        if(getPlayerStorageValue(cid,HOTA_QUEST) == -1) then
            doPlayerSetStorageValue(cid,HOTA_QUEST,1)
        end
        npcHandler:say('Ah!! <cough>, the Helmet of the Ancients. It is said to be the strongest helmet ever crafted, although it\'s really hard to obtain.',cid)
        npcHandler:say('The great helmet was torn apart into seven {pieces} that are now scattered aound the world.',cid)
    elseif(message == "pieces") then
        if(getPlayerStorageValue(cid,HOTA_QUEST) == 1) then
            doPlayerSetStorageValue(cid,HOTA_QUEST,2)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You quest log has been updated.")
        end
        npcHandler:say('The pieces... yes! I do remember the location of all of them. Let me mark all the spots in your map. Also, you can check your book of quests to see all the places.',cid)
        npcHandler:say('If you have all of them I can tell you where to {join} them.',cid)
    elseif(message == "join") then
        npcHandler:say('If you have all the pieces, you can join them at the deepest floor of Roshamuul. Ask Roshy for indications. I\'ll mark you the spot.',cid)
    end    
end

function DevovorgaNode( cid, message, keywords, parameters, node )
    npcHandler:say('This place is called Forbidden. But there are others for higher levels like Lost Island.',cid)
    npcHandler:say('If you wish, you can ask to Captain Zoria located at south east. He might me able to take you to different cities.',cid)
end

function AnnihilatorNode( cid, message, keywords, parameters, node )
    npcHandler:say('When you kill a creature belonging to a task, a message will be displayed in Default channel telling you how many mobs have you killed so far.',cid)    
    npcHandler:say('As the same way, when you finish it, a message will tell you that you can claim your reward.',cid)    
    npcHandler:say('To claim your reward visit Alesar at upstairs, he will also inform you about general tasks.',cid)    
end

function PoINode( cid, message, keywords, parameters, node )
    markMap(cid)    
    npcHandler:say('I\'ve marked your map in case you have lost them. But you can always use the command !mark to obtain our recommended spots.',cid)
end

function InquisitionNode( cid, message, keywords, parameters, node )
    markMap(cid)    
    npcHandler:say('I\'ve marked your map in case you have lost them. But you can always use the command !mark to obtain our recommended spots.',cid)
end

local noNode = KeywordNode:new({'no'}, teleportNode, {decline = true}) 
local yesNode = KeywordNode:new({'yes'}, teleportNode, {confirm = true}) 

local main_node = keywordHandler:addKeyword({'stories'}, storiesNode, {})
local main_node = keywordHandler:addKeyword({'hota'}, HotANode, {})
local main_node = keywordHandler:addKeyword({'pieces'}, HotANode, {})
local main_node = keywordHandler:addKeyword({'join'}, HotANode, {})
local main_node = keywordHandler:addKeyword({'devovorga'}, DevovorgaNode, {})
local main_node = keywordHandler:addKeyword({'annihilator'}, AnnihilatorNode, {})
local main_node = keywordHandler:addKeyword({'poi'}, PoINode, {})
local main_node = keywordHandler:addKeyword({'inquisition'}, InquisitionNode, {})

--local teleport_node = keywordHandler:addKeyword({'teleport'}, teleportNode, {premium = true}) 
    --teleport_node:addChildKeywordNode(yesNode) 
    --teleport_node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())  