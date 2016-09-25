function onAdvance(cid, skill, oldlevel, newlevel)
skillnames={'Fist','Club','Sword','Axe','Distance','Shield','Fishing','Magic','Level'}

	 doSendAnimatedText(getCreaturePosition(cid), '' ..skillnames[skill+1].. ' Up!', math.random(1,254))
doSendMagicEffect(getCreaturePosition(cid),29)
end
