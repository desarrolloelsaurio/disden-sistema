*:*********************************************************************
*-- Programa: OPKAR.PRG
*-- Fecha   : 06/18/91
*-- Version : V.LEEGSTRA
*-- Notas   : ABRE ARCHIVO KARDEX de produccion (para telas y avios)
*:*********************************************************************
@ 24,0 SAY PADC('Abriendo archivo de Kardex',80) COLO SCHE 19
SELE 18
USE (pathpro+'\KARDEX') order tag articulo ALIAS kar
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: OPKAR1.PRG
