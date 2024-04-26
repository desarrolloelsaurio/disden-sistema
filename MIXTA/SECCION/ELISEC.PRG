***************************************
*-- Programa: ELISEC.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : GOYO REINER
*-- Notas   : ELIGE TIPO DE SECCION
*-- Modificaci¢n GOYO 
***************************************
FUNCTION eliSEC
PARA msg,r1,c1
SELE mix
IF SECPOP
   IF !EMPTY(MSG)
      WAIT "Tipo de Secci¢n "+MSG WIND NOWA
   ENDIF
   SET ORDER TO TAG SECTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Secci¢n '+msg,'MIX','SECCOD')
ENDIF
RETURN respuesta
