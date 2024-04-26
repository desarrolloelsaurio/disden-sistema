********************************************************************************
*-- Programa: LESTP2.PRG
*-- Fecha   : 06/20/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE TODOS LOS ARTICULOS PARA UN PROCESO, POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	sele mer
	set order to 1
	SELE est
	=WIN0()
	PAG=1
	=CABPAN()
	STORE nul TO casos
	acla=PADC("ARTICULO",15)+'| DESCRIPCION DEL ARTICULO | TIEMPO | TIEMPO |  FECHA |USUARIO|'
	acla1=SPACE(15)+PAIP+SPACE(26)+'|ESTIMADO|  REAL  |INGRESO |       |'
	lns=REPL("=",LEN(acla))
	_WRAP=.T.
	_ALIGNMENT='CENTER'
	? tt
	_WRAP=.F.
	? lns
	? acla
	? acla1
	? lns
	SCAN FOR &fisc
		IF ROW()=21
			IF !fin_lns(2,nul)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			_WRAP=.T.
			? tt
			_WRAP=.F.
			? lns
			? acla
			? acla1
			? lns
		ENDIF
		=LEST2()
	ENDSCAN
	=fin_lns(2,casos)
	=RELEwIN("win")
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
RETURN MEN_LIN(BOTOM)
