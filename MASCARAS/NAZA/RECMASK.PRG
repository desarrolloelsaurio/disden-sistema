*:*********************************************************************
*:
*:        Program: RECMASK.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 12/10/91     12:15
*:
*:      Called by: MREC2.PRG                     
*:
*:      Documented 01/30/92 at 15:51               FoxDoc  version 2.01
*:*********************************************************************
*
*-- Name....: RECMASK.PRG
*-- Notes...: MASCARA REMITO PROVEEDORES
*
CLEAR
@ 1,3  SAY "Proveedor: "
@ 1,45 SAY "Nro REMITO : "
@ 2,45 SAY "Marca : "
@ 3,45 SAY "Fecha : "

A="Ú"+REPLICATE("Ä",16)+"Â"+REPLICATE("Ä",29)+"Â"+REPLICATE("Ä",5)+"Â"+REPLICATE("Ä",6)+"Â"+REPLICATE("Ä",10)+"Â"+REPLICATE("Ä",7)+"¿"
B="³"+SPAC(16)+"³"+SPAC(29)+"³"+SPAC(5)+"³"+SPAC(6)+"³"+SPAC(10)+"³"+SPAC(7)+"³"
C="Ã"+REPLICATE("Ä",16)+"Å"+REPLICATE("Ä",29)+"Å"+REPLICATE("Ä",5)+"Å"+REPLICATE("Ä",6)+"Å"+REPLICATE("Ä",10)+"Å"+REPLICATE("Ä",7)+"´"
D="À"+REPLICATE("Ä",16)+"Á"+REPLICATE("Ä",29)+"Á"+REPLICATE("Ä",5)+"Á"+REPLICATE("Ä",6)+"Á"+REPLICATE("Ä",10)+"Á"+REPLICATE("Ä",7)+"Ù"
@ 7,0 SAY A
@ 8,0 SAY B
@ 9,0 SAY C
FOR ren=10 TO 23
   @ ren,0 SAY B
   NEXT
   @ ren,0 SAY D
   @ 8,5 SAY "ARTICULO"
   @ 8,27 SAY "DESCRIPCION"
   @ 8,48 SAY "TALLE"
   @ 8,54 SAY "UNIDAD"
   @ 8,62 SAY "RECIBIDO"
   @ 8,73 SAY "COLOR"
   RETURN
*: EOF: RECMASK.PRG
