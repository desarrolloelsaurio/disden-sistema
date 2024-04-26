*************************************************
*-- Programa: ELISUC.PRG
*-- Fecha   : 03/22/92
*-- Version : V.LEEGSTRA
*-- Notas   : ELIGE EL ESTADO
*--           Modificaci¢n GOYO 10-30-95 00:58am
*************************************************
FUNCTION eliSUC
PARA msg,r1,c1
SELE MIX
STORE NUL TO RESPUESTA
IF SUCPOP
   SET ORDER TO TAG SUCTEX
   ACTI POPUP mixpop
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
 RESPUESTA=ELIMIX1('Sucursal '+MSG,'MIX','SUCCOD')
ENDIF
RETURN RESPUESTA
