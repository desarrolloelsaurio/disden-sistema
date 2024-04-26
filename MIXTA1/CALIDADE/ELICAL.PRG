********************************************************************************
*-- Programa: ELICAL.PRG
*-- Fecha   : 12/07/91
*-- Version : G. REINER
*-- Notas   : ELIGE LA CALIDAD
*-- Modif.  : GOYO 05-30-92 07:58pm ELIMIX
********************************************************************************
FUNCTION elical
PARA msg,r1,c1
SELE mix
IF calpop
   SET ORDER TO TAG CALTEX
   ACTI POPUP MIXPOP
   STOR IIF(!EMPTY(respuesta),RECNO(),NUL) TO respuesta
ELSE
    RESPUESTA=ELIMIX1('CALIDAD '+MSG,'MIX','CALCOD')
ENDIF
RETURN respuesta 
