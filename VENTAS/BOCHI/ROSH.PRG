********************************************************************************
*-- Programa: ROSH.PRG
*-- Fecha   : 30/10/89
*-- Version : G. REINER
*-- Notas   : IMPRIME CABEZA DE PANTALLA
********************************************************************************
PARAMETER CANTIDAD,TESTO,NUMEROS,RENGLON,COLUMNA
 
REST FROM ..\VENTASA\IMPRIME ADDITIVE
XXII=1
A=ESI
B=BAR
C=CHR(195)
DO WHIL XXII<=CANTIDAD
   TES1=LEFT(TESTO,AT(',',TESTO)-1)
   LIN1=VAL(LEFT(NUMEROS,AT(',',NUMEROS)-1))
   TES1=CENTRO(TES1,LIN1)
   A=A+REPL(LIN,LIN1)+CRAB
   B=B+TES1+BAR
   C=C+REPL(LIN,LIN1)+CRUZ
   XXII=XXII+1
   TESTO=SUBSTR(TESTO,AT(',',TESTO)+1)
   NUMEROS=SUBSTR(NUMEROS,AT(',',NUMEROS)+1)
ENDD
A=LEFT(A,LEN(A)-1)+ESD
C=LEFT(C,LEN(C)-1)+CHR(180)
@ RENGLON,COLUMNA SAY A
@ RENGLON+1,COLUMNA SAY B
@ RENGLON+2,COLUMNA SAY C
RETURN
 
