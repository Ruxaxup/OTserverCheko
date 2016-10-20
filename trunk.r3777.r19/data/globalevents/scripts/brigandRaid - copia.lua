local config = {
	broadcast = "no"
}

local spawnPoints = {
	{ x = 1257, y = 951, z = 7} ,
	{ x = 1034, y = 1156, z = 7} ,
	{ x = 819, y = 1067, z = 7}
}

config.broadcast = getBooleanFromString(config.broadcast)

local function brigandRaid( )
	-- body
	local tableSize =table.maxn(spawnPoints)
	if(tableSize > 0) then
		local randomPos = math.random(1,tableSize)
		local spawn = spawnPoints[randomPos]
		if(spawn ~= nil) then
			print("Brigand appeared at: {"..spawn.x..","..spawn.y..","..spawn.z.."}")
			doSummonCreature("Brigand", spawn)
			doBroadcastMessage("The Brigand has arrived!!! Kill him and you might be rewarded.")
		end
	end
	
end

local function executeRaid(seconds)
	if(seconds == 0) then
		brigandRaid()
		return true
	end

	if(seconds == 120 or seconds == 30) then
		doBroadcastMessage("There are roumors that a Brigand scaped from Treasure Island. He will arrive in " .. seconds .. " seconds to Forgotten.")
	end

	seconds = seconds - 30
	if(seconds >= 0) then
		addEvent(executeRaid, 30 * 1000, seconds)
	end
end

function onThink(interval, lastExecution, thinkInterval)
	if(not config.broadcast) then
		brigandRaid()
		return true
	end

	executeRaid(300)
	return true
end
