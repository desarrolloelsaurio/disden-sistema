********************************************************************************
*-- Programa: QPRE.PRG
*-- Fecha   : 05-15-92 06:00pm
*-- Version : G. REINER
*-- Notas   : INGRESA DATOS DE PRECIOS Y STOCK
*-- PARAMETER CUAL
*-- CUAL 1 PRECIOS
*-- CUAL 2 STOCK
*-- CUAL 3 AMBOS
********************************************************************************
FUNCTION QPRE
PARAMETER CUAL
PRIVATE CUAL
IF CUAL#2
   @ 4,1 SAY 'COSTO REAL' COLO SCHE 3
   @ 5,1 SAY 'COSTO DE VENTA' COLO SCHE 3
   @ 6,1 SAY '% '+xalis1 COLO SCHE 3
   @ 7,1 SAY '% '+xalis2 COLO SCHE 3
   @ 8,1 SAY '% '+xalis3 COLO SCHE 3
   @ 9,1 SAY '% '+xalis4 COLO SCHE 3
ENDIF
IF CUAL>1
   @ 10,1 SAY 'STOCK' COLO SCHE 3
   @ 11,1 SAY 'STOCK MINIMO' COLO SCHE 3
   @ 12,1 SAY 'STOCK MAXIMO' COLO SCHE 3
   @ 13,1 SAY 'STOCK RESERVADO' COLO SCHE 3
ENDIF
IF CUAL#2
   @ 4,COL GET costorea PICT '99999999999.99' MESS 'Costo real del Producto - [ESC] Fin - [Ctrl][W] Confirma Datos'
   @ 5,COL GET cost PICT '99999999999.99' MESS 'Costo de Venta del Producto'
   @ 6,COL GET preci1 PICT '99999.99' MESS pcu+xalis1
   @ 7,COL GET preci2 PICT '99999.99' MESS pcu+xalis2
   @ 8,COL GET preci3 PICT '99999.99' MESS pcu+xalis3
   @ 9,COL GET preci4 PICT '99999.99' MESS pcu+xalis4
ENDIF
IF CUAL>1
   @ 10,COL GET stoc PICT '9999999' MESS 'Stock Disponible'
   @ 11,COL GET stocmin PICT '9999999' RANGE 1,9999999 MESS 'Stock M¡nimo'
   @ 12,COL GET stocmax PICT '9999999' RANGE stocmin,999999 MESS 'Stock M ximo'
   @ 13,COL GET stocres PICT '9999999' MESS 'Stock Reservado'
ENDIF
   READ
RETURN LAST()#27
