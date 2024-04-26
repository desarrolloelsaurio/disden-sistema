*:*********************************************************************
*:
*:        Program: MPE1.PRG
*:
*:         System: SYSTEMA DE COMPRAS
*:         Author: GOYO REINER
*:      Copyright (c) 1992, NAZA S.R.L.
*:  Last modified: 01/13/92     10:09
*:
*:      Called by: CPE11.PRG                     
*:
*:          Calls: UNID()         (function  in ?)
*:
*:      Documented 01/30/92 at 15:51               FoxDoc  version 2.01
*:*********************************************************************
*
*-- Programa: MPE1.PRG
*-- Fecha   : 07/06/91 08:32am
*-- Version : R. 'EL BATA'
*-- Notas   : MUESTRA UN REGISTRO DE UNA NOTA DE PEDIDO DE PROVEEDORES
*
STORE "@Z 9999999999" TO picu5
ACTI WIND win
@ 1,2 SAY "NOTA DE PEDIDO N§"COLO SCHE 3
@ 2,2 SAY "MARCA            " COLO SCHE 3
@ 3,2 SAY "COD. ARTICULO    " COLO SCHE 3
@ 4,2 SAY "DESCRIPCION      " COLO SCHE 3
@ 5,2 SAY "TALLE            " COLO SCHE 3
@ 6,2 SAY "UNIDAD           " COLO SCHE 3
@ 7,2 SAY "CANTIDAD         " COLO SCHE 3
@ 8,2 SAY "COLOR            " COLO SCHE 3
@ 9,2 SAY "ENTREGADO        " COLO SCHE 3

@ 1,COL GET m->pedido PICT picu5
GOTO m->marca IN mar
nada=mar->marca
@ 2,COL GET nada
@ 3,COL GET m->articulo
@ 4,COL GET m->descripcio PICT x30
@ 5,COL GET m->talle      PICT '@Z 99.99'
@ 6,COL GET unid(m->unidad)
@ 7,COL GET m->cantidad   PICT picu5
IF m->color#0
   GO m->color IN mix
   nada1 = mix->texto1
   @ 8,COL GET m->nada1
ENDIF
@ 9,COL GET m->entregado  PICT picu5
CLEAR GETS
RETURN
*: EOF: MPE1.PRG
