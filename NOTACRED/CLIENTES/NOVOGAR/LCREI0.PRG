FUNCTION LCREI0
	?
	?
	IF XSEEK(FAC.FACTURA,'CCL','NUMERORE')
	   ? "     Nota de Cr‚dito sobre la FACTURA"
       ?? RIGHT(CCL.COMPR,18)	   
	   ?  "     en concepto de "
	   ?? ccl.detalle
	   IF LEFT(FAC.FACTURA,1)="A"
	      ?? FAC.MONTOBRU	picT "99,999,999,999.99" AT 61
       ENDIF
	ENDIF
	SELE fac
	??? CHR(15)
RETURN .T.
