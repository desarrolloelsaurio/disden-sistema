* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : CONDISCO.PRG                                             บ
* บ COMENTARIO    : PIDE CONFIRMACION DE LA OPERACION Y PIDE PONER DISCO     บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 09-05-93                                                    บ
* บ HORA       : 10:47:05pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION CONDISCO
	PARAMETER CON_CONF,CON_CARTEL
	STORE .F. TO CON_SALIDA
	IF CONFIRMA(CON_CONF,.T.,10,0)
		IF CARTEL(CON_CARTEL,;
			"CIERRE LA PUERTA DE LA DISKETTERA",;
			"[ESC] PARA ANULAR LA OPERACION",;
			"[TECLA] PARA CONFIRMAR")#27
			STORE .T. TO CON_SALIDA
		ENDIF
	ENDIF
RETURN CON_SALIDA
