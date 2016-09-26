function onUse(cid, item, fromPosition, itemEx, toPosition)
    removals = { --Stones
      
  { x = 666, y = 1089 , z = 13, stackpos = 1 },
        
  { x = 667 , y = 1089 , z = 13, stackpos = 1 },
      
   { x = 668 , y = 1089 , z = 13, stackpos = 1 },
      
   { x = 669 , y = 1089 , z = 13, stackpos = 1 },
	
   { x = 670 , y = 1089 , z = 13, stackpos = 1 },
    }
    
  

   if item.itemid == 1945 then
        for i = 1, #removals do
            doRemoveItem(getThingfromPos(removals[i]).uid, 1)
        end
		local LeverPos = {x=661, y=1127, z=10}
		doSendMagicEffect(LeverPos, CONST_ME_POFF)
		doTransformItem(item.uid, item.itemid + 1)
	end
  return TRUE
end