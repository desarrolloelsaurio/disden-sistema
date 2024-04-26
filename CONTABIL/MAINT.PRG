* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : MAINT.PRG                                                บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
FUNCTION MAINT
	PARAMETER M_ANCHO,M_STR,M_CLEA,M_ACUM
	IF M_CLEA
		CLEA
		@ 0,0 SAY PADC(TIT,M_ANCHO)
	ELSE
		? PADC(TIT,M_ANCHO)
	ENDIF
	if !EMPTY(KREPORTE)
		? PADC("Reporte: "+KREPORTE,M_ANCHO)
		C=C+1
    ELSE
       =TITLIM(M_ANCHO)
	endif
	IF M_ACUM
		=ARRASTIT(M_ANCHO)
	ENDIF
	? TITSHIT("FECHA: "+TRAN(DATE(),PICFEC),"Pag.: "+str(NPAG,M_STR),M_ANCHO)
	M_AN1=LEN(ACLA)
	? REPL("-",M_AN1)
	? ACLA
	? REPL("-",M_AN1)
RETURN .T.
