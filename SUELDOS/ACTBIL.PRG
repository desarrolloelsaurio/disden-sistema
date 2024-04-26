********************************************************************************
*-- Programa: ACTBIL.PRG
*-- Fecha   : 11/20/90 09:21pm
*-- Version : G. REINER
*-- Notas   : ACTUALIZA LOS VALORES DE LOS BILLETES
********************************************************************************
ULPR=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') color i
DEFINE WINDOW win FROM 6,30 TO 21,60 TITL ' Monto de los Billetes ' DOUBLE SHAD COLOR SCHE 8
ACTI WINDOW win
@ 1,2 SAY 'CANTIDAD DE BILLETES   ' GET CANBIL;
  PICT '99';
  MESS 'Cantidad de Billetes a Utilizarse';
  RANGE 1,10
FOR C=1 TO 10
  @ C+2,2 SAY 'BILLETE '+STR(C,2)+'  '+STR(BILS[C],13,2)
NEXT
  READ
FOR C=1 TO 10
  @ C+2,2 SAY 'BILLETE '+STR(C,2)+'  ' GET BILS[C] picture '9999999999.99';
    MESS 'Ingrese los Billetes de Mayor a Menor'
NEXT
READ
RELE WIND WIN
RELE C
@ 24,0 say space(80)
RETURN
