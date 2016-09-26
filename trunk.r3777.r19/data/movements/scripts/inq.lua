local config = {
	bosses={---aid of portal, position where it sends, value it sets, text it shows
	
[1001] = {pos={x=996, y=1304, z=8, stackpos=1}, value=1, text="Recieve energy of the Crystal Caves"},
	
[1002] = {pos={x=1146, y=1360, z=9, stackpos=1}, value=2, text="Recieve energy of the Halls"},
	
[1003] = {pos={x=948, y=1405, z=10, stackpos=1}, value=3, text="Recieve energy of the Vats"},
		
[1004] = {pos={x=1030, y=1341, z=8, stackpos=1}, value=4, text="Recieve energy of the Arcanum"},
		
[1005] = {pos={x=800, y=1392, z=8, stackpos=1}, value=5, text="Recieve energy of the Hive"},
		
[1006] = {pos={x=841, y=1404, z=8, stackpos=1}, value=6, text="Entering The Shadow Nexus"}
		},
	

mainroom={---aid, position, lowest value that can use this portal, text
		

[2001] = {pos={x=998, y=1312, z=11, stackpos=1}, value=1, text="Entering The Crystal Caves"},
	
[2002] = {pos={x=1155, y=1381, z=11, stackpos=1}, value=2, text="Entering The Blood Halls"},
	
[2003] = {pos={x=871, y=1428, z=10, stackpos=1}, value=3, text="Entering The Vats"},
		
[2004] = {pos={x=894, y=1331, z=8, stackpos=1}, value=4, text="Entering The Arcanum"},
		
[2005] = {pos={x=775, y=1469, z=11, stackpos=1}, value=5, text="Entering The Hive"}	},
	

portals={---aid, position, text
		
[3000] = {pos={x=996, y=1418, z=10}, text="Escaping back to the Retreat!"},
		
[3001] = {pos={x=952, y=1420, z=8}, text="Entering The Ward of Ushuriel"},
		
[3002] = {pos={x=961, y=1483, z=8}, text="Entering The Undersea Kingdom"},
		
[3003] = {pos={x=974, y=1399, z=8}, text="Entering The Ward of Zugurosh"},
		
[3004] = {pos={x=1142, y=1358, z=8}, text="Entering The Foundry"},
		
[3005] = {pos={x=997, y=1459, z=8}, text="Entering The Ward of Madareth"},
		
[3006] = {pos={x=1098, y=1472, z=8}, text="Entering The Battlefield"},
		
[3007] = {pos={x=965, y=1449, z=8}, text="Entering The Ward of The Demon Twins"},
	
[3008] = {pos={x=887, y=1392, z=8}, text="Entering The Soul Wells"},
	
[3009] = {pos={x=1001, y=1400, z=8}, text="Entering The Ward of Annihilon"},
	
[3010] = {pos={x=945, y=1398, z=8}, text="Entering The Ward of Hellgorak"}	},
	

storage=56123,---storage used in boss and mainroom portals
	e={}	}----dunno whats this but have to be like this to make doCreatureSayWithDelay working, DON'T TOUCH}
function onStepIn(cid, item, position, fromPosition)
	if isPlayer(cid) == TRUE then
		if(config.bosses[item.actionid]) then
			local t= config.bosses[item.actionid]
			if getPlayerStorageValue(cid, config.storage)< t.value then
				setPlayerStorageValue(cid, config.storage, t.value)
			end
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,19,1, config.e)
		elseif(config.mainroom[item.actionid]) then
			local t= config.mainroom[item.actionid]
			if getPlayerStorageValue(cid, config.storage)>=t.value then
				doTeleportThing(cid, t.pos)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid,t.text,19,1,config.e)
			else
				doTeleportThing(cid, fromPosition)
				doSendMagicEffect(getCreaturePosition(cid),10)
				doCreatureSay(cid, 'You don\'t have enough energy to enter this portal', TALKTYPE_ORANGE_1)
			end
		elseif(config.portals[item.actionid]) then
			local t= config.portals[item.actionid]
			doTeleportThing(cid, t.pos)
			doSendMagicEffect(getCreaturePosition(cid),10)
			doCreatureSay(cid,t.text,19,1,config.e)
		end
	end
end
