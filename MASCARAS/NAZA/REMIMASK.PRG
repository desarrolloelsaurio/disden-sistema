********************************************************************************
*-- Name....: REMIMASK.PRG
*-- Date....: 07/30/91 11:14am
*-- Version.: E. BANALOTTI
*-- Notes...: MASCARA REMITO
********************************************************************************
FUNCTION REMIMASK
PRIVATE COSA
COSA=CUADRO('5 6 23 0 2 17 27 14 8 8 ')
@ 7,5 SAY 'ARTICULO' COLO SCHE 3
@ 7,24 SAY 'DESCRIPCION ' COLO SCHE 3
@ 7,47 SAY 'CUR/TALLE/COL' COLO SCHE 3
@ 7,62 SAY 'CANTIDAD' COLO SCHE 3
@ 7,72 SAY 'TOTAL' COLO SCHE 3
@ 1,nul SAY "Sr."
=cabpan1()
RETURN(COSA)
