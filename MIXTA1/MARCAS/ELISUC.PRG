********************************************************************************
*-- Programa: ELISUC.PRG
*-- Fecha   : 11-21-91 10:41am
*-- Version : G. REINER
*-- Notas   : ELIGE LA SUCURSAL
*-- Modif.  : GOYO 05-30-92 08:50pm ELIMIX
*-- Modif.  : GOYO 06-07-93 01:21pm ELIMAR
********************************************************************************
FUNCTION eliSUC
PARA msg,r1,c1
SELE PER
IF SUCPOP
   set order to tag SUCURSAL
   ACTI POPUP PERPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('SUCURSAL '+MSG,'PER','SUCCOD',4)
ENDIF
RETURN respuesta
