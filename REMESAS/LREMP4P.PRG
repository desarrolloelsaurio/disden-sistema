********************************************************************************
*-- Programa: LREMP4P
*-- Fecha   : 03-23-92 12:16pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE REMESAS
********************************************************************************
IF CHEQSEG()
   STORE "" TO M.ACLA,M.LINEA,casos,masuno,ELPRO,LAREM
	=LREMP40()
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
		=LREMP41()
	ENDSCAN
	CASOS=CASOS+1
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
	=REOPREM()
ELSE
	=iaudi()
ENDIF
=MEN_LIN(BOTOM)
RETURN
