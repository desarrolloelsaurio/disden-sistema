* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ELITIP.PRG                                               �
* � COMENTARIO    : SELECCIONA TIPO DE UNIDAD                                �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 11-18-93                                                    �
* � HORA       : 09:02:41pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION ELITIP
PARA MSG,R1,C1
SELE MIX
IF TIPPOP
   SET ORDER TO TAG TIPTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
	 RESPUESTA=ELIMIX1('Tipo de Unidad '+MSG,'MIX','TIPCOD')
ENDIF
RETURN RESPUESTA
