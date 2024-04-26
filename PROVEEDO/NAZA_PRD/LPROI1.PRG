********************************************************************************
*-- Programa: LPROI1.PRG
*-- Fecha   : 06/10/91 12:57pm
*-- Version : E. BANALOTTI
*-- Notas   : IMPRESION DE PROVEEDORES POR IMPRESORA
********************************************************************************
STORE HORA_ULP(PROGRAM()) TO ULPR
IF CHEQSEG()
	SELE pro
	SET ORDER TO TAG IIF(TYPE("ordPRO")#'L' .OR. ordPRO,'PROCOD','PROVEEDOR')
	STORE PAIP+PADC("CODIGO",10)+PAIP+PADC('RAZON SOCIAL',30)+PAIP+PADC('ENC VENTAS',10)+PAIP+PADC('DOMICILIO',30)+PAIP+PADC('LOCALIDAD',20)+PAIP+PADC('TELEFONO',15)+PAIP+padc("FAX",15)+PAIP+PADC('1RA OP',8)+"|FECHA IN|  USUARIO |" TO acla
	STORE REPL("=",LEN(acla)) TO lns
	STORE LEN(acla) TO largo
	STORE MIN(xacancho,xachoja) TO largoim
	STORE 0 TO casos
	=CABPRI()
	_PCOPIES=1
	PRINTJOB
	=CABPRI1()
	=TIT_LNS(2)
	SCAN for &fisc
		IF _PLINENO>mxrn
			=FIN_LNS(3)
			=CABPRI1()
			=TIT_LNS(4)
		ENDI
		? PAIP
		?? procod
		?? PAIP
		?? proveedor
		?? PAIP
		?? encventas
		?? PAIP
		?? domicilio
		?? PAIP
		?? localidad
		?? PAIP
		?? telefono
		?? PAIP
		?? fax
		?? PAIP
		?? finop
		=IMPUSE()
	ENDSCAN
	=FIN_LNS(4,CASOS)
	ENDP
	=finimp()
	=IAUD(FISC)
ELSE
	=IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
