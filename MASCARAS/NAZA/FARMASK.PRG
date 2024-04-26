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

A="Ú"+REPL("Ä",13)+"Â"+REPL("Ä",8)+"Â"+REPL("Ä",5)+"Â"+REPL("Ä",4)+"Â"+REPL("Ä",10)+"Â"+REPL("Ä",16)+"Â"+REPL("Ä",16)+"¿"
B="³"+SPAC(13)+"³"+SPAC(8)+"³"+SPAC(5)+"³"+SPAC(4)+"³"+SPAC(10)+"³"+SPAC(16)+"³"+SPAC(16)+"³"
C="Ã"+REPL("Ä",13)+"Å"+REPL("Ä",8)+"Å"+REPL("Ä",5)+"Å"+REPL("Ä",4)+"Å"+REPL("Ä",10)+"Å"+REPL("Ä",16)+"Å"+REPL("Ä",16)+"´"
D="À"+REPL("Ä",13)+"Á"+REPL("Ä",8)+"Á"+REPL("Ä",5)+"Á"+REPL("Ä",4)+"Á"+REPL("Ä",10)+"Á"+REPL("Ä",16)+"Á"+REPL("Ä",16)+"Ù"

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