* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : FLOK.PRG             บ
* บ COMENTARIO    : BLOQUEA BASE         บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 12-09-93                บ
* บ HORA       : 12:05:06pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
FUNCTION FLOK
PARAMETER LOK_ALIAS
LOK_ALIAS=IIF(TYPE("LOK_ALIAS")="L",ALIAS(),LOK_ALIAS)
DO WHIL .T.
   IF FLOCK(LOK_ALIAS)
      EXIT
   ELSE
      WAIT 'Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ' WIND NOWA
      =BEEP(1)
   ENDIF
   WAIT CLEA
ENDDO
RETURN .T.
