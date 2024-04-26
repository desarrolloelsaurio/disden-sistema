* ษออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LREMIZ.PRG                   บ
* บ COMENTARIO    : LISTADO DE REMITOS IMPRESORA บ
* ฬออออออออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER                     บ
* บ FECHA      : 11-01-93                        บ
* บ HORA       : 01:50:15pm                      บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER         บ
* ศออออออออออออออออออออออออออออออออออออออออออออออผ
* VERSION CONTROL DE STOCK NOVOGAR
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
	SELE REM
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LREMZ1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
