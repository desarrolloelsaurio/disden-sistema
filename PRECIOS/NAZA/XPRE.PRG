********************************************************************************
*-- Programa: Xpre.PRG
*-- Fecha   : 09/06/91 03:32pm
*-- Version : g. reiner
*-- Notas   : RESTAURA BASE DE precios
********************************************************************************
ulpr=PROGRAM()
=HORA_ULP()
STORE "" TO tx
SELE pre
DO CASE
CASE BAR()=1
@ 24,nul SAY PADC('Reindexando el Archivo de Precios',80,'*') COLO SCHE 19
DO flok WITH "pre"
REINDEX
UNLO IN pre
tx='REINDEX '
CASE BAR()=2
@ 24,nul SAY PADC('Generando Nuevo Indice de Precios',80,'*') COLO SCHE 19
DO flok WITH "pre"
INDE ON articulo TO (PATH+"\PRECIOS")
UNLO IN pre
tx='CREA INDICE '
ENDCASE
IF tx#''
=iaud(tx+' Precios')
ENDIF
RETURN
*: EOF: XPRE.PRG
