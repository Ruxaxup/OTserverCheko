local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end
function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
	local t = 
		{
			["Demon"] = {s = 3000, r = 2173, count = 6666},
			["Juggernaut"] = {s = 3001, r = 2173, count = 500},
			["Hellfire Fighter"] = {s = 3002, r = 2173, count = 400},
			["Fire Overlord"] = {s = 3003, r = 2173, count = 300},
			["Sea Serpent"] = {s = 3004, r = 2173, count = 300},
			["Wyrm"] = {s = 3005, r = 2173, count = 200},
			["Zombie"] = {s = 3006, r = 2173, count = 200},
			["Banshee"] = {s = 3007, r = 2173, count = 300},
			["Medusa"] = {s = 3008, r = 2173, count = 400},
			["Blazing Fire Elemental"] = {s = 3009, r = 2173, count = 400},
			["Giant Spider"] = {s = 3010, r = 2173, count = 300},
			["Frost Dragon"] = {s = 3011, r = 2173, count = 300},
			["Massive Energy Elemental"] = {s = 3012, r = 2173, count = 400},
			["Massive Water Elemental"] = {s = 3013, r = 2173, count = 400},
			["Rotworm"] = {s = 3013, r = 2139, count = 100}
		}
	for name, v in pairs(t) do
		if msgcontains(msg, 'tasks') or msgcontains(msg, 'task') or msgcontains(msg, 'quest') then
			npcHandler:say('Hey, You look like your so fuckin bored, and I have a good job for you. Do you want to do your first task?', cid)
			talkState[talkUser] = 2
			break
		elseif msgcontains(msg, 'yes') or msgcontains(msg, 'yup') or msgcontains(msg, 'yeah') and talkState[talkUser] == 2 then
			npcHandler:say('Ok, heres your tasks, go and kill 100 of Demons, Juggernaut, Hellfire Fighter, Fire Overlord, Sea Serpents, Wyrms, Zombies, Banshees, Medusa, Blazing Fire Elemental, Giant Spider, Frost Dragon, Massive Energy Elemental, Massive Water Elemental, and come back to take your reward! After your done just come and fucking say {reward}.', cid)
			talkState[talkUser] = 3
			break
		elseif msgcontains(msg, 'reward') and getPlayerStorageValue(cid, v.s) >= v.count and talkState[talkUser] == 3 then
			npcHandler:say('Congratz, Heres your reward!', cid)
			doPlayerAddItem(cid, v.r, 1)
			break
		else
			npcHandler:say('Ok then.', cid)
			talkState[talkUser] = 0
			break
		end
	end
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())