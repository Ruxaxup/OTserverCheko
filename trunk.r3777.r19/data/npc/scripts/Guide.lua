local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 

NpcSystem.parseParameters(npcHandler) 


function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end 
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end 
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end 
function onThink()                             npcHandler:onThink()                         end 

npcHandler:setMessage(MESSAGE_GREET, "Welcome to our server |PLAYERNAME|!!!. If you need some guidance, just say {help}.") 
npcHandler:setMessage(MESSAGE_FAREWELL, "Bring your friends!!! We got a lot of party quests and bosses!!!") 

function needInfo(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then 
        npcHandler:say('Well! First of all, you can see a lot of {marks} in your map.',cid)
        npcHandler:say('I recommend you killing some Rotworms until you can deal Cyclops.',cid)
        npcHandler:say('Also. I want you to know that {promotion} is for FREE. So, get level 20 fast!!!',cid)
        npcHandler:say('There are an extended variety of {tasks}, like Rotworms one.',cid)
        npcHandler:say('In this Island you can find a lot of hunting spots, but there are other {cities} with {quests} and higher level spots.',cid)
        npcHandler:say('For last but not least, remember to use the command !stats so you can boost your player with unique extra abilities',cid)
    elseif (parameters.confirm == true) then

    elseif (parameters.decline == true) then

    end 
    return false 
end 

function promotionNode( cid, message, keywords, parameters, node )
    npcHandler:say('You can ask for promotion to King Arthas VII. He is upstairs waiting for you.',cid)
end

function citiesNode( cid, message, keywords, parameters, node )
    npcHandler:say('This place is called Forbidden. But there are others for higher levels like Lost Island.',cid)
    npcHandler:say('If you wish, you can ask to Captain Zoria located at south east. He might me able to take you to different cities.',cid)
end

function tasksNode( cid, message, keywords, parameters, node )
    npcHandler:say('When you kill a creature belonging to a task, a message will be displayed in Default channel telling you how many mobs have you killed so far.',cid)    
    npcHandler:say('As the same way, when you finish it, a message will tell you that you can claim your reward.',cid)    
    npcHandler:say('To claim your reward visit Alesar at upstairs, he will also inform you about general tasks.',cid)    
end

function marksNode( cid, message, keywords, parameters, node )
    markMap(cid)    
    npcHandler:say('I\'ve marked your map in case you have lost them. But you can always use the command !mark to obtain our recommended spots.',cid)
end

function questsNode( cid, message, keywords, parameters, node )
    npcHandler:say('There is an old pharaoh in this city that we named Story Teller. He never told us his name but he loves to relate stories about special places.',cid)
    npcHandler:say('Look for him at North East of the city, you may find something useful.',cid)
end

local noNode = KeywordNode:new({'no'}, teleportNode, {decline = true}) 
local yesNode = KeywordNode:new({'yes'}, teleportNode, {confirm = true}) 

local main_node = keywordHandler:addKeyword({'help'}, needInfo, {})
local main_node = keywordHandler:addKeyword({'promotion'}, promotionNode, {})
local main_node = keywordHandler:addKeyword({'cities'}, citiesNode, {})
local main_node = keywordHandler:addKeyword({'tasks'}, tasksNode, {})
local main_node = keywordHandler:addKeyword({'marks'}, marksNode, {})
local main_node = keywordHandler:addKeyword({'quests'}, questsNode, {})

local teleport_node = keywordHandler:addKeyword({'teleport'}, teleportNode, {premium = true}) 
    teleport_node:addChildKeywordNode(yesNode) 
    teleport_node:addChildKeywordNode(noNode)

npcHandler:addModule(FocusModule:new())  