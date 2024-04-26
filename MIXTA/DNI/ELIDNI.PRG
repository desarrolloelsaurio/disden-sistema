***************************************
*-- Programa: ELIDNI.PRG
*-- Fecha   : 06/12/91 03:13pm
*-- Version : GOYO REINER
*-- Notas   : ELIGE TIPO DE DOCUMENTO
*-- Modificaci¢n GOYO 05-17-92 00:49am
***************************************
FUNCTION eliDNI
PARA msg,r1,c1
SELE mix
IF DNIPOP
   IF !EMPTY(MSG)
      WAIT "Tipo de Documento "+MSG WIND NOWA
   ENDIF
   SET ORDER TO TAG DNITEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(respuesta) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Tipo Documento'+msg,'MIX','DNICOD')
ENDIF
RETURN respuesta
