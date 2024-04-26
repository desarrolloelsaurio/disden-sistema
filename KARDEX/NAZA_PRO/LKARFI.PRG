* ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LKARFI.PRG                                               บ
* บ COMENTARIO    : STOCK A FECHA POR IMPRESORA                              บ
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
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE KAR
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL,PARSE("|SUBTOTAL",STR(M.ELTOT,XACDIGI,2)+PAIP,LEN(ACLA)))
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LKARFP1()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS,PARSE("|SUBTOTAL",STR(M.ELTOT,XACDIGI,2)+PAIP,LEN(ACLA)))
	ENDP
	=FINIMP()
	=IAUD(DTOC(M.FECINI))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
