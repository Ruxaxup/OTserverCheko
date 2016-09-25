local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end




local travelNode = keywordHandler:addKeyword({'Take'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Are you sure you want to go? .{lvl 250}. If you want you can go {back}.'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 250, cost = 0, destination = {x=160, y=53, z=8} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Good choice.'})


local travelNode = keywordHandler:addKeyword({'Back'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Sure?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 2, cost = 0, destination = {x=160, y=55, z=8} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Good choice.'})


npcHandler:addModule(FocusModule:new())