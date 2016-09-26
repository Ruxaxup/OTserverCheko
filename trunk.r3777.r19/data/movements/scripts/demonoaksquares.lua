function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
 
	return doCreatureSay(cid, sounds[1][math.random(1, #sounds[1])], TALKTYPE_MONSTER_YELL, false, cid, (positions.demonOak or getCreaturePosition(cid)))
end