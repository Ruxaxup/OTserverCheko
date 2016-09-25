local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false

function onThingMove(creature, thing, oldpos, oldstackpos)

end


function onCreatureAppear(creature)

end


function onCreatureDisappear(cid, pos)
  	if focus == cid then
          selfSay('Good bye then.')
          focus = 0
          talk_start = 0
  	end
end


function onCreatureTurn(creature)

end


function msgcontains(txt, str)
  	return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end


function onCreatureSay(cid, type, msg)
  	msg = string.lower(msg)

	if (msgcontains(msg, 'hi') and (focus == 0)) and getDistanceToCreature(cid) < 4 then
  		selfSay('Hiho ' .. getCreatureName(cid) .. ' I can release the yalahar Addon 2, say help for more "info".')
  		focus = cid
  		talk_start = os.clock()

  	elseif msgcontains(msg, 'hi') and (focus ~= cid) and getDistanceToCreature(cid) < 4 then
  		selfSay('Sorry, ' .. getCreatureName(cid) .. '! I talk to you in a minute.')

	elseif focus == cid then
		talk_start = os.clock()

	if msgcontains(msg, 'help') then
			selfSay(I can release the yalahar Addon 2, if you are interested say: yalahar outfit 2')


	elseif msgcontains(msg, 'yalahar outfit 2') then
                 if getPlayerStorageValue(cid,9997) >= 2 then
					selfSay('You already have this addon.')

                 else if getPlayerStorageValue(cid,9997) == 1 then
                    selfSay('You will need 100 Ferns to realese this addon, you have it?')
					addon_state = 2
		 else
		            setPlayerStorageValue(cid,9997,1)
                    selfSay('You will need 100 Ferns to realese this addon, you have it?')
        end
	end
	elseif msgcontains(msg, 'yes') and addon_state == 2 then
                 if doPlayerRemoveItem(cid,2801,100) == 0 then
		  			selfSay('Sorry, you not have them.')
                 else  
			selfSay('Thanks, addon is your now.')
			if getPlayerSex(cid) == 0 then
		    doPlayerAddOutfit(cid, 324, 2)
		    setPlayerStorageValue(cid,9997,2)
			else
			doPlayerAddOutfit(cid, 325, 2)
			setPlayerStorageValue(cid,9997,2)
		    talk_state = 1
			end
        end	
  	

        elseif msgcontains(msg, 'bye') and getDistanceToCreature(cid) < 4 then
            selfSay('Adeus ' .. creatureGetName(cid) .. ', Come back soon.')
            focus = 0
            talk_start = 0

        elseif msg ~= "" then
            selfSay('How? I do not understand!')
            talk_state = 0
        end
    end
end

function onCreatureChangeOutfit(creature)
end

function onThink()
    doNpcSetCreatureFocus(focus)
    if (os.clock() - talk_start) > 30 then
        if focus > 0 then
            selfSay('Next!!...')
        end
        focus = 0
        talk_start = 0
    end
    if focus ~= 0 then
        if getDistanceToCreature(focus) > 5 then
            selfSay('Good Bye')
            focus = 0
            talk_start = 0
        end
    end
end

