*:*********************************************************************
*-- Name....: PECMASK.PRG
*-- Notes...: MASCARA NOTA DE PEDIDOS
*:**********************************************************************
FUNCTION PECMASK
	PARAMETER XSA
	IF XSA
		CLEA
	ENDIF
	@ 1,3  SAY "Proveedor: "
	@ 1,45 SAY "Nro NOTA DE PEDIDO : "
	@ 2,45 SAY "Marca : "
	@ 3,45 SAY "Fecha : "
	@ 3,53 SAY DTOC(DATE())
	@ 4,0  SAY "Cond. Pago: 1) "
	@ 5,12 SAY "2) "
	@ 6,12 SAY "3) "
	@ 4,40 SAY "Presupuesto: "
	KSA=CUADRO("6 5 23 0 1 16 29 5 6 10 7")
	@ 8,5 SAY "ARTICULO"
	@ 8,27 SAY "DESCRIPCION"
	@ 8,48 SAY "TALLE"
	@ 8,54 SAY "UNIDAD"
	@ 8,62 SAY "CANTIDAD"
	@ 8,73 SAY "COLOR"
RETURN KSA
