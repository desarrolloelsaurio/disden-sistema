********************************************************************************
*-- Programa: ELICIU.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : R. 'EL BATA'
*-- Notas   : ELIGE LA CIUDAD
*-- Modificaci¢n GOYO 05-17-92 00:49am (cambio por elimix1)
********************************************************************************
#DEFINE NUL    0                                 && NUL

FUNCTION eliciu
PARA msg,r1,c1
priv msg,r1,c1
defi wind a from 10,10 to 20,20
acti wind a 
S= SEEKTECX(30,"MIX", "MIX.TEXTO1", "SUBS(MIX.TEXTO2,7,6)", "CIUTEX",ALIAS(),ORDER(),2,22,.T.)
RELE WIND a
return s

SELE mix
store NUL to respuesta
IF ciupop
   SET ORDER TO TAG CIUTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   respuesta=ELIMIX1('Ciudad '+msg,'mix','ciucod',6,.T.)
ENDIF
RETURN respuesta
