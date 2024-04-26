*:*********************************************************************
*-- Name....: PECMASK.PRG
*-- Notes...: MASCARA NOTA DE PEDIDOS
*:**********************************************************************
FUNCTION PECMASK
	PARAMETER XSA,ESREMITO
	IF XSA
		CLEA
	ENDIF
	=CABPAN1()
	ACTI WIND WIN2
	@ 1,3  SAY "Proveedor :"
	IF ESREMITO
	@ 1,40 SAY "N§ REMITO :"	
	ELSE
	@ 1,40 SAY "N§ PEDIDO :"
	ENDIF
	@ 2,40 SAY "Empresa   :"
	@ $+1,40 SAY "Fecha     :"
	@ $,53 SAY DTOC(DATE())
	if !esremito
	@ $+1,0  SAY "Cond. Pago: 1)"
	@ $,40 SAY "Presupuesto: "	
	@ $+1,12 SAY "2)"
	@ $+1,12 SAY "3)"
	re1=8
	else
	re1=6
	endif
	
	KSA=CUADRO("4 "+alltrim(str(re1-1))+" 23 0 1 20 30 10 14")
	@ re1,1 SAY PADC("ARTICULO",20)
	@ re1,22 SAY PADC("DESCRIPCION",30)
	@ re1,53 SAY PADC("CANTIDAD",10)
	@ re1,64 SAY PADC("MONTO",14)
RETURN KSA
