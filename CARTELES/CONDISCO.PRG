* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : CONDISCO.PRG                                             �
* � COMENTARIO    : PIDE CONFIRMACION DE LA OPERACION Y PIDE PONER DISCO     �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 09-05-93                                                    �
* � HORA       : 10:47:05pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
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
