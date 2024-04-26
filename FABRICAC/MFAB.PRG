**************************************
*-- Programa: mfab.prg
*-- Fecha   : 07/31/91 05:29pm
*-- Version : G. REINER
*-- Notas   : muestra ordend de corte
**************************************
#DEFINE PICU '999999'
@ 1,1 SAY 'Orden '+favri COLO SCHE 3
nad=fab.numero
@ 1,COL GET nad
@ 2,1 SAY 'PRODUCTO' COLO SCHE 3
SELE mer
SET ORDER TO 1
SEEK fab.articulo
nad=mer.articulo
nad1=mer.merca
@ 2,COL GET nad
@ 3,COL GET nad1
@ 4,1 SAY 'FECHA INICIO' COLO SCHE 3
nad=fab.fechaini
@ 4,COL GET nad
@ 4,35 SAY 'FECHA FIN' COLO SCHE 3
nad=DATE()
@ 4,COL+27 GET nad
@ 5,1 SAY 'CORTADOS' COLO SCHE 3
nad=fab.corte
@ 5,COL GET nad PICT picu
@ 6,1 SAY 'CANT INICIAL' COLO SCHE 3
nad=fab.cantini
@ 6,COL GET nad PICT picu
@ 6,35 SAY 'CANT PREV.' COLO SCHE 3
nad=fab.cantpre
@ 6,COL+27 GET nad PICT picu
@ 7,1 SAY 'TERM PRIMERA' COLO SCHE 3
nad=0
@ 7,COL GET nad PICT picu
@ 8,1 SAY 'TERM SEGUNDA' COLO SCHE 3
@ 8,COL GET nad PICT picu
@ 9,1 SAY 'TERM SEGUNDA E.' COLO SCHE 3
@ 9,COL GET nad PICT picu
@ 10,1 SAY 'PERDIDA TOTAL' COLO SCHE 3
@ 10,COL GET nad PICT picu
CLEAR GETS
RETURN
