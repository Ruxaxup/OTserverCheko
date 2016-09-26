
local nplayerpos = {x=856, y=1364, z=13}
function onUse(cid, item, frompos, item2, topos)

local playerpos = getPlayerPosition(cid)
if item.uid == 10259 and item.itemid == 1945 then
doTransformItem(item.uid,1946)
doSendMagicEffect(playerpos,2)
doTeleportThing(cid,nplayerpos)
doSendMagicEffect(nplayerpos,10)
elseif item.uid == 10259 and item.itemid == 1946 then
doTransformItem(item.uid,1945)
else
doPlayerSendCancel(cid,"Sorry, not possible.")
end
return 1
end  
