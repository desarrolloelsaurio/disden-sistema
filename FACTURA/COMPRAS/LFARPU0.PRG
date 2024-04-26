********************************************************************************
*-- Programa: LFARPU0.PRG
*-- Fecha   : 09-29-92 04:03pm
*-- Version : GOYO REINER
*-- Notas   : ORDENAMIENTO LISTADO ULTIMA OPERACION DE FACTURA DE COMPRAS
********************************************************************************
FUNCTION LFARPU0
	=WORKING()
	SELE FAR
	TMP=GENTMP()
	SET ORDER TO TAG PROCOD IN PRO
	SET RELA TO PROCOD INTO PRO
	IF TYPE("ORDPRO")#'L' .OR. ORDPRO
		INDE ON PROCOD+DTOS(FECHAEM) TO (TMP) for empty(tipo) .or. tipo="FA" COMP
	ELSE
		INDE ON PRO.PROVEEDOR+DTOS(FECHAEM) TO (TMP) FOR empty(tipo) .or. tipo="FA" COMP
	ENDIF
	GO TOP
	stor nul TO casos
	ACLA=PAIP+"  CODIGO  "+PAIP+PADC("PROVEEDOR",30)+PAIP+" FECHA  "+PAIP+PADC("FACTURA",14)+PAIP+PADC("MONTO",XACDIGI)+PAIP
	LINEA=REPL("=",LEN(ACLA))
	TT='Ultima Operaci¢n con Proveedores'
	=UNWORK()
RETURN .T.
