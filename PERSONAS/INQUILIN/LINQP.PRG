********************************************************************************
*-- Programa: LINQP.PRG
*-- Fecha   : 11-23-92 04:14pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO BASE POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO ACLA,LINEA
	=LINQP0()
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LIN(1)
	SCAN
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LINQP1()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
	=reopinq()
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
