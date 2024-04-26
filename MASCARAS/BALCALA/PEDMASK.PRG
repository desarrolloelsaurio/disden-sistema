********************************************************************************
*-- Name....: PEDMASK.PRG
*-- Date....: 9-26-89
*-- Version.: dBASE IV, Format 1.0
*-- Notes...: MASCARA FACTURA
********************************************************************************
function pedmask
CLEAR
@ 1,3  SAY "Cliente  : "
@ 1,45 SAY "Nro NOTA DE PEDIDO : "
@ 2,45 SAY "Marca : "
@ 3,45 SAY "Viajante : "
@ 4,45 SAY "Fecha : "
@ 5,45 SAY "Cond. Pago : "

@ 4,53 SAY DTOC(DATE())

A=CUADRO("5 6 22 0 2 15 30 12 10 7 ")

@ 7,5 SAY "ARTICULO"
@ 7,27 SAY "DESCRIPCION"
@ 7,48 SAY "CURVA/TALLE"
@ 7,62 SAY "CANTIDAD"
@ 7,73 SAY "COLOR"
RETURN(A)
