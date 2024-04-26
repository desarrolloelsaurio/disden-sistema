PROCEDURE ANULFAC
=opccs()
do muesfact
m.factura=fac.factura
IF !EMPTY(m.factura)
	if confirma("Anula el comprobante?",.t.,20,10)
		m.factura=fac.factura
		sele fac
		dele for factura=m.factura
		sele fax
		dele for factura=m.factura
		sele ccs
		dele for factura=m.factura
		sele ccl
		dele for NUMERORE=m.factura AND !EMPTY(m.factura)
	ELSE
	   	=NOSELEC("FACTURA")
	ENDIF
ENDIF
=CLOSDBF("FAC") .OR. CLOSDBF("FAX")
RETURN MEN_LIN(BOTOM)
