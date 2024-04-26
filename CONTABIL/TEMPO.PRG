* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : TEMPO.PRG                                                บ
* บ COMENTARIO    :                                                          บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 10-16-93                                                    บ
* บ HORA       : 08:07:07pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION TEMPO
	PARAMETER ANTERIOR,IMPRESORA
	IF !EMPTY(NIVEL)
		IF MILES#INT(CODIGO/10^7)
			MILES=INT(CODIGO/10^7)
			? REPL("-",129)
			? PAIP
			?? PADR("!TOTAL "+MILTEX,47)
			MILTEX=NOMBRE
			=SAYPTR(1,.T.)
			C=C+2
			DO EJEPAG WITH 4,.T.
		ENDIF
		STORE 0 TO MISPAR,PAR
		MISPAR=SUMPER()
		IF !EMPTY(MISPAR)
			STORE IIF(IMPUTABLE="I",5,NIVEL) TO INDICA
			STORE MISPAR TO PAR[INDICA]
			? PAIPD
			?? STR(CODIGO,8)
			?? PAIP2
			SPC1=INDICA-1
			SPC2=5-INDICA
			?? SPACE(SPC1)
			?? NOMBRE
			?? SPACE(SPC2)
			=SAYPTR(2,.T.)
			store C+1 to C
			DO EJEPAG WITH 4,.F.
		ENDIF
	ENDIF
