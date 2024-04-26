*:*********************************************************************
*-- Name....: FCDMASK.PRG
*-- Notes...: MASCARA NOTA DE PEDIDOS
*:*********************************************************************
CLEA
@ 1,3  SAY "Proveedor: "
@ 1,40 SAY "N§ "+ABR+" PROVEED.:"
@ 2,40 SAY "Empresa :"
@ 3,40 SAY "Fecha   :"
@ 3,53 SAY DTOC(DATE())
@ 4,nul  SAY "Cond. Pago: "
@ 5,nul  SAY "Cotizaci¢n del "+PADC(xadol,7)+":"
@ 6,nul SAY PADL("FACTURA EN "+PADC(xadols,4)+" O "+PADC(xauss,4),22)+":"
@ 7,nul SAY "Tipo Gasto:"
RETURN
