********************************************************************************
*-- Programa: ELIMAR.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : ELIGE LA MARCA (DE LOS PRODUCTOS)
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
*-- VERSION BALCALA
********************************************************************************
FUNCTION eliMAR
PARA msg,r1,c1
SELE mix
STOR 0 TO M.RESPUESTA
IF MARpop
   set order to tag martex
   ACTI POPUP mixPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Marcas '+MSG,'mix','MARCOD')
ENDIF
RETURN respuesta
