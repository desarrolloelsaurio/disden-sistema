* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ELIETA.PRG           �
* � COMENTARIO    :                      �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 06-02-94                �
* � HORA       : 10:52:26pm              �
* � COPYRIGHT  : 1994 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
FUNCTION eliETA
PARA MSG,R1,C1
SELE MIX
IF ETApop
   SET ORDER TO TAG ETATEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO respuesta
ELSE
   RESPUESTA=ELIMIX1('Etapa de Producci�n '+msg,'MIX','ETACOD')
ENDIF
RETURN RESPUESTA
