********************************************************************************
*-- Programa: ECIU.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA CIUDAD
*-- Modificaci¢n GOYO 05-17-92 00:49am (cambio por elimix1)
*--
********************************************************************************
FUNCTION eciu
PARA msg,r1,c1
priv msg,r1,c1
SELE mix
store NUL to respuesta
IF ciupop
   SET ORDER TO TAG CIUTEX
   ACTI POPUP mixPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   respuesta=ELIMIXN1('Ciudad '+msg,'mix','ciucod',4)
ENDIF
RETURN IIF(respuesta,MIX.NU1,0)
