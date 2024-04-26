*:*********************************************************************
*:
*:        Program: CAT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARIOS.PRG                    
*:
*:          Calls: ICAT.PRG
*:               : LCATI.PRG
*:               : LCATP.PRG
*:               : KK             (procedure in PROCESOS.PRG)
*:               : XCAT           (procedure in PROCESOS.PRG)
*:               : ACAT.PRG
*:               : OPCAT          (procedure in PROCESOS.PRG)
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : CCAT.PRG
*:               : BCAT.PRG
*:               : LLCAT.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: CAT.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA CATEGORIAS
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
@ 24,0 SAY PADC('Espere por Favor',80,"*")
DO CASE
CASE BAR()=1
   DO icat
CASE BAR()=7
   DEFI POPU caca FROM 10,20 MESSAGE 'Tipo de Listado' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Todas las Categor¡as '
   DEFI BAR 2 OF caca PROM ' Por \<Convenio'
   ON SELE POPU caca DO lcati
   ACTI POPU caca
   RELE POPU caca
CASE BAR()=8
   DEFI POPU caca FROM 10,20 MESSAGE 'Tipo de Listado' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Todas las Categor¡as '
   DEFI BAR 2 OF caca PROM ' Por \<Convenio'
   ON SELE POPU caca DO lcatp
   ACTI POPU caca
   RELE POPU caca
CASE BAR()=12
   ulpr='XCAT'
   DO kk WITH 13,20
   ON SELE POPU caca DO xcat
   ACTI POPU caca
CASE BAR()=10
   DEFI POPU caca FROM 15,25 MESSAGE 'Tipo de Actualizaci¢n' SHAD COLOR SCHE 3
   DEFI BAR 1 OF caca PROM ' \<Correcci¢n'
   DEFI BAR 2 OF caca PROM ' \<Actualizaci¢n '
   DEFI BAR 3 OF caca PROM ' C \<lculo'
   ON SELE POPU caca DO acat
   ACTI POPU caca
   RELE POPU caca
OTHERWISE
   dijo=BAR()
   STORE catpop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO catpop
      DO opcat
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF elicat(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO ccat
      ELSE
         IF dijo=4
            DO bcat
         ELSE
            DO llcat
            SET FILTER TO
         ENDIF
      ENDIF
   ENDIF
   RELE dijo
   SET DELE ON
   STORE anterior TO catpop
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
*: EOF: CAT.PRG
