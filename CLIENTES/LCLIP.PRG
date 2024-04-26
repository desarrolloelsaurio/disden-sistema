********************************************************************************
*-- Programa: lCLIp.prg
*-- Fecha   : 05-31-92 04:52am
*-- Version : G. REINER
*-- Notas   : LISTADO DE CLIENTES POR PANTALLA
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
	SELE PER
	SET ORDER TO TAG IIF(TYPE("ORDCLI")#'L' .OR. ORDCLI,"CODCLI","CLIENTE")
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	acla=HAZ_ACLA()
	linea=REPL("=",LEN(acla))
	=TIT_LIN(1)
	SELE PER
	SCAN FOR &FISC
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LCLI0()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudI()
ENDIF
RETURN MEN_LIN(BOTOM)
