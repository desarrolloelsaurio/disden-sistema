********************************************************************************
*-- Programa: ELIPAI.PRG
*-- Fecha   : 10-27-92 02:19am
*-- Version : G. REINER
*-- Notas   : ELIGE el PAIS
*-- Modif.  : GOYO 05-30-92 07:36pm ELIMIX
********************************************************************************
function eliPAI
para msg,r1,c1
sele mix
if PAIpop
   SET ORDER TO TAG PAITEX
   acti popup mixpop
   stor !empty(respuesta) to respuesta
else
	 RESPUESTA=ELIMIX1('PAIS '+MSG,'MIX','PAICOD',3)
endif
return respuesta
