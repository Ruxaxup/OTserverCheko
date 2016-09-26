--
function onUse(cid, item, frompos, item2, topos)
 
if item.uid ==8008 then
queststatus = getPlayerStorageValue(cid,8891)
if queststatus == 1 then
doPlayerSendTextMessage(cid,22,"This Chest is empty.")
 
else
doPlayerSendTextMessage(cid,22,"You found a Paladin Armor")
doSendMagicEffect(topos,12)
coins_uid = doPlayerAddItem(cid,8891,1)
setPlayerStorageValue(cid,8891,1)
end
return 0
end
return 1
end
