******************************************************************************
*-- Programa: ADI.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA ADICIONALES
*	      GENERA POPUP DE ELECCION PARA TRABAJOS CON RESP1 COMO RESPUESTA
*	      DERIVA A LOS PROGRAMAS CORRESPONDIENTES
********************************************************************************
ulpr=PROGRAM()
@ 0,0 SAY REPLICATE("Û",80) COLOR W
@ 0,1 SAY 'Sueldos y Jornales' COLOR I
@ 0,20 SAY '|'
@ 0,22 SAY DATE() COLOR I
@ 0,32 SAY '|'
@ 0,34 SAY TIME() COLOR I
@ 0,44 SAY '|'
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 0,58 SAY '|'
@ 0,60 SAY PADL(janname,19,' ') COLOR I
DO CASE
CASE BAR()=1
   DO iadi
CASE BAR()=7
   DEFI POPU caca FROM 14,20 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca PROM ' Listado \<Completo'
   DEFI BAR 2 OF caca PROM ' F¢rmula \<Quincenales'
   DEFI BAR 3 OF caca PROM ' F¢rmula \<Mensuales'
   ON SELE POPU caca DO ladii
   ACTI POPU caca
CASE BAR()=8
   DEFI POPU caca FROM 17,20 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca PROM ' M\<uestra Ficha'
   DEFI BAR 2 OF caca PROM ' F¢rmula \<Quincenales'
   DEFI BAR 3 OF caca PROM ' F¢rmula \<Mensuales'
   DEFI BAR 4 OF caca PROM ' \<Varios'
   ON SELE POPU caca DO ladip
   ACTI POPU caca
CASE BAR()=10
   ulpr='XADI'
   DO kk WITH 14,20
   ON SELE POPU caca DO xadi
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE adipop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO adipop
      DO opadi
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF eliadi(pq[dijo])<>0
      GOTO respuesta
      IF dijo=2
         DO cadi
      ELSE
         IF dijo=4
            DO badi
         ELSE
            DO lladi
            DO opadi
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO adipop
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
