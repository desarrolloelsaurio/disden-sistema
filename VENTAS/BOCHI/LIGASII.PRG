********************************************************************************
*-- Programa: LIGASII.PRG
*-- Fecha   : 26.04.90
*-- Version : G. REINER
*-- Notas   : DERIVA IMPRESION DE IMPORTACION
********************************************************************************
DO CASE
CASE BAR()=1
   RESPUESTA=0
   ACTI POPU IMPPOP
   IF !EMPTY(RESPUESTA)
      DO LIGASIIP WITH PROM()
   ENDI
CASE BAR()=2
   RESPUESTA=0
   SELE GAS
   ACTI POPU GASPOP
   IF !EMPTY(RESPUESTA)
      GO TOP
      SKIP RESPUESTA-1
      DO LIGASIIG WITH RECNO()
   ENDI
ENDC
RETURN
