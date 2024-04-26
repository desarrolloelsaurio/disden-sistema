********************************************************************************
*-- Programa: LproP2.PRG
*-- Fecha   : 06/27/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE proENTES, codigo,Proveedor,domi.,local.,codpos.,prov.,POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE pro
	SET ORDER TO TAG IIF(TYPE("ordPRO")#'L' .OR. ordPRO,'PROCOD','PROVEEDOR')
	=WIN0()
	PAG=1
	=CABPAN()
	STORE nul TO casos
	acla='| PROVEEDOR|'+PADC("PROVEEDOR",25)+PAIP+PADC("DOMICILIO",20)+PAIP+PADC("LOCALIDAD",15)+PAIP
	lns=REPL("=",LEN(acla))
	tt='Listado de Proveedores-'+ttu
	=tit_lns(1)
	SCAN FOR &fisc
		IF ROW()=21
			IF !fin_lns(1,nul)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=tit_lns(2)
		ENDIF
		? paip
		?? procod
		?? paip
		?? LEFT(proveedor,25)
		?? paip
		?? LEFT(domicilio,20)
		?? paip
		?? left(LOCALIDAD,15)
		?? PAIP
		STORE casos+1 TO casos
	ENDSCAN
	=fin_lns(2,casos)
	=relewin("win")
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
