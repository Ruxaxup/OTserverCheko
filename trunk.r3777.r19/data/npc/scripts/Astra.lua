local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)             end 
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)         end 
function onCreatureSay(cid, type, msg)         npcHandler:onCreatureSay(cid, type, msg)     end 
function onThink()                             npcHandler:onThink()                         end 

npcHandler:setMessage(MESSAGE_GREET, "Greetings |PLAYERNAME|. Hey, You look like your so fuckin bored, and I have a good job for you. Do you want to do a {task}?") 

function devovorgaQuest(cid, message, keywords, parameters, node) 
    if(not npcHandler:isFocused(cid)) then 
        return false 
    end 
    if (parameters.confirm ~= true) and (parameters.decline ~= true) then        
    end
    return false 
end 

function taskStage(cid, message, keywords, parameters, node)    
    local msg = ""
    for creature, info in pairs(TASKS_INFO) do
        msg = msg .. info.count .. " {" .. creature .. "}, "
    end
    local len = string.len(msg) - 2
    msg = string.sub(msg,1,len)
    npcHandler:say("You may kill " .. msg .. ". When you are done, just come back and claim your {reward}.", cid)
    npcHandler:resetNpc()
    return true
end

function rewardStage(cid, message, keywords, parameters, node)    
    message = string.lower(message)
    if(message == "reward") then
        npcHandler:say("Which task did you finish? (Ex. {demon})",cid)
    else
        local creature = TASKS_INFO[message]
        print(message)
        if(creature == nil) then
            npcHandler:say("And so what? I didn't ask for that monster... GO AWAY!: "..message,cid)
            npcHandler:resetNpc()
            npcHandler:releaseFocus(cid)
        else
            local monsterSlain = getPlayerStorageValue(cid, creature.s)
            local monsterNeeded = creature.count

            if(monsterSlain >= monsterNeeded) then
                npcHandler:say("Nice JOB! (moron...) Take your reward.",cid)
                doPlayerAddItem(cid, creature.r, 1)
                doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREWORK_YELLOW)
                if(message == "demon") then
                    doPlayerSetStorageValue(cid, creature.s, -2)
                else
                    doPlayerSetStorageValue(cid, creature.s, 0)
                end
                
                npcHandler:resetNpc()
            else
                npcHandler:say("You still need to slay "..(monsterNeeded - monsterSlain).." more. Come back later.",cid)
                npcHandler:resetNpc()
            end
        end
        
    end
    return true
end

local task_node = keywordHandler:addKeyword({'task'}, taskStage, {}) 
local reward_node = keywordHandler:addKeyword({'reward'}, rewardStage, {})

for creature, info in pairs(TASKS_INFO) do    
    reward_node:addChildKeywordNode(KeywordNode:new({''..string.lower(creature)}, rewardStage, {}))
end
npcHandler:addModule(FocusModule:new())  