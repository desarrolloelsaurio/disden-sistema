* 浜様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様融
* � PROCEDIMIENTO : BALANC52.PRG                                             �
* � COMENTARIO    :                                                          �
* 麺様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様郵
* � AUTOR      : GOYO REINER                                                 �
* � FECHA      : 10-16-93                                                    �
* � HORA       : 09:30:15pm                                                  �
* � COPYRIGHT  : 1993 by GREGORIO REINER                                     �
* 藩様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様様夕
FUNCTION BALANC52
	PARAMETER ESELFIN
	IF IMPRESORA
		B_LAR1=48
		B_LAR2=129
	ELSE
		B_LAR1=23
		B_LAR2=79
	ENDIF
	? REPL("-",B_LAR2)
	? PADR(" TOTAL "+MILTEX,B_LAR1)
	MILTEX=NOMBRE
	=SAYPTR(1,.T.,!IMPRESORA)
	IF ESELFIN
		? REPL("-",B_LAR2)
		? PADR(" SALDOS FINALES",B_LAR1)
		=SAYPTR(3,.T.,!IMPRESORA)
		? REPL("-",B_LAR2)
		?
		IF IMPRESORA
			DO EJEPAG WITH 1000,.F.
			DO FINIMP
		ELSE
			=TECLA(24)
		ENDIF
	ENDIF
RETURN .T.
