********************************************************************************
*-- Programa: INGASTO.PRG
*-- Fecha   : 21.04.90
*-- Version : G. REINER
*-- Notas   : MENU DE INGRESO DE GASTOS
********************************************************************************
DO CASE
CASE BAR()=1
   SELE GASI
   DEFI WIND WIN FROM 5,30 TO 19,79 DOUB
   ACTI WIND WIN
   DO INDATGIM
CASE BAR()=2
   RESPUESTA=0
   ACTI POPU IMPPOP
   IF !EMPTY(RESPUESTA)
      III=PROM()
      SELE GAS
      RESPUESTA=0
      ACTI POPU GASPOP
      IF !EMPTY(RESPUESTA)
         GO TOP
         SKIP RESPUESTA-1
         GGG=RECNO()
         SELE GASI
         DEFI WIND WIN FROM 6,30 TO 20,79 DOUB
         SCAN FOR GASIMPORT=III .AND. GASGASTO=GGG
            ACTI WIND WIN
            CLEA
            DO IMPGASI
            ACTI SCREEN
            ES='N'
            @ 20,33 SAY 'Es esto lo que quiere corregir ? ' get es
            READ
            IF ES='S'
               ACTI WIND WIN
               DO CODATGIM
               EXIT
            ENDI
         ENDSCAN
      ENDI
   ENDI
   DEAC WIND ALL
CASE BAR()=4
   DEFI WIND WIN FROM 8,30 TO 22,79 DOUB
   ACTI WIND WIN
   SELE GASI
   SCAN
      DO IMPGASI
      ACTI SCREEN
      @ 22,33 SAY 'Tecla para continuar / "0" para Men£'
      =INKEY(0,'HM')
      IF LASTKEY()=48
         EXIT
      ELSE
         ACTI WIND WIN
         CLEAR
      ENDI
   ENDSCAN
   DEAC WIND ALL
CASE BAR()=5
   DEFI POPU CLI1 FROM 8,44 MESS 'Tipo de Listado'
   DEFI BAR 1 OF CLI1 PROM ' Una Importaci¢n'
   DEFI BAR 2 OF CLI1 PROM ' Por Tipo de Gasto '
   ON SELE POPU CLI1 DO LIGASII
   ACTI POPU CLI1
ENDC
RETURN
 
 
 
