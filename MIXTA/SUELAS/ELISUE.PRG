********************************************************************************
*-- Programa: ELISUE.PRG
*-- Fecha   : 05-16-92 10:35am
*-- Version : G. REINER
*-- Notas   : ELIGE LA SUELA
*-- Modificaci¢n GOYO 05-17-92 00:49am
********************************************************************************
#DEFINE NUL    0                                 && NUL
FUNCTION eliSUE
PARA msg,r1,c1
SELE mix
STORE NUL TO RESPUESTA
IF SUEpop
	SET ORDER TO TAG SUETEX
    =men_lin(zuelas+' '+msg)
    ACTI POPUP MIXpop
    STOR !empty(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1(UPPER(ZUELA)+' '+MSG,'MIX','SUECOD')
endif	 
RETURN respuesta
