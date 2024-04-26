********************************************************************************
*-- Name....: PEDMASK.PRG
*-- Date....: 9-26-89
*-- Version.: BATA / G. REINER
*-- Notes...: MASCARA FACTURA
*-- Modificaci¢n GOYO 08-06-92 05:02pm 
********************************************************************************
function pedmask
CLEAR
@ 1,3  SAY "Cliente  : "
@ 1,45 SAY "N§ NOTA DE PEDIDO : "
@ 2,45 SAY "Empresa  : "
@ 3,45 SAY "Viajante : "
@ 4,45 SAY "Fecha : "
@ 5,45 SAY "Cond. Pago : "

@ 4,53 SAY DTOC(DATE())

A=CUADRO("5 6 23 0 2 15 30 12 10 7 ")

@ 7,5 SAY "ARTICULO"
@ 7,27 SAY "DESCRIPCION"
@ 7,48 SAY "CURVA/TALLE"
@ 7,62 SAY "CANTIDAD"
@ 7,73 SAY "COLOR"
RETURN A
