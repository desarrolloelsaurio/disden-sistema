*:*********************************************************************
*:
*:        Program: THOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARIOS.PRG                    
*:
*:          Calls: ITHOR.PRG
*:               : LTHORI.PRG
*:               : LTHORP.PRG
*:               : KK             (procedure in PROCESOS.PRG)
*:               : XTHOR          (procedure in PROCESOS.PRG)
*:               : OPTHOR         (procedure in PROCESOS.PRG)
*:               : ELITHOR()      (function  in PROCESOS.PRG)
*:               : CTHOR.PRG
*:               : BTHOR.PRG
*:               : LLTHOR.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
******************************************************************************
*-- Programa: THOR.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA CENTROS DE COSTOS
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
DO CASE
CASE BAR()=1
   DO ithor
CASE BAR()=7
   DEFI POPU caca FROM 14,20 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca PROM ' Listado \<Completo'
   DEFI BAR 2 OF caca PROM ' F¢rmula \<Quincenales'
   DEFI BAR 3 OF caca PROM ' F¢rmula \<Mensuales'
   ON SELE POPU caca DO lthori
   ACTI POPU caca
CASE BAR()=8
   DEFI POPU caca FROM 15,20 MESSAGE 'Tipo de Listado' SHAD COLO SCHE 3
   DEFI BAR 1 OF caca PROM ' M\<uestra Ficha'
   DEFI BAR 2 OF caca PROM ' F¢rmula \<Quincenales'
   DEFI BAR 3 OF caca PROM ' F¢rmula \<Mensuales'
   DEFI BAR 4 OF caca PROM ' \<Variables'
   ON SELE POPU caca DO lthorp
   ACTI POPU caca
CASE BAR()=10
   ulpr='XTHOR'
   DO kk WITH 16,20
   ON SELE POPU caca DO xthor
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE thorpop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO thorpop
      DO opthor
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF elithor(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO cthor
      ELSE
         IF dijo=4
            DO bthor
         ELSE
            DO llthor
            DO opthor
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE anterior TO thorpop
ENDCASE
RELE dijo
RETURN
*: EOF: THOR.PRG
