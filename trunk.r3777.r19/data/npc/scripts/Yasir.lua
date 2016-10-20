local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                      npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

local items = {

{id = 11207, sell = 10},
{id = 11202, sell = 50},
{id = 5883, sell = 120},
{id = 11210, sell = 15},
{id = 12362, sell = 30},
{id = 12428, sell = 55},
{id = 6492, sell = 2000},
{id = 5894, sell = 50},
{id = 5896, sell = 100},
{id = 5930, sell = 2000},
{id = 10561, sell = 190},
{id = 12365, sell = 300},
{id = 12366, sell = 320},
{id = 10549, sell = 100},
{id = 5912, sell = 200},
{id = 10583, sell = 200},
{id = 11321, sell = 150},
{id = 5898, sell = 80},
{id = 11188, sell = 210},
{id = 11231, sell = 180},
{id = 10562, sell = 120},
{id = 12619, sell = 380},
{id = 12620, sell = 210},
{id = 12368, sell = 30},
{id = 12577, sell = 340},
{id = 11329, sell = 100},
{id = 12370, sell = 20},
{id = 12569, sell = 8000},
--{id = 13877, sell = 4000},
{id = 12369, sell = 35},
{id = 12578, sell = 120},
{id = 5913, sell = 100},
{id = 10605, sell = 30},
{id = 10604, sell = 800},
{id = 11211, sell = 50},
{id = 11186, sell = 35},
{id = 5480, sell = 2000},
{id = 11212, sell = 28},
{id = 5890, sell = 30},
{id = 10550, sell = 15},
{id = 12431, sell = 110},
{id = 11213, sell = 45},
--{id = 15486, sell = 150},
{id = 11320, sell = 700},
{id = 6536, sell = 50000},
{id = 11183, sell = 35},
--{id = 15482, sell = 210},
{id = 10554, sell = 280},
{id = 10555, sell = 150},
{id = 12372, sell = 500},
{id = 11321, sell = 320},
{id = 10573, sell = 55},
{id = 11214, sell = 48},
{id = 5527, sell = 300},
{id = 5954, sell = 1000},
{id = 10563, sell = 80},
{id = 12373, sell = 120},
{id = 6546, sell = 50000},
{id = 9948, sell = 5000},
{id = 5919, sell = 8000},
{id = 11355, sell = 175},
{id = 12374, sell = 100},
{id = 12575, sell = 550},
{id = 12576, sell = 430},
{id = 11187, sell = 150},
{id = 12382, sell = 90},
{id = 12381, sell = 50},
{id = 10551, sell = 45},
{id = 5891, sell = 20000},
{id = 11217, sell = 360},
{id = 12588, sell = 390},
{id = 10552, sell = 375},
{id = 5895, sell = 150},
{id = 12383, sell = 30},
{id = 5885, sell = 10000},
{id = 10574, sell = 160},
{id = 10564, sell = 30},
{id = 10577, sell = 280},
{id = 12375, sell = 80},
{id = 12380, sell = 120},
{id = 11360, sell = 700},
{id = 12384, sell = 60},
{id = 12360, sell = 30},
{id = 8971, sell = 500},
{id = 9967, sell = 25},
{id = 9966, sell = 20},
{id = 9968, sell = 30},
{id = 12456, sell = 20},
{id = 5877, sell = 100},
{id = 5920, sell = 100},
{id = 5910, sell = 200},
{id = 12363, sell = 350},
{id = 11194, sell = 55},
{id = 10575, sell = 85},
{id = 5925, sell = 70},
{id = 2743, sell = 50},
{id = 10553, sell = 500},
{id = 11215, sell = 475},
{id = 11326, sell = 550},
{id = 11327, sell = 130},
{id = 5922, sell = 90},
{id = 5902, sell = 40},
{id = 12386, sell = 80},
{id = 11193, sell = 600},
{id = 5880, sell = 500},
{id = 12387, sell = 180},
{id = 12388, sell = 100},
{id = 11366, sell = 80},
{id = 11328, sell = 500},
{id = 10607, sell = 60},
{id = 12597, sell = 300},
{id = 5876, sell = 150},
{id = 5881, sell = 120},
{id = 12371, sell = 1000},
{id = 10608, sell = 10},
{id = 11216, sell = 130},
{id = 5904, sell = 8000},
{id = 11238, sell = 100},
{id = 12406, sell = 280},
{id = 12428, sell = 75},
{id = 5878, sell = 80},
{id = 12430, sell = 60},
{id = 6537, sell = 50000},
{id = 10579, sell = 420},
{id = 11225, sell = 50},
{id = 10584, sell = 150},
{id = 10577, sell = 700},
{id = 12431, sell = 250},
{id = 11231, sell = 75},
{id = 12432, sell = 25},
{id = 12403, sell = 430},
{id = 5804, sell = 2000},
{id = 12396, sell = 30},
{id = 11113, sell = 150},
{id = 12394, sell = 85},
{id = 12398, sell = 30},
{id = 5893, sell = 250},
{id = 11331, sell = 250},
{id = 12400, sell = 20},
{id = 11190, sell = 15},
{id = 10580, sell = 420},
{id = 6540, sell = 50000},
{id = 10558, sell = 45},
{id = 10610, sell = 10},
{id = 12401, sell = 25},
{id = 12402, sell = 10},
{id = 10557, sell = 50},
{id = 10567, sell = 30},
{id = 12400, sell = 60},
{id = 12429, sell = 110},
{id = 12408, sell = 500},
{id = 12405, sell = 350},
{id = 12407, sell = 410},
{id = 12404, sell = 140},
{id = 5948, sell = 200},
{id = 5882, sell = 200},
{id = 5911, sell = 300},
{id = 12409, sell = 66},
{id = 11228, sell = 400},
{id = 12410, sell = 120},
{id = 11367, sell = 20},
{id = 12629, sell = 680},
{id = 10547, sell = 280},
{id = 10568, sell = 25},
{id = 12466, sell = 230},
{id = 11229, sell = 450},
{id = 10583, sell = 520},
{id = 7732, sell = 150},
{id = 11324, sell = 25},
{id = 12395, sell = 45},
{id = 11209, sell = 35},
{id = 6524, sell = 3000},
{id = 12397, sell = 80},
{id = 11191, sell = 50},
{id = 12468, sell = 95},
{id = 12406, sell = 480},
{id = 2062, sell = 150},
{id = 12469, sell = 70},
{id = 10610, sell = 400},
{id = 5875, sell = 2000},
{id = 5809, sell = 6000},
{id = 8859, sell = 10},
{id = 5879, sell = 100},
{id = 11325, sell = 100},
{id = 10559, sell = 95},
{id = 2800, sell = 15},
{id = 2799, sell = 20},
{id = 11189, sell = 120},
{id = 11226, sell = 600},
{id = 2174, sell = 200},
{id = 11210, sell = 50},
{id = 10602, sell = 20},
{id = 12628, sell = 240},
{id = 11198, sell = 80},
{id = 10601, sell = 120},
{id = 12622, sell = 5000},
{id = 11364, sell = 50},
{id = 11365, sell = 60},
{id = 11363, sell = 170},
{id = 11190, sell = 95},
{id = 6539, sell = 50000},
{id = 6534, sell = 50000},
{id = 6535, sell = 50000},
{id = 11224, sell = 150},
{id = 10560, sell = 100},
{id = 2805, sell = 25},
{id = 12432, sell = 50},
{id = 5899, sell = 90},
{id = 8614, sell = 100},
{id = 11367, sell = 200},
{id = 11227, sell = 480},
{id = 5905, sell = 100},
{id = 10602, sell = 275},
{id = 11322, sell = 200},
{id = 11235, sell = 30},
{id = 11234, sell = 380},
{id = 5909, sell = 100},
{id = 11328, sell = 110},
{id = 11230, sell = 800},
{id = 11212, sell = 20},
{id = 10569, sell = 60},
{id = 5897, sell = 70},
{id = 5901, sell = 5},
{id = 11236, sell = 15},
{id = 10581, sell = 400},
{id = 10582, sell = 400},
{id = 10561, sell = 265},
{id = 5914, sell = 150},
{id = 11330, sell = 600},
{id = 11331, sell = 150}
}

for _, it in ipairs(items) do
	it.name = string.lower(getItemNameById(it.id))
end

local shop = {}

function onSell(cid, item, subType, amount)
	for _, it in ipairs(items) do
		shop[it.id] = {price = it.sell, name = it.name}
	end
	if getPlayerItemCount(cid, item) >= amount and doPlayerRemoveItem(cid, item, amount) then
		doPlayerAddMoney(cid, amount * shop[item].price)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sold x" .. amount .. " " .. shop[item].name .. " for " .. shop[item].price * amount .. " gold.")
	else
		doPlayerSendCancel(cid, "You do not have that item.")
	end
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

	if isInArray({"trade", "ariki"}, string.lower(msg)) then
		npcHandler:say("Si! Haneka ariki!", cid)
	if doPlayerAddAchievement then --Do you have an achievements system?
		doPlayerAddAchievement(cid, "Si, Ariki!", true)
	end
		openShopWindow(cid, items, onBuy, onSell)
	elseif string.lower(msg) == "name" then
		return npcHandler:say("Me Yasir.", cid)
	elseif string.lower(msg) == "job" then
		return npcHandler:say("Tje hari ku ne finjala. {Ariki}?", cid)
	elseif string.lower(msg) == "passage" then
		return npcHandler:say("Soso yana. <shakes his head>", cid)
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setMessage(MESSAGE_FAREWELL,"Si, jema ze harun. <waves>")
npcHandler:addModule(FocusModule:new())