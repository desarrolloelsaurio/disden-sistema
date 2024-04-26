********************************************************************************
*-- Programa: LIIMPA1.PRG
*-- Fecha   : 20.04.90
*-- Version : G. REINER
*-- Notas   : DERIVA AL LISTADO DE IMPORTACION
********************************************************************************
DO CASE
CASE BAR()=1
   DO LIIMPPAI WITH ' '
CASE BAR()=2
   DO LIIMPPAI WITH 'GOYO'
CASE BAR()=3
   SELE IMP
   RESPUESTA=0
   ACTI POPU IMPPOP
   IF !EMPTY(RESPUESTA)
      DO LIIMPPAI WITH PROM()
   ENDI
ENDC
RETURN
