* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LREMCI.PRG            บ
* บ COMENTARIO    :                       บ
* ฬอออออออออออออออออออออออออออออออออออออออน
* บ AUTOR      : GOYO REINER              บ
* บ FECHA      : 11-01-93                 บ
* บ HORA       : 01:50:15pm               บ
* บ COPYRIGHT  : 1993 by GREGORIO REINER  บ
* ศอออออออออออออออออออออออออออออออออออออออผ
#DEFINE FOUR   4                                 && FOUR
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("ฐ",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SELE COR
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=LREMC0()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	ENDP
	=FINIMP()
	=IAUD(DTOC(M.FECINI)+"-"+DTOC(M.FECFIN))
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
