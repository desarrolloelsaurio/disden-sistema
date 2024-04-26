********************************************************************************
*-- Programa: LPOLP.PRG
*-- Fecha   : 11-09-92 04:05pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE POLIGONALES POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	STORE "" TO TT,m.LINEA,ACLA,PICU,LIM1,PORC
	=LPOLP0()
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LIN(1)
	SCAN WHILE !EOF()
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=lpolp1()
	ENDSCAN
	=lpolp1()
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
=IAUD("")
ELSE
	=iaudI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
