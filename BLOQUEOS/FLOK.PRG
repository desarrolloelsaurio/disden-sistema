* 浜様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : FLOK.PRG             �
* � COMENTARIO    : BLOQUEA BASE         �
* 麺様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER             �
* � FECHA      : 12-09-93                �
* � HORA       : 12:05:06pm              �
* � COPYRIGHT  : 1993 by GREGORIO REINER �
* 藩様様様様様様様様様様様様様様様様様様夕
FUNCTION FLOK
PARAMETER LOK_ALIAS
LOK_ALIAS=IIF(TYPE("LOK_ALIAS")="L",ALIAS(),LOK_ALIAS)
DO WHIL .T.
   IF FLOCK(LOK_ALIAS)
      EXIT
   ELSE
      WAIT 'Espere por Favor - El archivo est� siendo Utilizado por otro Usuario ' WIND NOWA
      =BEEP(1)
   ENDIF
   WAIT CLEA
ENDDO
RETURN .T.
