********************************************************************************
*-- Programa: LSKRRAN1.PRG
*-- Fecha   : 15.04.90
*-- Version : G. REINER
*-- Notas   : LISTA KARDEX
********************************************************************************
RES=BAR()
DO CASE
CASE BAR()=1
   STOR DATE() TO FECHA1
   DEFI WIND WLI from 10,1 to 18,78 DOUB
   ACTI WIND WLI
   DO TIT1 WITH 1,"INGRESE FECHA INICIAL PARA LISTADO ",'I'
   @ 3,1 SAY "INGRESE FECHA ('01/01/01' PARA MENU) " GET FECHA1
   READ
   IF FECHA1#{01/01/01}
      FECHA2=FECHA1
      DO TIT1 WITH 1,"INGRESE FECHA FINAL PARA LISTADO ",'I'
      @ 5,1 SAY "INGRESE FECHA ('01/01/01' PARA MENU) " GET FECHA2
      READ
   ELSE
      STOR NUL TO RES
   ENDI
CASE BAR()=2
   STORE NUL TO FECHA,FECHA2
ENDC
DEAC WIND ALL
IF !EMPTY(RES)
   DO LSKRRAN2 WITH FECHA1,FECHA2
ENDI
RETURN
