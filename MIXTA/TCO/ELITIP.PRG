* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : ELITIP.PRG           �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 10-29-93                �
* � HORA       : 03:55:34pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
* VERSION CAMARA GAMMA
* TIPO DE CONCEPTO
*
FUNCTION ELITIP
PARA MSG,R1,C1
SELE MIX
IF TIPPOP
   SET ORDER TO TAG TIPTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Tipo de Concepto '+MSG,'MIX','TIPCOD',3)
ENDIF
RETURN RESPUESTA
