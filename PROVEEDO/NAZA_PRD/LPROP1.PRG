********************************************************************************
*-- Programa: LproP1.PRG
*-- Fecha   : 06/27/91
*-- Version : G. REINER
*-- Notas   : LISTADO DE PROVEEDORES, codigo,proveedor,encargado,POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE pro
	SET ORDER TO TAG IIF(TYPE("ordPRO")#'L' .OR. ordPRO,'PROCOD','PROVEEDOR')
	=WIN0()
	PAG=1
	=CABPAN()
	STORE 0 TO casos
	acla='| PROVEEDOR|'+PADC("PROVEEDOR",30)+'|ENC VENTAS|'
	lns=REPL("=",LEN(acla))
	tt='Listado de Proveedores-'+ttu
	=tit_lns(1)
	SELE pro
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
		?? proveedor
		?? paip
		?? encventas
		?? paip
		STORE casos+1 TO casos
	ENDSCAN
	=fin_lns(2,casos)
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=iaudi()
ENDIF
=men_lin(botom)
RETURN
