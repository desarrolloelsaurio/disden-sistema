********************************************************************************
*-- Name....: INDATGIM.PRG
*-- Date....: 21.04.90
*-- Version.: G. REINER
*-- Notes...: INGRESA GASTOS EFECTUADOS
********************************************************************************
REST FROM ..\VENTASA\DOLAR ADDI
DO WHIL .T.
   CLEA
   GAS=0
   FEC=DATE()
   MONTO=0
   MONE=0
   MORES=0
   MOMON=0
   @ 0,0 TO 12,46 DOUB
   @ 2,8 SAY "INGRESO DE GASTOS DE IMPORTACION" COLOR wu/n
   @ 4,2 SAY "Nro Importaci¢n" COLOR w+/n
   @ 5,2 SAY "Rubro del Gasto" COLOR w+/n
   @ 6,2 SAY "Fecha del Gasto" COLOR w+/n
   @ 7,2 SAY "Monto del Gasto" COLOR w+/n
   @ 8,2 SAY "Moneda del Gasto" COLOR w+/n
   @ 9,2 SAY "Moneda de Referencia" COLOR w+/n
   @ 10,2 SAY "Cotizaci¢n Hist¢rica" COLOR w+/n
   RESPUESTA=0
   ACTI SCREEN
   ACTI POPU IMPPOP
   IF !EMPTY(RESPUESTA)
      STOR PROM() TO IMPORT
      ACTI WIND WIN
      @ 4,25 SAY IMPORT COLO SCHE 24
      @ 5,2 SAY "Rubro del Gasto" COLOR w+/n
      RESPUESTA=0
      ACTI SCREEN
      DO WHIL EMPTY(RESPUESTA)
         ACTI POPU GASPOP
      ENDD
      ACTI WIND WIN
      GO TOP IN GAS
      SKIP RESPUESTA-1 IN GAS
      GAS=RECNO("GAS")
      @ 5,25 SAY GAS.GASTO COLOR U/W
      @ 6,2 SAY "Fecha del Gasto" COLOR w+/n
      @ 6,25 GET fec
      READ
      @ 7,2 SAY "Monto del Gasto" COLOR w+/n
      DO WHIL MONTO=0
         @ 7,25 GET monto PICT "99999999999.99"
         READ
      ENDD
      @ 8,2 SAY "Moneda del Gasto" COLOR w+/n
      ACTI SCREEN
      RESPUESTA=0
      DO WHIL EMPTY(RESPUESTA)
         ACTI POPU MONPOP
      ENDD
      MONE=RESPUESTA
      ACTI WIND WIN
      @ 8,25 SAY RTRIM(MON[MONE]) COLO SCHE 24
      IF MONE=1
         @ 9,2 SAY "Moneda de Referencia" COLOR w+/n
         RESPUESTA=0
         ACTI SCREEN
         DO WHIL EMPTY(RESPUESTA) .OR. RESPUESTA=1
            ACTI POPU MONPOP
         ENDD
         MORES=RESPUESTA
         ACTI WIND WIN
         @ 9,25 SAY RTRIM(MON[MORES]) COLO SCHE 24
         MOMON=VALMON[MORES]
         @ 10,2 SAY "Cotizaci¢n Hist¢rica" COLOR w+/n
         TT=STR(MONTO/MOMON,14,2)
         @ 10,25 SAY TT COLO SCHE 24
      ENDI
      APPEND BLANK
      REPL GASIMPORT WITH IMPORT
      REPL GASGASTO WITH GAS
      REPL GASFECHA WITH FEC
      REPL GASMONTO WITH MONTO
      REPL GASMON WITH MONE
      REPL GASMOCOM WITH MORES
      REPL GASCOTIZ WITH MOMON
      STOR FINGASI+1 TO FINGASI
   ELSE
      EXIT
   ENDI
ENDD
DEAC WIND ALL
RETURN
 
