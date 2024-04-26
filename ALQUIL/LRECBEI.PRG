* ษออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LRECBEI.PRG            บ
* บ COMENTARIO    :                        บ
* ฬออออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER               บ
* บ FECHA      : 11-01-93                  บ
* บ HORA       : 01:50:15pm                บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER   บ
* ศออออออออออออออออออออออออออออออออออออออออผ
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
	SELE TMP
	STORE NUL TO T1,T2,T3
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
				PADR("|SUBTOTAL",82)+;
				STR(T1,XACDIGI,2)+;
				PAIP+;
				STR(T2,XACDIGI,2)+;
				PAIP+;
				STR(T3,XACDIGI,2)+;
				PAIP))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LRECBE0()
			ENDSCAN
	=FIN_LIN(FOUR,CASOS,;
	PADR("|TOTAL",82)+;
				STR(T1,XACDIGI,2)+;
				PAIP+;
				STR(T2,XACDIGI,2)+;
				PAIP+;
				STR(T3,XACDIGI,2)+;
				PAIP))
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
