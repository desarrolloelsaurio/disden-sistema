********************************************************************************
*-- Programa: ELILIN.PRG
*-- Fecha   : 05-16-92 10:35am
*-- Version : G. REINER
*-- Notas   : ELIGE LA LINEA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
FUNCTION ELILIN
PARA MSG,R1,C1
SELE MIX
IF LINPOP
   SET ORDER TO TAG LINTEX
   =men_lin('Linea '+msg)
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('L¡nea '+msg,'mix','lincod')
ENDIF
RETURN RESPUESTA
