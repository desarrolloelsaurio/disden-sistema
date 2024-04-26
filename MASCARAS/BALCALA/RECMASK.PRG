*:*********************************************************************
*-- Name....: RECMASK.PRG
*-- Notes...: MASCARA NOTA DE REMITOS
*:**********************************************************************
FUNCTION RECMASK
	PARAMETER XSA
	IF XSA
		CLEA
	ENDIF
	=CABPAN1()
	@ 1,3  SAY "Proveedor :"
	@ 1,40 SAY "N§ REMITO :"
	@ 2,40 SAY "Empresa   :"
	@ 3,40 SAY "Fecha     :"
	@ 3,53 SAY DTOC(DATE())
	KSA=CUADRO("4 5 23 0 1 20 30 10 14")
	@ 6,1 SAY PADC("ARTICULO",20)
	@ 6,22 SAY PADC("DESCRIPCION",30)
	@ 6,53 SAY PADC("CANTIDAD",10)
	@ 6,64 SAY PADC("MONTO",14)
RETURN KSA
