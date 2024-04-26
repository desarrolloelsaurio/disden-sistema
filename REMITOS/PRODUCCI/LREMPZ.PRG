********************************************************************************
*-- Programa: LREMPZ.PRG
*-- Fecha   : 03-24-93 04:06pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE REMITOS DE PRODUCCION
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	stor "" TO casos,tt,acla,LINEA
	=LREMPZ0()
	=win0()
	pag=1
	=cabpan()
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
		=lrempZ1()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(fisc)
	=REOPREM()
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
