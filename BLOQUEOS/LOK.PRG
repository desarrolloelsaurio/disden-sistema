* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LOK.PRG              บ
* บ COMENTARIO    : BLOQUEA REGISTRO     บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 12-09-93                บ
* บ HORA       : 11:48:15am              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
* LOK_ALIAS=ALIAS
* LOK_RECNO=REGISTROS
FUNCTION LOK
	PARAMETER LOK_ALIAS,LOK_RECNO
	PRIVATE LOK_ALIAS,LOK_RECNO,LOK_PAR
	LOK_PAR=PARAMETERS()
	LOK_ALIAS=IIF(TYPE("LOK_ALIAS")="L",ALIAS(),LOK_ALIAS)
	IF !USED(LOK_ALIAS)
		=SWAP(@LOK_ALIAS,@LOK_RECNO)
	ENDIF
	LOK_RECNO=IIF(LOK_PAR=2,;
	XXTOCHAR(LOK_RECNO),;
	IIF(TYPE("REGISTRO")="U",;
	STR(RECNO((LOK_ALIAS))),;
	REGISTRO))
	IF !EMPTY(LOK_RECNO)
		DO WHILE .T.
			IF RLOCK(LOK_RECNO,LOK_ALIAS)
				EXIT
			ELSE
				WAIT 'Espere por Favor - El archivo est  siendo Utilizado por otro Usuario ' WIND NOWA
				=BEEP(1)
			ENDIF
			WAIT CLEA
		ENDDO
	ENDIF
RETURN .T.
