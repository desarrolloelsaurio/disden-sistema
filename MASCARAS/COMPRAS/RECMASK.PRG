*:*********************************************************************
*-- Name....: RECMASK.PRG
*-- Notes...: MASCARA REMITO DE COMPRA
*:**********************************************************************
FUNCTION RECMASK
	PARAMETER XSA
	=CABPAN1()
	@ 1,3  SAY "Proveedor :"
	@ 1,45 SAY "N§ REMITO :"
	@ 2,45 SAY "Empresa   :"
	@ 2,3 SAY "Fecha Rec.:"
	@ 1,45 SAY DTOC(DATE())
	IF XSA
	@ 3,45 SAY "N§ PEDIDO :"
	ENDIF
	KSA=CUADRO("4 4 23 0 1 20 30 10 14")
	@ 5,1 SAY PADC("ARTICULO",20)
	@ 5,22 SAY PADC("DESCRIPCION",30)
	@ 5,53 SAY PADC("CANTIDAD",10)
	@ 5,64 SAY PADC("MONTO",14)
RETURN KSA
