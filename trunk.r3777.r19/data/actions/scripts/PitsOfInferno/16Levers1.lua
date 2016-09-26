function onUse(cid, item, frompos, item2, topos)

wallpos = {x=458, y=1386, z=11, stackpos=1}
wall = getThingfromPos(wallpos)

leverpos1 = {x=481, y=1387, z=11, stackpos=1}
lever1 = getThingfromPos(leverpos1)
leverpos2 = {x=498, y=1381, z=13, stackpos=1}
lever2 = getThingfromPos(leverpos2)
leverpos3 = {x=450, y=1405, z=13, stackpos=1}
lever3 = getThingfromPos(leverpos3)
leverpos4 = {x=496, y=1402, z=14, stackpos=1}
lever4 = getThingfromPos(leverpos4)
leverpos5 = {x=494, y=1383, z=11, stackpos=1}
lever5 = getThingfromPos(leverpos5)
leverpos6 = {x=453, y=1371, z=11, stackpos=1}
lever6 = getThingfromPos(leverpos6)
leverpos7 = {x=494, y=1408, z=12, stackpos=1}
lever7 = getThingfromPos(leverpos7)

if item.itemid == 1946 and wall.itemid == 0 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and lever6.itemid == 1946 and lever7.itemid == 1946 then
doCreateItem(1304,1,wallpos)
    doTransformItem(item.uid,1945)
elseif item.itemid == 1945 and wall.itemid == 1304 and lever1.itemid == 1946 and lever2.itemid == 1946 and lever3.itemid == 1946 and lever4.itemid == 1946 and lever5.itemid == 1946 and lever6.itemid == 1946 and lever7.itemid == 1946 then
doRemoveItem(wall.uid,1)
    doTransformItem(item.uid,1946)
else 
doPlayerSendCancel(cid,"Sorry, not possible.") 
	end
   return 1
end
