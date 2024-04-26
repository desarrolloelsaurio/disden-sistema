********************************************************************************
*-- Programa: IMPGASI.PRG
*-- Fecha   : 21.04.90
*-- Version : G. REINER
*-- Notas   : IMPRIME POR PANTALLA UN GASTO EFECTUADO
********************************************************************************
@ 0,0 TO 12,46 DOUB
@ 2,8 SAY "INGRESO DE GASTOS DE IMPORTACION" COLOR wu/n
@ 4,2 SAY "Nro Importaci¢n" COLOR w+/n
@ 4,25 GET gasimport PICT "@X"
@ 5,2 SAY "Rubro del Gasto" COLOR w+/n
GO GASGASTO IN GAS
@ 5,25 GET GAS.GASTO
@ 6,2 SAY "Fecha del Gasto" COLOR w+/n
@ 6,25 GET gasfecha
@ 7,2 SAY "Monto del Gasto" COLOR w+/n
@ 7,25 GET gasmonto PICT "99999999999.99"
@ 8,2 SAY "Moneda del Gasto" COLOR w+/n
@ 8,25 SAY RTRIM(MON[gasmon]) COLO SCHE 24
IF GASMON=1
   @ 9,2 SAY "Moneda de Referencia" COLOR w+/n
   @ 9,25 SAY RTRIM(MON[gasmocom]) COLO SCHE 24
   @ 10,2 SAY "Cotizaci¢n Hist¢rica" COLOR w+/n
   @ 10,25 SAY STR(gasmonto/gascotiz,16,2) COLO SCHE 24
ENDI
CLEAR GETS
RETURN
 
