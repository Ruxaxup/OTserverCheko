--local itemsNeeded = {5954,5925,6551,5898,5658,6500,9969,11360}
local itemsCount = {
    [5954] = 200,    
    [5925] = 500,    
    [6551] = 100,    
    [5898] = 10,     
    [6558] = 20,    
    [6500] = 1000,   
    [9969] = 20,     
    [11360] = 100   
}

function onSay(cid, words, param, channel)
	local questID = tonumber(param)
	
	if(not questID) then
		return true
	end

	if(questID == LIFE_STEAL_PERC) then
		doPlayerSetStorageValue(cid,LIFE_STEAL_PERC,getPlayerStorageValue(cid,LIFE_STEAL_PERC) + 0.05 )
	end

	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPlayerStorageValue(cid,questID))
	local allItems = true
	for k,v in pairs(itemsCount) do 
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "key: "..k.."Value: "..v) 
		if(getPlayerItemCount(cid,k) < v) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "key: "..k..", Needed: "..v .. " - Got: " .. getPlayerItemCount(cid,k))
            allItems = false
            break;                	
        end

	end

	if(allItems) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have the items needed.") 
    end

	return true
end
