function onStepIn(cid, item, pos)
---Action by Jovial---

--Config--
voc = 4    --0 = no vocation, 1 = sorcerer, 2 = druida, 3 = paladin, 4 = knight--
voc2 = 1   --5 = master sorcerer, 6 = elder druid, 7 = royal paladin, 8 = elite knight--
voc3 = 3 
voc5 = 5 
voc7 = 7 
voc8 = 8 

dano = 19999 --quanto ira tirar de vida
danoo = 19999 --quanto ira tirar de vida
cor = 180 --cor da letra do hit 5=azul, 180=red, etc
efeito = 3  --numero do efeito desejado
--End Config--


hp= getCreatureHealth(cid)
mp = getPlayerMana(cid)
topos = getPlayerPosition(cid)
pvoc = getPlayerVocation(cid)
pvoc3 = getPlayerVocation(cid)
pvoc2 = getPlayerVocation(cid)
pvoc5 = getPlayerVocation(cid)
pvoc7 = getPlayerVocation(cid)
pvoc8 = getPlayerVocation(cid)

if voc == pvoc or voc2 == pvoc or voc3 == pvoc or voc5 == pvoc or voc7 == pvoc or voc8 == pvoc then
if getCreatureHealth(cid) >= dano then
doPlayerAddMana(cid, -danoo)
doCreatureAddHealth(cid, -dano)
doSendAnimatedText(topos, dano, cor)
  doSendMagicEffect(topos, efeito)
else
doPlayerAddMana(cid, -mp)
doCreatureAddHealth(cid, -hp)
doSendAnimatedText(topos, hp, cor)
  doSendMagicEffect(topos, efeito)
end
end
return 1
end