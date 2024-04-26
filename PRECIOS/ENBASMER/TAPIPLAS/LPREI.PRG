********************************************************************************
*-- Programa: LISTA DE PRECIOS (POR RUBRO Y SUBRUBRO)
*-- Fecha   : 11-20-92 12:03pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE PRECIOS POR IMPRESORA
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR 1 TO CASOS,PAG,RUB1,SRUB1
	STOR "" TO ACLA,m.LINEA,TT,HAY
	=LCOSP0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_(3)
	=LP_P2()
	=_LIN(.T.)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=LI_CHRUB(.T.)
			=LI_NPAGE()
		ELSE
			IF LI_CHRUB(.T.)
				=LI_NPAGE()
			ENDIF
		ENDI
		=LPREP1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
