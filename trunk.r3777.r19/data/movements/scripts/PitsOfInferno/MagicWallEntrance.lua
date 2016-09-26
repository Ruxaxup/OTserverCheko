function onStepIn(cid, item, pos)
	local position = {x=884, y=1326, z=10}
	local position2 = {x=884, y=1326, z=10}
	
		if (getPlayerItemCount(cid, 1970) < 1) then
			doTeleportThing(cid, position)
			doSendMagicEffect(position,10)
		else

			doTeleportThing(cid, position2)
						doSendMagicEffect(position2,10)
		end
end