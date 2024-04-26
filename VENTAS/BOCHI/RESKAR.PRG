********************************************************************************
*-- Programa: RESKAR.PRG
*-- Fecha   : 26.04.90
*-- Version : G. REINER
*-- Notas   : SALDA KARDEX
********************************************************************************
DO CASE
CASE BAR()=1
   DEFI WIND WIN FROM 10,0 TO 14,79
   ACTI WIND WIN
   CON='N '
   @ 1,10 SAY 'BORRA EL KARDEX (S/N) ?   ' GET CON PICT 'XX'
   READ
   IF CON='S'
      DO TIT2 WITH 1,' ESPERE POR FAVOR - BORRANDO KARDEX ','I*/W',78
      SELE KAR
      DELE ALL
   ENDI
   DEAC WIND ALL
CASE BAR()=2
   DO SALKAR
ENDC
RETURN
 
