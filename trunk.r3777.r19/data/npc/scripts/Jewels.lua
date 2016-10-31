local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)                npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)             npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)            npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                    npcHandler:onThink()                    end



local items = {

{id = 2143, sell = 160},
{id = 2144, sell = 280},
{id = 2145, sell = 300},
{id = 2146, sell = 250},
{id = 2157, sell = 250},
{id = 2149, sell = 250},
{id = 2150, sell = 200},
{id = 9970, sell = 250},
{id = 9971, sell = 5000},
{id = 2151, sell = 320},
{id = 2159, sell = 100},
{id = 7632, sell = 3000}

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

	if isInArray({"trade"}, string.lower(msg)) then
		npcHandler:say("Here\'s my offer, |PLAYERNAME|. Don\'t you like it?", cid)
	if doPlayerAddAchievement then --Do you have an achievements system?
		doPlayerAddAchievement(cid, "Si, Ariki!", true)
	end
		openShopWindow(cid, items, onBuy, onSell)
	elseif string.lower(msg) == "name" then
		return npcHandler:say("I am Oiriz.", cid)
	elseif string.lower(msg) == "job" then
		return npcHandler:say("I am the best jeweller of Khazad-dûm", cid)
	end
	return true
end

--shopModule:addBuyableItem({'white pearl'}, 2143, 320, 'white pearl')
--shopModule:addBuyableItem({'black pearl'}, 2144, 560, 'black pearl')
--shopModule:addBuyableItem({'small diamond'}, 2145, 600, 'small diamond')
--shopModule:addBuyableItem({'small sapphire'}, 2146, 500, 'small sapphire')
--shopModule:addBuyableItem({'small ruby'}, 2147, 500, 'small ruby')
--shopModule:addBuyableItem({'small emerald'}, 2149, 500, 'small emerald')
--shopModule:addBuyableItem({'small amethyst'}, 2150, 400, 'small amethyst')

--shopModule:addBuyableItem({'bronze goblet'}, 5807, 2000, 'bronze goblet')
--shopModule:addBuyableItem({'silver goblet'}, 5806, 3000, 'silver goblet')
--shopModule:addBuyableItem({'golden goblet'}, 5805, 5000, 'golden goblet')

--shopModule:addBuyableItem({'wedding ring'}, 2121, 990, 'wedding ring')
--shopModule:addBuyableItem({'golden amulet'}, 2130, 6600, 'golden amulet')
--shopModule:addBuyableItem({'ruby necklace'}, 2133, 3560, 'ruby necklace')


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())