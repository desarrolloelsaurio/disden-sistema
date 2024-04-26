********************************************************************************
*-- Programa: Xpre.PRG
*-- Fecha   : 09/06/91 03:32pm
*-- Version : g. reiner
*-- Notas   : RESTAURA BASE DE precios
*-- Modificaci¢n GOYO 06-07-92 01:24pm (men_lin / hora_ulp
********************************************************************************
ulpr=hora_ulp(PROGRAM())
stor "" TO tx
SELE pre
DO CASE
CASE BAR()=1
   =men_lin('Reindexando el Archivo de Precios')
   DO flok WITH "pre"
   REINDEX
   UNLO IN pre
   tx='REINDEX '
CASE BAR()=2
   =MEN_LIN('Generando Nuevo Indice de Precios')
   DO flok WITH "pre"
   INDE ON articulo TO (PATH+"\PRECIOS")
   UNLO IN pre
   tx='CREA INDICE '
ENDCASE
IF !EMPTY(tx)
   =iaud(tx+' Precios')
ENDIF
RETURN
