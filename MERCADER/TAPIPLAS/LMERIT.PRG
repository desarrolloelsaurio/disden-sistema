****************************************************************************
*-- Programa: LMERIT.PRG
*-- Fecha   : 11-04-92 02:37am
*-- Version : G. REINER
*-- Notas   : LISTADO DE MERCADERIAS
********************************************************************************
STORE HORA_ULP(program()) TO ULPR
IF CHEQSEG()
	STOR 1 TO CASOS,PAG,RUB1,SRUB1
	STOR "" TO ACLA,m.LINEA,TT
	=LMERP0()
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=cabpri1()
	=TIT_(3)
	=LI_P2()
	=_LIN(.T.)
	SCAN
		IF _PLINENO>63
			=FIN_LIN(3,NUL)
			=LI_CHRUB()
			=LI_NPAGE()
		ELSE
			IF LI_CHRUB()
				=FIN_LIN(3,NUL)
				=LI_NPAGE()
			ENDIF
		ENDIF
		=LMERP1()
	ENDSCAN
	=FIN_LIN(4,CASOS)
	EJECT PAGE
	ENDP
	=FINIMP()
	=iaud(FISC)
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
FUNCTION LI_P2
	_WRAP=.F.
	?
	? "RUBRO   :"
	?? RUB1
	? "SUBRUBRO:"
	?? SRUB1
	_WRAP=.T.
RETURN .T.
FUNCTION LI_CHRUB
	SALIDA=.T.
	IF LEFT(RUB.PALISTAR,20)#RUB1
		stor LEFT(RUB.PALISTAR,20) TO RUB1
		STOR RUB.RUBRO TO SRUB1
	ELSE
		IF RUB.RUBRO#SRUB1
			STOR RUB.RUBRO TO SRUB1
		ELSE
			SALIDA=.F.
		ENDIF
	ENDIF
RETURN SALIDA
FUNCTION LI_NPAGE
	=cabpri1()
	=TIT_(3)
	=LI_P2()
	=_LIN(.T.)
RETURN .T.
