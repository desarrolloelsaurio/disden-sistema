*****************************************
*-- Programa: ELIALI.PRG
*-- Fecha   : 11/08/91
*-- Version : G. REINER
*-- Notas   : ELIGE EL ALIMENTACION
*-- Modificaci¢n GOYO 05-18-92 07:25pm
****************************************
function eliali
para msg,r1,c1
sele mi1
store nul to respuesta
if alipop
   set order to tag alitex
   =men_lin('Alimentaci¢n'+msg)
   acti popup mi1pop
   stor !empty(respuesta) to respuesta
else
   RESPUESTA=ELIMI11('Alimentaci¢n '+msg,'mi1','alicod')
endif
return respuesta
