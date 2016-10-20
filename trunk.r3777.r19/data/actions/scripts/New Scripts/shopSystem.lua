local shop = {
	[7620] = {price = 50, count = 100}, --manapotion
	[7589] = {price = 80, count = 100}, --strong mana potion
	[7590] = {price = 120, count = 100}, --great mana potion
	[7618] = {price = 45, count = 100}, -- health potion
	[7588] = {price = 100, count = 100}, --strong health potion
	[7591] = {price = 190, count = 100}, --great health potion
	[2268] = {price = 108, count = 100}, --sudden death rune
	[2273] = {price = 175, count = 100}, --UH
	[2293] = {price = 116, count = 100}, --mWall
	[2269] = {price = 170, count = 100}, --wild growth
	[2313] = {price = 31, count = 100}, --explosion
	[2315] = {price = 37, count = 100}, --thunderstorm
	[2304] = {price = 180, count = 100}, --gfb
	[2274] = {price = 45, count = 100}, --avalanche
	[2262] = {price = 85, count = 100}, --EBomb
	[2286] = {price = 85, count = 100}, --PBomb
	[2305] = {price = 117, count = 100}, --FBomb
	[2168] = {price = 1000, count = 1},
	[2214] = {price = 5000, count = 1},
	[2173] = {price = 10000, count = 1}
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
	local itemPos = fromPosition
	itemPos.stackpos = 3
	local thing = getThingfromPos(itemPos)
	--Calcular precio
	local articulo = shop[thing.itemid]
	if(articulo ~= nil) then
		local precio = articulo.price * articulo.count
		local pMoney = getPlayerMoney(cid)
		local bankMoney = getPlayerBalance(cid)
		--Verifica si le alcanza con lo de la bolsa
		if(pMoney >= precio) then
			--Compra
			if(not doPlayerAddItem(cid, thing.itemid, articulo.count, false)) then
				doCreatureSay(cid,"I have no capacity... NOOB",MESSAGE_EVENT_ORANGE)
			else
				--Cobramos
				doPlayerRemoveMoney(cid, precio)
			end
		elseif(bankMoney >= precio) then
			local diff
			if(pMoney ~= 0) then
			--Calculamos la diferencia
				diff = math.abs(precio - pMoney)
			else
				diff = precio
			end
			--Quitamos del banco la diferencia
			if(not doPlayerAddItem(cid, thing.itemid, articulo.count, false)) then
				doCreatureSay(cid,"I have no capacity... NOOB",MESSAGE_EVENT_ORANGE)
			else
				--Cobramos
				doPlayerRemoveMoney(cid, pMoney)
				doPlayerDepositMoney(cid, -diff)
				doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You paid "..diff.." from your bank. You now have "..getPlayerBalance(cid).." from "..bankMoney..".")
			end
		end
		--doPlayerRemoveMoney(cid, money)
	end
end