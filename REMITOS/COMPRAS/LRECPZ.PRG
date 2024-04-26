********************************************************************************
*-- Programa: LRECPZ.PRG
*-- Fecha   : 08-27-92 05:53pm
*-- Version : GOYO REINER
*-- Notas   : LISTADO DE REMITOS DE COMPRA POR PANTALLA
*-- VERSION NOVOGAR
********************************************************************************
ulpr=hora_ulp(program())
IF cheqseg()
	dime ttl[CANT_MAX]
	hay=.f.
	STORE PAIP TO TTU,ACLA,ELPRO
	=lRECpz0()
	TT=TTU+CHR(13)+CHR(10)+ALLTRIM(PRO.PROVEEDOR)
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	=TIT_LIN(1)
	SCAN
		IF ROW()>21 .OR. PRO.PROCOD#ELPRO
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			IF PRO.PROCOD#ELPRO
				ELPRO=PRO.PROCOD
				TT=TTU+CHR(13)+CHR(10)+ALLTRIM(PRO.PROVEEDOR)
				=TIT_LIN(1)
			ELSE
				=TIT_LIN(2)
			ENDIF
		ENDIF
		=LRECPZ1()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
	=REOPREC()
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
