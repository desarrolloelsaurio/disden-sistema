*:*********************************************************************
*:
*:        Program: FARMASK.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 01/10/92     13:40
*:
*:      Called by: MFAR2.PRG                     
*:
*:      Documented 01/30/92 at 15:51               FoxDoc  version 2.01
*:*********************************************************************
*
*-- Name....: FARMASK.PRG
*-- Notes...: MASCARA NOTA DE PEDIDOS
*
CLEAR
@ 1,3  SAY "Proveedor: "
@ 1,45 SAY IIF(tipofar,"Nro FACTURA PROVEED. :","Nro NOTA DE DEBITO   :")
@ 2,45 SAY "Marca : "
@ 3,45 SAY "Fecha : "
@ 3,53 SAY DTOC(DATE())
@ 4,0  SAY "Cond. Pago: "

A="�"+REPL("�",13)+"�"+REPL("�",8)+"�"+REPL("�",5)+"�"+REPL("�",4)+"�"+REPL("�",10)+"�"+REPL("�",16)+"�"+REPL("�",16)+"�"
B="�"+SPAC(13)+"�"+SPAC(8)+"�"+SPAC(5)+"�"+SPAC(4)+"�"+SPAC(10)+"�"+SPAC(16)+"�"+SPAC(16)+"�"
C="�"+REPL("�",13)+"�"+REPL("�",8)+"�"+REPL("�",5)+"�"+REPL("�",4)+"�"+REPL("�",10)+"�"+REPL("�",16)+"�"+REPL("�",16)+"�"
D="�"+REPL("�",13)+"�"+REPL("�",8)+"�"+REPL("�",5)+"�"+REPL("�",4)+"�"+REPL("�",10)+"�"+REPL("�",16)+"�"+REPL("�",16)+"�"

@ 7,0 SAY A
@ 8,0 SAY B
@ 9,0 SAY C
FOR ren=10 TO 23
   @ ren,0 SAY B
ENDF
@ ren,0 SAY D
@ 8,3 SAY "ARTICULO"
@ 8,15 SAY "DESCRIP."
@ 8,24 SAY "TALLE"
@ 8,30 SAY "UNID"
@ 8,36 SAY "CANTIDAD"
@ 8,48 SAY "COSTO UNIT."
@ 8,65 SAY "COSTO TOTAL"
RETURN
*: EOF: FARMASK.PRG
