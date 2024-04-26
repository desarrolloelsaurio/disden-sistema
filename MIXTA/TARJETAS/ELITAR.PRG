********************************************************************************
*-- Programa: ELItar.PRG
*-- Fecha   : 11/08/91
*-- Version : G. REINER
*-- Notas   : ELIGE LA TARJETA DE CREDITO
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION elitar
PARA msg,r1,c1
antpr=ulpr
ulpr=program()
sele mix
IF tarpop
   set order to tag tartex
   ACTI POPUP mixpop
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   respuesta=elimix1('Tarjeta '+msg,'mix','tarcod')
endif
ulpr=antpr
return respuesta
