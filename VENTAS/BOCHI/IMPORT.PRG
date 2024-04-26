********************************************************************************
*-- Programa: IMPORT.PRG
*-- Fecha   : 20.04.90
*-- Version : G. REINER
*-- Notas   : MENU DE TIPO DE IMPORTACION
********************************************************************************
DO CASE
CASE BAR()=1
   SELE IMP
   DEFI WIND WIN FROM 5,5 TO 19,75
   ACTI WIND WIN
   DO INDATIMP
   DEAC WIND ALL
CASE BAR()=2
   STOR 0 TO RESPUESTA
   ACTI POPU IMPPOP
   IF !EMPTY(RESPUESTA)
      SELE IMP
      III=PROM()
      DEFI WIND WIN FROM 6,5 TO 20,75
      ACTI WIND WIN
      SCAN FOR NROIMP=III
         ACTI WIND WIN
         DO IMPIMP
         ACTI SCREEN
         RR='N'
         @ 20,10 SAY 'Es esto lo que quiere corregir ? ' GET RR
         READ
         IF RR='S'
            ACTI WIND WIN
            DO CODATIMP
            EXIT
         ENDI
      ENDSCAN
      DEAC WIND ALL
   ENDI
CASE BAR()=4
   SELE IMP
   DEFI WIND WIN FROM 8,5 TO 22,75
   ACTI WIND WIN
   SCAN
      DO IMPIMP
      ACTI SCREEN
      @ 22,10 SAY 'Toque Tecla para seguir / "0" para Men£'
      =INKEY(0,'HM')
      IF LASTKEY()=48
         EXIT
      ENDI
      SELE IMP
      ACTI WIND WIN
   ENDSCAN
   DEAC WIND ALL
CASE BAR()=5
   DEFI POPU CLI1 FROM 6,8 MESS 'Elige el Tipo de Listado'
   DEFI BAR 1 OF CLI1 PROM ' Todo el Archivo'
   DEFI BAR 2 OF CLI1 PROM ' Por N§ de Importaci¢n '
   DEFI BAR 3 OF CLI1 PROM ' Un N§ de Importaci¢n'
   ON SELE POPU CLI1 DO LIIMPPA1
   ACTI POPU CLI1
ENDC
RETURN
 
