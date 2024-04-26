********************************************************************************
*-- Programa: XANOPRE.PRG
*-- Fecha   : 09/11/91 05:13pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA DENOMINACIONES DE PRECIOS
********************************************************************************
ulpr=hora_ulp(PROGRAM())
=movewin(8,12,15,64,'win',' Denominacion de Precios ')
xn='LISTA DE PRECIOS N§ '
XP=REPL("!",20)
xn1='Denominaci¢n p/Lista de Precios N§ '
@ 1,1 say xn+'1 ' colo sche 3
@ 2,1 say xn+'2 ' colo sche 3
@ 3,1 say xn+'3 ' colo sche 3
@ 4,1 say xn+'4 ' colo sche 3
@ 1,28 GET xalis1 PICT XP ;
   MESS xn1+'1'
@ 2,28 GET xalis2 PICT XP ;
   MESS xn1+'2'
@ 3,28 GET xalis3 PICT XP ;
   MESS xn1+'3'
@ 4,28 GET xalis4 PICT XP ;
   MESS xn1+'4'
READ
RETURN RELEWIN("win") .AND. men_lin(botom)
