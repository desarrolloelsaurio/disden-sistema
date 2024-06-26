********************************************************************************
*-- Programa: SALKAR.PRG
*-- Fecha   : 26.04.90
*-- Version : G. REINER
*-- Notas   : SALDA KARDEX Y CALCULA SALDO ANTERIOR
********************************************************************************
DEFI WIND WIN FROM 10,0 TO 14,79 DOUB
ACTI WIND WIN
DO TIT2 WITH 1,' ESPERE POR FAVOR - SALDANDO KARDEX ','I*/W',78
SELE KAR
SET ORDER TO TAG KKKMERCA
GO TOP
ME=KKKMERCA
STOR 0 TO TOTAL
SCAN
   IF ME#KKKMERCA
      SKIP -1
      REPL KKKFECHA WITH DATE()
      REPL KKKDETALLE WITH 'Saldo Stock al '+DTOC(DATE())
      REPL KKKCLIENTE WITH 0
      IF TOTAL<1
         REPL KKKINGRESO WITH 'N'
      ELSE
         REPL KKKINGRESO WITH 'S'
      ENDI
      REPL KKKCANTIDA WITH ABS(TOTAL)
      REPL KKKKAR WITH .T.
      REPL KKKOCUP WITH ' '
      REPL KKKMAY WITH ' '
      SKIP
      ME=KKKMERCA
      STOR 0 TO TOTAL
   ENDI
   IF KKKINGRESO='S'
      STOR TOTAL+KKKCANTIDA TO TOTAL
   ELSE
      STOR TOTAL-KKKCANTIDA TO TOTAL
   ENDI
ENDSCAN
SKIP -1
REPL KKKFECHA WITH DATE()
REPL KKKDETALLE WITH 'Saldo Stock al '+DTOC(DATE())
REPL KKKCLIENTE WITH 0
IF TOTAL<1
   REPL KKKINGRESO WITH 'N'
ELSE
   REPL KKKINGRESO WITH 'S'
ENDI
REPL KKKCANTIDA WITH ABS(TOTAL)
REPL KKKKAR WITH .T.
REPL KKKOCUP WITH ' '
REPL KKKMAY WITH ' '
DELETE ALL FOR KKKFECHA#DATE() .OR. KKKCLIENTE#0
DEAC WIND ALL
RETURN
 
