* ษออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LCORSEMI.PRG         บ
* บ COMENTARIO    :                      บ
* ฬออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER             บ
* บ FECHA      : 11-01-93                บ
* บ HORA       : 01:50:15pm              บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER บ
* ศออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR NUL TO CASOS,TOTAL
	LINEA=REPL("=",LEN(ACLA))
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE TMP
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,;
				PAIP+PADC("SUBTOTAL",10)+;
				PAIP+;
				SPACE(8)+;
				PAIP+;
				SPACE(8)+;
				PAIP+;
				SPACE(10)+;
				PAIP+;
				STR(M.TOTAL,XACDIGI)+;
				PAIP+;
				SPACE(30)+;
				PAIP)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		? LCORSEM0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,;
		PAIP+PADC("TOTAL",10)+;
		PAIP+;
		SPACE(8)+;
		PAIP+;
		SPACE(8)+;
		PAIP+;
		SPACE(10)+;
		PAIP+;
		STR(M.TOTAL,XACDIGI)+;
		PAIP+;
		SPACE(30)+;
		PAIP)
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
