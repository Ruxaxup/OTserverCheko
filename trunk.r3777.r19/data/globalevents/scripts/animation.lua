local config = {
	broadcast = "no"
}

local spawnPoints = {
	{x = 1028, y = 1037, z = 7} ,
	{x = 1040, y = 1037, z = 7}
}

local msg = {
	"NPCs",
	"Offline Training",
	"PVP Arena",
	"Trainers",
	"Task Dealer",
	"Free Promo"
}

local colors = {
	TEXTCOLOR_BLUE,
	TEXTCOLOR_GREEN,
	TEXTCOLOR_TEAL,
	TEXTCOLOR_LIGHTGREEN,
	TEXTCOLOR_LIGHTBLUE,
	TEXTCOLOR_BROWN,
	TEXTCOLOR_GREY,
	TEXTCOLOR_PURPLE,
	TEXTCOLOR_RED,
	TEXTCOLOR_PINK,
	TEXTCOLOR_ORANGE,
	TEXTCOLOR_YELLOW,
	TEXTCOLOR_WHITE
}

local colorsSize = table.maxn(colors)
local msgSize = table.maxn(msg)

config.broadcast = getBooleanFromString(config.broadcast)

local function mensajes( msgID )
	local msgText = msg[msgID]
	local color = colors[math.random(1,colorsSize)]
	doSendAnimatedText({x = 1028, y = 1037, z = 7}, msgText, color)
	doSendAnimatedText({x = 1040, y = 1037, z = 7}, msgText, color)
	doSendAnimatedText({x = 1040, y = 1046, z = 7}, msgText, color)
	doSendAnimatedText({x = 1028, y = 1046, z = 7}, msgText, color)


end

local function animate()
	mensajes(math.random(1,msgSize))
	-- Promo and task
	doSendAnimatedText({x = 1033, y = 1042, z = 6}, "Promotion", TEXTCOLOR_YELLOW)
	doSendAnimatedText({x = 1035, y = 1042, z = 6}, "Tasker", TEXTCOLOR_LIGHTBLUE)
end



function onThink(interval, lastExecution, thinkInterval)
	if(not config.broadcast) then
		animate()
		return true
	end

	animate()
	return true
end
