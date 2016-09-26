function onUse(cid, item, frompos, item2, topos)
local getgate = getThingfromPos({x=942, y=1281, z=10, stackpos=1})

if item.uid == 10255 and item.itemid == 1945 and getgate.itemid == 1304 then
doRemoveItem(getgate.uid,1)
doTransformItem(item.uid,item.itemid+1)
elseif item.uid == 10255 and item.itemid == 1946 and getgate.itemid == 0 then
doCreateItem(1304,1,{x=942, y=1281, z=10, stackpos=1})
doTransformItem(item.uid,item.itemid-1)
else
doPlayerSendCancel(cid,"Sorry not possible.")
end
  return 1
  end