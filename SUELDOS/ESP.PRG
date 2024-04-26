*:*********************************************************************
*:
*:        Program: ESP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARIOS.PRG                    
*:
*:          Calls: IESP.PRG
*:               : LGENI.PRG
*:               : LGENP.PRG
*:               : KK             (procedure in PROCESOS.PRG)
*:               : XESP           (procedure in PROCESOS.PRG)
*:               : OPESP          (procedure in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:               : CESP.PRG
*:               : BESP.PRG
*:               : LLESP.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ESP.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA ESPECIALIDADES
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
   DO iesp
CASE BAR()=7 .OR. BAR()=8
   MAX=2
   tt='Listado de Especialidades'
   DECL co[MAX],ct[MAX]
   co[1]=' N§ '
   co[2]='    ESPECIALIDAD    '
   ct[1]='STR(RECNO(),4)'
   ct[2]='ESPECIALI'
   IF BAR()=7
      DO lgeni
   ELSE
      DO lgenp
   ENDIF
   RELE ct,co,MAX,tt
CASE BAR()=10
   ulpr='XESP'
   DO kk WITH 9,20
   ON SELE POPU caca DO xesp
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE esppop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO esppop
      DO opesp
      SET FILTER TO DELETED()
   ENDIF
   STORE 0 TO respuesta
   IF eliesp(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO cesp
      ELSE
         IF dijo=4
            DO besp
         ELSE
            DO llesp
            SET FILTER TO
         ENDIF
      ENDIF
   ENDIF
   SET DELE ON
   STORE esppop TO anterior
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
*: EOF: ESP.PRG
