************************************************
*-- Programa: ELIMAR.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : ELIGE LA MARCA (DE LOS PRODUCTOS)
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
************************************************
FUNCTION ELIMAR
PARA MSG,R1,C1
SELE MI1
IF MARPOP
   SET ORDER TO TAG MARTEX
   ACTI POPUP MI1POP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('MARCA '+MSG,'MI1','MARCOD')
ENDIF
RETURN RESPUESTA
