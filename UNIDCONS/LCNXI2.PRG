********************************************************************************
*-- Programa: LCNXI2.PRG
*-- Fecha   : 01-22-92 05:21pm
*-- Version : R. 'EL BATA'
*-- Notas   : LISTADO DE ZONAS DE UNA unidad POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO CASOS,ACLA,LIN,TT,FISC,TTL
	=LCNXP20()
	=MEN_LIN(IMPRIMIENDO)
	=CABPRI()
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,0)
			=CABPRI1()
			=TIT_LIN(4)
		ENDI
		=LCNXP21()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	ENDP
	=FINIMP()
	=IAUD(FISC)
	=REOPCNX()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
