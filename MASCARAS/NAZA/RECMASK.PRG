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

A="�"+REPLICATE("�",16)+"�"+REPLICATE("�",29)+"�"+REPLICATE("�",5)+"�"+REPLICATE("�",6)+"�"+REPLICATE("�",10)+"�"+REPLICATE("�",7)+"�"
B="�"+SPAC(16)+"�"+SPAC(29)+"�"+SPAC(5)+"�"+SPAC(6)+"�"+SPAC(10)+"�"+SPAC(7)+"�"
C="�"+REPLICATE("�",16)+"�"+REPLICATE("�",29)+"�"+REPLICATE("�",5)+"�"+REPLICATE("�",6)+"�"+REPLICATE("�",10)+"�"+REPLICATE("�",7)+"�"
D="�"+REPLICATE("�",16)+"�"+REPLICATE("�",29)+"�"+REPLICATE("�",5)+"�"+REPLICATE("�",6)+"�"+REPLICATE("�",10)+"�"+REPLICATE("�",7)+"�"
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