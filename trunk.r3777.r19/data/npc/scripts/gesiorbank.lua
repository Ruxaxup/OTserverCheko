focus = 0
talk_start = 0
target = 0
dep = 0
wit = 0
trans = 0
following = false
attacking = false
 
gold_id = 2148
plat_id = 2152
crys_id = 2160
 
function onThingMove(creature, thing, oldpos, oldstackpos)
 
end
 
function onCreatureAppear(creature)
 
end
 
function onCreatureDisappear(cid, pos)
  	if focus == cid then
          selfSay('Good bye.')
          focus = 0
          talk_start = 0
		  doNpcSetCreatureFocus(0)
  	end
end
 
function onCreatureTurn(creature)
 
end
 
 
function onCreatureSay(cid, type, msg)
	msg_org = msg
  	msg = string.lower(msg)
        nome = getCreatureName(cid)
 
--------------------------------------Begin----------------------------------------------
 
  	if (msgcontains(msg, 'hi') or msgcontains(msg, 'hello')) and (focus == 0) and getDistanceToCreature(cid) < 4 then
		doNpcSetCreatureFocus(cid)
        dep = 0
        wit = 0
		trans = 0
  		selfSay('Hello ' .. nome .. '! What can I do for you? Deposit, withdraw, check balance or transfer?')
  		focus = cid
        talk_start = os.clock()  		
  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then --NPC is talking with other player
  		selfSay('Sorry '..nome..', I am already talking to a customer. Take a seat, please..')
    end
 
--------------------------------------Deposit----------------------------------------------
 
 
	if dep == 0 then
		if (msgcontains(msg, 'deposit')) and (focus == cid) and getDistanceToCreature(cid) < 4 then
			selfSay('Please tell me how much gold it is you would like to deposit.')
			dep = 1
			wit = 0
			trans = 0
	        talk_start = os.clock()
        end
	end
 
 
  	if dep == 1 then
		if (focus == cid) and getDistanceToCreature(cid) < 4 then
			n = getNumber(msg)
			if n ~= 0 then --player told valid number, higher than 0
				talk_start = os.clock()
				selfSay('Would you really like to deposit  '..n..' gold?')
				dep = 2
			end
		end
	end    
 
 
	if dep == 2 and (focus == cid) and getDistanceToCreature(cid) < 4 then
		if (msgcontains(msg, 'yes'))  then --player want deposit
			dep = 0
			talk_start = os.clock()
			if doPlayerRemoveMoney(cid, n) == TRUE then --get cash from player backpack
				setBA(nome,getBA(nome)+n)
				selfSay('Alright, we have added the amount of '..n..' gold to your balance. You can withdraw your money anytime you want to. Your account balance is '..getBA(nome)..'.')
			else --player doesn't have enought cash in backpack
				selfSay('You do not have enough gold.')
			end
		end
		if (msgcontains(msg, 'no')) then --player doesn't want deposit
			selfSay('As you wish. Is there something else I can do for you?')
			dep = 0
			talk_start = os.clock()
		end
	end
 
-------------------------------------------Withdraw---------------------------------------
 
	if wit == 0 then
		if (msgcontains(msg, 'withdraw')) and (focus == cid) and getDistanceToCreature(cid) < 4 then
			selfSay('Please tell me how much gold you would like to withdraw.')
			dep = 0
			trans = 0
			wit = 1
		    talk_start = os.clock()
	    end
	end
 
 
	if wit == 1 then
		if (focus == cid) and getDistanceToCreature(cid) < 4 then
			n = getNumber(msg)
			if n ~= 0 then --player told valid number, higher than 0
				talk_start = os.clock()
				selfSay('Are you sure you wish to withdraw '..n..' gold from your bank account?')
				wit = 2
			end
		end
	end 
 
 
	if wit == 2 and (focus == cid) and getDistanceToCreature(cid) < 4 then
		if (msgcontains(msg, 'yes'))  then --player want withdraw
			wit = 0
			talk_start = os.clock()
			if n <= getBA(nome) then --player has enought cash on account
				setBA(nome,getBA(nome)-n) --get cash from player account
 
				gold = n
				plat = 0
				crys = {}
				crys[1] = 0
				i = 1
				--start counting how many crystal, platinum and gold coins NPC should givve
				repeat
					if gold >= 100 then
						plat = plat + 1
						gold = gold - 100
					end
				until gold < 100
 
				repeat
					if plat >= 100 then
						if crys[i] == 100 then
							i = i + 1
							crys[i] = 0
						end
						crys[i] = crys[i] + 1
						plat = plat - 100
					end
				until plat < 100
				--now script give crytal, platinum and gold coins to player (BP/hands if free)
				if crys[1] > 0 then
					repeat
						doPlayerAddItem(cid, crys_id, crys[i])
						i = i-1
					until i == 0
				end
 
				if plat > 0 then
					doPlayerAddItem(cid, plat_id, plat)
				end
 
				if gold > 0 then
					doPlayerAddItem(cid, gold_id, gold)
				end
 
				selfSay('Here you are, '..n..' gold. Please let me know if there is something else I can do for you. Your account balance is '..getBA(nome)..'.')
			else --player doesn't have enought cash on this bank account, can't withdraw that much
				selfSay('There is not enough gold on your account.')
			end
		end
		if (msgcontains(msg, 'no')) then --player doesn't want to withdraw
			selfSay('The customer is king! Come back anytime you want to if you wish to withdraw your money.')
			wit = 0
			talk_start = os.clock()
		end
	end
 
-------------------------------------------Balance---------------------------------------
 
    if (msgcontains(msg, 'balance')) and (focus == cid) and getDistanceToCreature(cid) < 4 then --player who is talking with NPC want to know his account balance
		selfSay('Your account balance is '..getBA(nome)..' gold.')
		dep = 0
		wit = 0
		trans = 0
		talk_start = os.clock()
	end
 
-------------------------------------------Transfer---------------------------------------
 
	if trans == 3 and (focus == cid) and getDistanceToCreature(cid) < 4 then
		if (msgcontains(msg, 'yes')) then --if he want to tranfer
			playerbalance = getBA(nome) --get balance value of player
			if setBA(rec, getBA(rec)+quant) > 0 then -- if script set new balance get cash from transfering player account
				playerbalance = playerbalance - quant
				setBA(nome, playerbalance)
				selfSay('You have transferred '..quant..' gold to '..rec_org..'. Your account balance is '..playerbalance..' gold.')
				trans = 0
				talk_start = os.clock()
			else --problem with database? dont lose money..
				selfSay('Problem with transfer. Sorry.')
				trans = 0
				talk_start = os.clock()
			end
		elseif (msgcontains(msg, 'no')) then -- if he dont want to tranfer
			selfSay('Ok. What is next?')
			trans = 0
			talk_start = os.clock()  
		end
	end
 
	if trans == 2 and (focus == cid) and getDistanceToCreature(cid) < 4 then
		if getBA(msg) >= 0 then --player with this name exist
			rec = msg
			rec_org = msg_org
			selfSay('So you would like to transfer '..quant..' gold to '..rec_org..'?')
			trans = 3
			talk_start = os.clock()  
        else --player with this name doesn't exist
			selfSay('This player does not exist. Please tell me other name.')
			trans = 2
			talk_start = os.clock()  
		end
	end
 
	if trans == 1 and (focus == cid) and getDistanceToCreature(cid) < 4 then
		quant = getNumber(msg)
		if quant > 0 then -- its number and is higher than 0
			if getBA(nome) >= quant then -- player who want to transfer has enought cash on account
				selfSay('Who would you like transfer '..quant..' gold to?')
				trans = 2
				talk_start = os.clock()  
			else -- player who want to transfer has not enought cash on account
				selfSay('There is not enough gold on your account. Your account balance is '..getBA(nome)..'. Please tell me the amount of gold coins you would like to transfer.')
				trans = 1
				talk_start = os.clock()  
			end
		else --player told 0 or lower number or word like "asd" (its not a number)
			selfSay('Please tell me the amount of gold coins you would like to transfer.')
			talk_start = os.clock()  
			trans = 1
		end
	end
 
	if trans == 0 then
	if (msgcontains(msg, 'transfer')) and (focus == cid) and getDistanceToCreature(cid) < 4 then 
		selfSay('Please tell me the amount of gold coins you would like to transfer.')
		dep = 0
		wit = 0
		trans = 1
		talk_start = os.clock()
	end
	end
 
-------------------------------------------End--------------------------------------------
 
    if (msgcontains(msg, 'bye')) and (focus == cid) and getDistanceToCreature(cid) < 4 then --player say "bye" - npc answer
		doNpcSetCreatureFocus(0)
	    selfSay('Good bye.')
	    focus = 0
		dep = 0
		wit = 0
		trans = 0
    end
end
 
function onCreatureChangeOutfit(creature)
 
end
 
 
function onThink()
  	if (os.clock() - talk_start) > 30 then --if player did not say anything from 30 seconds say "next please" and wait for another customer
  		if focus > 0 then
			doNpcSetCreatureFocus(0)
  			selfSay('Next please...')
  		end
		focus = 0
        dep = 0
		wit = 0
		trans = 0
  	end
 	if focus ~= 0 then
 		if getDistanceToCreature(focus) > 5 then --if distance to player is higher than 5 say bye
			doNpcSetCreatureFocus(0)
 			selfSay('Good bye.')
 			focus = 0
            dep = 0
		    wit = 0
			trans = 0
 		end
 	end
end
 
 
function getNumber(txt) --return number if its number and is > 0, else return 0
x = string.gsub(txt,"%a","")
x = tonumber(x)
if x ~= nill and x > 0 then
return x
else
return 0
end
end
 
function msgcontains(txt, str)
  	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end
 
function setBA(name, nvalue) --save bank account value for online and offline players
	local cid = getPlayerByName(name)
	set_status = -1
	if isPlayer(cid) == TRUE then
		--player is online 
		setPlayerStorageValue(cid,300,nvalue)
		set_status = 1
		return 1
	else
		--player is offline, load DB connection info and connect
		dofile("./config.lua")
	    if sqlType == "mysql" then 
	         env = assert(luasql.mysql()) 
	         con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort)) 
	    else -- sqlite 
	         env = assert(luasql.sqlite3()) 
	         con = assert(env:connect(sqliteDatabase)) 
	    end 
		--check is player exist
		local nametodb = escapeString(name)
		result_plr = assert(con:execute("SELECT `id` FROM `players` WHERE `name` = '" .. nametodb .. "';"))
		player = result_plr:fetch({}, "a")
		local players = 0
		local guid = 0
		while player do
			players = players + 1
			guid = tonumber(player.id)
			player = result_plr:fetch (player, "a")
		end
		if players > 0 then
			if guid > 0 then
			--player exist, check his account status
				storageqry = assert(con:execute("SELECT `value` FROM `player_storage` WHERE `player_id` = '" .. guid .. "' AND `key` = 300;"))
				storage = storageqry:fetch({}, "a")
				local whiles = 0
				while storage do
					whiles = whiles + 1
					storage = storageqry:fetch (storage, "a")
				end
				if whiles < 1 then
					--if player hasn't account, create account and set account balance value 'nvalue'
					assert(con:execute("INSERT INTO `player_storage` (`player_id` ,`key` ,`value`) VALUES ('" .. guid .. "', '300', '" .. nvalue .. "');"))
					set_status = 1
				else
					assert(con:execute("UPDATE `player_storage` SET `value` = '" .. nvalue .. "' WHERE `player_id` = '" .. guid .. "' AND `key` = 300;"))
					set_status = 1
				end
			end
		else
			--player with this name doesn't exist
			set_status = -1
		end
		con:close()
		env:close()
	end
	--if player not exist return -1
	--if player exist return his bank account value
	return set_status
end
 
function getBA(name) -- check account balance for offline and online players
    local cid = getPlayerByName(name)
    if isPlayer(cid) == TRUE then
        --player is online 
        local player_cash_str = getPlayerStorageValue(cid, 300)
        --create bank account if not exist
        if player_cash_str < 0 then
            setPlayerStorageValue(cid,300,0)
            player_cash = 0
        else
            player_cash = player_cash_str
        end
    else
        --player is offline, load DB connection info and connect
        dofile("./config.lua")
        if sqlType == "mysql" then 
             env = assert(luasql.mysql()) 
             con = assert(env:connect(mysqlDatabase, mysqlUser, mysqlPass, mysqlHost, mysqlPort)) 
        else -- sqlite 
             env = assert(luasql.sqlite3()) 
             con = assert(env:connect(sqliteDatabase)) 
        end 
        --check is player exist
        local nametodb = escapeString(name)
        result_plr = assert(con:execute("SELECT `id` FROM `players` WHERE `name` = '" .. nametodb .. "';"))
        player = result_plr:fetch({}, "a")
        local players = 0
        local guid = 0
        while player do
            players = players + 1
            guid = tonumber(player.id)
            player = result_plr:fetch (player, "a")
        end
        if players > 0 then
            if guid > 0 then
            --player exist, check his account status
                storageqry = assert(con:execute("SELECT `value` FROM `player_storage` WHERE `player_id` = '" .. guid .. "' AND `key` = 300;"))
                storage = storageqry:fetch({}, "a")
                local whiles = 0
                while storage do
                    whiles = whiles + 1
                    player_cash = tonumber(storage.value)
                    storage = storageqry:fetch (storage, "a")
                end
                if whiles < 1 then
                    --if player hasn't account, create account and set account balance value to 0
                    assert(con:execute("INSERT INTO `player_storage` (`player_id` ,`key` ,`value`) VALUES ('" .. guid .. "', '300', '0');"))
                    player_cash = 0
                end
            end
        else
            --player with this name doesn't exist
            player_cash = -1
        end
        con:close()
        env:close()
    end
    --if player not exist return -1
    --if player exist return his bank account value
    return player_cash
end