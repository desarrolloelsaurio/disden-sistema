********************************************************************************
*-- Programa: LsruP1.PRG
*-- Fecha   : 11-20-91 02:38am
*-- Version : g. reiner
*-- Notas   : LISTADO DE SUB-RUBROS POR PANTALLA
*-- Modificaci¢n GOYO 07-29-92 01:14am
*-- Modificaci¢n GOYO 12-10-92 11:28am (LSRUP1)
********************************************************************************
SELE seg
stor HORA_ULP(PROGRAM()) TO ulpr
IF CHEQSEG()
	SELE RUB
	set order to tag todos
	=win0()
	pag=1
	=cabpan()
	stor nul TO casos
	acla='|POSIC|  CODIGO |'+PADC("SUB-RUBRO",23)+'|FECHA IN|  USUARIO |'
	m.linea=REPL("=",LEN(acla))
	=TIT_LIN(1)
	SCAN for &fisc
		IF ROW()>21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=cabpan()
			=TIT_LIN(2)
		ENDIF
		=LSRUP1()
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
