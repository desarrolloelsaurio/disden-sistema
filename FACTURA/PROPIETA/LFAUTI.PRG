* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LFAUTI.PRG                                               บ
* บ COMENTARIO    : LISTADO DE FACTURAS DE PROPIETARIOS                      บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                                                 บ
* บ FECHA      : 11-01-93                                                    บ
* บ HORA       : 01:50:15pm                                                  บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER                                     บ
* ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE CCP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
			PARSE("|SUBTOTAL",STR(M.TOTAUT,XACDIGI,2)+"|",LEN(ACLA)))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LFAUTP0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,;
	PARSE("|TOTAL",STR(M.TOTAUT,XACDIGI,2)+"|",LEN(ACLA)))
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN
