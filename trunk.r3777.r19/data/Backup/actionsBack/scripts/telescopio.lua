function onUse(cid, item, frompos, item2, topos)
sorte = math.random(1,7)
pos = getPlayerPosition(cid)

if item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 1 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"As nuvens est�o incubrindo o C�u")
	
elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 2 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"Uma chuva de meteoros.")  

elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 3 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"Voc� viu o Cruzeiro do sul.")
  

elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 4 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"As forma��o das estrelas favorece o ganho de muitos gps")


elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 5 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"O encontro de V�nus com marte mostram que voc� ir� bem nos neg�cios.")


elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 6 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"J�pter est� bem perto!!")
  

elseif item.itemid == 2581 or item.itemid == 2582 or item.itemid == 2583 or item.itemid == 2584 and sorte == 7 then
	doSendMagicEffect(pos,14)
	doPlayerSendTextMessage(cid,22,"A lua est� toda furada parecendo queijo su��o.")
	
end 
return 1
end