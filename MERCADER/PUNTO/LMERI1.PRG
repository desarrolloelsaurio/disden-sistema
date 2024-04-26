* ษอออออออออออออออออออออออออออออออออออออออป
* บ PROCEDIMIENTO : LMERI1.PRG            บ
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

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
=WORKING()
=DOTALK()
	SELE mer
	STOR NUL TO CASOS
	ACLA=HAZ_ACLA()
	STORE REPL("=",LEN(acla)) TO M.LINEA
	=CABPRI()
	_PCOPIES=1
	=UNTALK()
	=UNWORK()
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(FOUR)
		ENDI
		=lmeri11()
	ENDSCAN
	=FIN_LIN(FOUR,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPMER()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
