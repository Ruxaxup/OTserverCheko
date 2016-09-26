
function onStepIn(cid, item, frompos, item2, topos) 
	ladder = {x=947, y=1320, z=11, stackpos=1} -- Where the ladder should appear
	getladder = getThingfromPos(ladder)
 
if item.uid == 10225 then  -- Unique ID of the SQM the ghoul/player has to stand on for the ladder to appear
 
	doCreateItem(1386,1,ladder) -- Ladder ID, count, pos
 
end 
end
 
function onStepOut(cid, item, position, fromPosition)  -- To remove the ladder on stepout
	ladder = {x=947, y=1320, z=11, stackpos=1} -- Same as above, important!
	getladder = getThingfromPos(ladder)
 
	if item.uid == 10225 then  -- Unique ID of the SQM the ghoul/player has to stand on for the ladder to appear
 
	doRemoveItem(getladder.uid,1)
 
	end
	end