function onSay(cid, words, param, channel)
	local players = 10 -- The amount of max players that is shown in each list
    local str, level, name, result = "","","",0,nil -- don't touch --
       
    str,level,name = "HIGHSCORES\n[#]-[Name]-[lvl]\n-----------","level","name"
    result = db.getResult("SELECT `id`, `name`, `level` FROM `players` WHERE players.group_id <> 6 ORDER BY `level` DESC LIMIT 10;")       

    if (result:getID() ~= -1) then
        local i = 1
        while TRUE do
            str = str .. "\n " .. i .. ". - " .. result:getDataString("name") .. " - [" .. result:getDataInt(level) .. "] "
            i = i+1
            if not(result:next()) or i > players then
        	    break
            end
    	end
        result:free()
    end
    if str ~= "" then
        doPlayerPopupFYI(cid, str)
    end

	return true
end