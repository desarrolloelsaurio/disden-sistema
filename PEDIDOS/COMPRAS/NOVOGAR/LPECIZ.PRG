*******************************
*-- Programa: LPECIZ
*-- Fecha   : 05-04-94 01:24pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE
*******************************
#DEFINE NUL    0                                 && NUL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE PAIP   "|"                               && PAIP

STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	DIME TTL[CANT_MAX]
	HAY=.F.
	STORE PAIP TO TT,ACLA,LINEA,ELPRO
	=LPECPZ0()
	STOR NUL TO CASOS
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF PRO.PROCOD#ELPRO
			? M.LINEA
			ELPRO=PRO.PROCOD
		ENDIF
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=cabpri1()
			=TIT_LIN(4)
		ENDI
		=LPECPZ1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPPEC()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
