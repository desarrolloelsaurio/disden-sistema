********************************************************************************
*-- Programa: LPREPROI.PRG
*-- Fecha   : 11-20-92 12:03pm
*-- Version : G. REINER
*-- Notas   : LISTA DE PRECIOS POR PROVEEDOR CHORIZO
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR 1 TO CASOS,PAG,RUB1,SRUB1
	STOR "" TO ACLA,m.LINEA,TT,HAY
	=LCOSP0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LIN(3)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
		ENDI
		=LPREP1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
