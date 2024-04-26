********************************************************************************
*-- Programa: LproP3.PRG
*-- Fecha   : 06/27/91
*-- Version : V.LEEGSTRA
*-- Notas   : LISTADO DE proENTES, codigo,Proveedor,caracter.,tel‚fono,POR PANTALLA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE pro
	SET ORDER TO TAG IIF(TYPE("ordPRO")#'L' .OR. ordPRO,'PROCOD','PROVEEDOR')
	=WIN0()
	PAG=1
	=CABPAN()
	STORE NUL TO casos
	acla='| PROVEEDOR|'+PADC("PROVEEDOR",30)+PAIP+PADC("TELEFONO",15)+PAIP+PADC("FAX",15)+"|"
	linea=REPL("=",LEN(acla))
	tt='Listado de Proveedores-'+ttu
	=TIT_LIN(1)
	SCAN FOR &fisc
		IF ROW()=21
			IF !FIN_LIN(1,NUL)
				EXIT
			ENDIF
			CLEA
			STOR pag+1 TO pag
			=CABPAN()
			=TIT_LIN(2)
		ENDIF
		?  PAIP
		??procod
		?? PAIP
		??proveedor
		?? PAIP
		?? telefono
		?? PAIP
		?? fax
		?? PAIP
		STORE casos+1 TO casos
	ENDSCAN
	=FIN_LIN(2,CASOS)
	=RELEWIN("win")
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
=MEN_LIN(BOTOM)
RETURN
