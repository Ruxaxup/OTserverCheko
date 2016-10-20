local config = {
	bosses={---aid of portal, position where it sends, value it sets, text it shows
		[7001] = {pos={x=2330, y=2253, z=3, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[7002] = {pos={x=2285, y=2267, z=5, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[7003] = {pos={x=2201, y=2319, z=6, stackpos=1}, value=3, text="Entering The Vats"},
		[7004] = {pos={x=2309, y=2311, z=6, stackpos=1}, value=4, text="Entering The Arcanum"},
		[7005] = {pos={x=2404, y=2413, z=5, stackpos=1}, value=5, text="Entering The Hive"},
		[7006] = {pos={x=2486, y=2254, z=6, stackpos=1}, value=6, text="Entering The Shadow Nexus"}
		},
	mainroom={---aid, position, lowest value that can use this portal, text
		[7101] = {pos={x=2330, y=2253, z=3, stackpos=1}, value=1, text="Entering The Crystal Caves"},
		[7102] = {pos={x=2285, y=2267, z=5, stackpos=1}, value=2, text="Entering The Blood Halls"},
		[7103] = {pos={x=2201, y=2319, z=6, stackpos=1}, value=3, text="Entering The Vats"},
		[7104] = {pos={x=2309, y=2311, z=6, stackpos=1}, value=4, text="Entering The Arcanum"},
		[7105] = {pos={x=2404, y=2413, z=5, stackpos=1}, value=5, text="Entering The Hive"}	
		},
	portals={---aid, position, text
		[7200] = {pos={x=2217, y=2197, z=7}, text="Escaping to the Retreat..."},
		[7201] = {pos={x=1715, y=2330, z=5}, text="Entering Ushuriel's Ward"},
		[7202] = {pos={x=2341, y=2183, z=5}, text="Entering The Sunken Cave"},
		[7203] = {pos={x=2286, y=2329, z=5}, text="Entering The Ward of Zugurosh"},
		[7204] = {pos={x=2304, y=2243, z=5}, text="Entering The Foundry"},
		[7205] = {pos={x=2269, y=2370, z=5}, text="Entering The Ward of Madareth"},
		[7206] = {pos={x=2201, y=2249, z=6}, text="Entering The Battlefield"},
		[7207] = {pos={x=2304, y=2370, z=5}, text="Entering The Ward of The Demon Twins"},
		[7208] = {pos={x=2396, y=2254, z=6}, text="Entering The Soul Wells"},
		[7209] = {pos={x=2344, y=2330, z=5}, text="Entering The Ward of Annihilon"},
		[7210] = {pos={x=2349, y=2372, z=5}, text="Entering Hellgorak's Ward"}	
		},
	storage=77077,---storage used in boss and mainroom portals
	walkback="You don't have enough energy to enter this portal",---message if you cannot use mainroom portal
	e={}	}----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}
function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if(config.bosses[item.actionid]) then
			local t= config.bosses[item.actionid]
			if getPlayerStorageValue(cid, config.storage)< t.value then
				setPlayerStorageValue(cid, config.storage, t.value)
			end
			doTeleportThing(cid, t.pos)
			doCreatureSayWithDelay(cid,t.text,19,1, config.e)
		elseif(config.mainroom[item.actionid]) then
			local t= config.mainroom[item.actionid]
			if getPlayerStorageValue(cid, config.storage)>=t.value then
				doTeleportThing(cid, t.pos)
				doCreatureSayWithDelay(cid,t.text,19,1,config.e)
			else
				doTeleportThing(cid, fromPosition)
				doCreatureSay(cid, config.walkback, 19)
			end
		elseif(config.portals[item.actionid]) then
			local t= config.portals[item.actionid]
			doTeleportThing(cid, t.pos)
			doCreatureSayWithDelay(cid,t.text,19,1,config.e)
		end
	end
end