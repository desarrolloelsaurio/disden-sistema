********************************************************************************
*-- Programa: MPRO.PRG
*-- Fecha   : 06/07/91 11:12am
*-- Version : E. BANALOTTI
*-- Notas   : MUESTRA PROVEEDORES
*-- Modificaci¢n GOYO 06-28-92 06:07pm - acorto picture/parametro
********************************************************************************
parameter cosa
ACTI WIND win
@ 1,2 SAY "CODIGO PROVEEDOR" COLO SCHE 3
@ 2,2 SAY "RAZON SOCIAL    " COLO SCHE 3
@ 3,2 SAY "ENCARGADO VENTAS" COLO SCHE 3
@ 4,2 SAY "DOMICILIO       " COLO SCHE 3
@ 5,2 SAY "LOCALIDAD       " COLO SCHE 3
@ 6,2 SAY "TELEFONO        " COLO SCHE 3
@ 7,2 SAY "FAX             " COLO SCHE 3
@ 8,2 SAY "FECHA 1¦ OPER.  " COLO SCHE 3
if !cosa
@ 1,COL GET m->procod PICT '@!'
@ 2,COL GET m->proveedor PICT '@!'
@ 3,COL GET m->encventas PICT '@!'
@ 4,COL GET m->domicilio PICT '@!'
@ 5,COL GET m->localidad PICT '@!'
@ 6,COL GET m->telefono PICT '@!'
@ 7,COL GET m->FAX PICT '@!'
@ 8,COL GET m->finop
CLEAR GETS
endif
RETURN
