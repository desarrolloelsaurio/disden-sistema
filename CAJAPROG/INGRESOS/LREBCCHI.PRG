* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LXXXI.PRG                                                บ
* บ COMENTARIO    :                                                          บ
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
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE CCH
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,PARSE("|SUBTOTAL|",PAIP+STR(TTLTAR,XACDIGI,2)+PAIP+STR(TTLCHE,XACDIGI,2)+PAIP,LEN(ACLA)))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LREBCCH1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,PARSE("|TOTAL|",PAIP+STR(TTLTAR,XACDIGI,2)+PAIP+STR(TTLCHE,XACDIGI,2)+PAIP,LEN(ACLA)))
	ENDP
	=FINIMP()
	=IAUD("")
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
