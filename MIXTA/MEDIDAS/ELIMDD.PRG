* 浜様様様様様様様様様様様様様様様様様様様様様様�
* � PROCEDIMIENTO : ELIMDD.PRG                  �
* � COMENTARIO    : SELECCIONA UNIDAD DE MEDIDA �
* 麺様様様様様様様様様様様様様様様様様様様様様様�
* � AUTOR      : GOYO REINER                    �
* � FECHA      : 10-26-93                       �
* � HORA       : 12:46:43pm                     �
* � COPYRIGHT  : 1993 by GREGORIO REINER        �
* 藩様様様様様様様様様様様様様様様様様様様様様様�
FUNCTION ELIMDD
PARA MSG,R1,C1
STOR 0 TO M.RESPUESTA
SELE MIX
IF MDDPOP
   SET ORDER TO TAG MDDTEX
   ACTI POPUP MIXPOP
   STOR !EMPTY(RESPUESTA) TO RESPUESTA
ELSE
   RESPUESTA=ELIMIX1('Unidad de Medida '+MSG,'MIX','MDDCOD')
ENDIF
RETURN RESPUESTA 
