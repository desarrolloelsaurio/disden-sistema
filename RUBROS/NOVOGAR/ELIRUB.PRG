************************************************
*-- Programa: ELIRUB.PRG
*-- Fecha   : 06/06/91
*-- Version : g. reiner
*-- Notas   : ELIGE EL RUBRO
*-- Modificacion para adaptar a indice compacto
*-- Modificaci¢n GOYO 07-28-92 06:52pm
************************************************
function elirub
para msg,r1,c1
priv msg,r1,c1,ventant
sele rub
store nul to respuesta
if rubpop
   set order to tag rubro
   acti popup rubpop
   stor !empty(respuesta) to respuesta
else
   ON KEY LABEL F3 return SEEKTECX(20,"RUB","RUB.RUBRO","RUB.RUBCOD","RUBRO",.F.,.F.,1,1,.t.)
   respuesta=ELIMIXN1('Rubro '+msg,'rub','rubcod',3)
   ON KEY LABEL F3
endif
return respuesta
