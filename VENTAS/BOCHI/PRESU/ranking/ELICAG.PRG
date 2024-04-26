*************************************************
*-- Programa: ELICAG.PRG
*-- Fecha   : 10-25-92 05:39pm
*-- Version : G. REINER
*-- Notas   : ELIGE EL CONCEPTO DE AGRUPACION
*-- Modif.  : GOYO 05-30-92 07:36pm ELIMIX
*-- Modif. GOYO 10-25-92 05:40pm (elilin-elicag)
*************************************************
function elicag
para msg,r1,c1
sele mix
if cagpop
   SET ORDER TO TAG cagTEX
   acti popup mixpop
   stor !empty(respuesta) to respuesta
else
   RESPUESTA=ELIMIX1('C. Agrupaci'+IIF(_WINDOWS,"ó",'¢')+'n'+MSG,'MIX','cagCOD')
endif
return respuesta
