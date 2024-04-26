*********************************************************
*-- Programa: LCNXI1.PRG
*-- Fecha   :
*-- Version : G. REINER
*-- Notas   : LISTA UNIDADES DE CONSORCIOS POR CONSORCIOS
*********************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STORE "" TO casos,ACLA,LINEA,TT,FISC,TTL
	=LCNXP10()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>66
			=FIN_LIN(3,NUL,PARSE("|SUBTOTAL",STR(TTL,6,2)+" ",LEN(ACLA)))
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LCNXP11()
	ENDSCAN
	=FIN_LIN(4,CASOS,PARSE("|TOTAL",STR(TTL,6,2)+" ",LEN(ACLA)))
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPCNX()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
