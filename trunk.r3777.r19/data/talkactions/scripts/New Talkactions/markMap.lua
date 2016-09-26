function onSay(cid, words, param, channel)
	doPlayerAddMapMark(cid,{x=1055,y=1087,z=7},MAPMARK_SWORD,"Offline Training Statues")
    doPlayerAddMapMark(cid,{x=1016,y=1022,z=7},MAPMARK_STAR,"Potions and Runes shop")
    doPlayerAddMapMark(cid,{x=1030,y=1012,z=7},MAPMARK_BAG,"Rashid")
    doPlayerAddMapMark(cid,{x=1070,y=1010,z=7},MAPMARK_BAG,"Training monks")
    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Map marked")
	return true
end