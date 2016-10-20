function onDeath( cid, corpse, deathlist )
	local nKillers = #deathlist

	if(nKillers >= 1) then
		for i = 1, #deathlist do
			if(getCreatureName(deathlist[i]) == "Devovorga") then
				if(getPlayerStorageValue(target,DEVOVORGA_QUEST) == 6) then
				--Si el fue, lamentablemente Devovorga se pierde
					doRemoveCreature(deathlist[i])
					--createTeleport(60)
				end	
			end
		end
	end
	return true
end