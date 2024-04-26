*:*********************************************************************
*:
*:        Program: PAR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: VARIOS.PRG                    
*:
*:          Calls: IPAR.PRG
*:               : LGENI.PRG
*:               : LGENP.PRG
*:               : KK             (procedure in PROCESOS.PRG)
*:               : XPAR           (procedure in PROCESOS.PRG)
*:               : OPPAR          (procedure in PROCESOS.PRG)
*:               : ELIPAR()       (function  in PROCESOS.PRG)
*:               : CPAR.PRG
*:               : BPAR.PRG
*:               : LLPAR.PRG
*:
*:      Documented 04/23/91 at 20:45               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: PAR.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : ABRE LOS ARCHIVOS DE TRABAJO PARA PARENTESCOS
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
   DO ipar
CASE BAR()=7 .OR. BAR()=8
   tt='Listado de parentescos'
   MAX=2
   DECL co[MAX],ct[MAX]
   co[1]=' N§ '
   co[2]='     PARENTESCO     '
   ct[1]='STR(RECNO(),4)'
   ct[2]='PARENTESCO'
   IF BAR()=7
      DO lgeni
   ELSE
      DO lgenp
   ENDIF
   RELE ct,co,MAX,tt
CASE BAR()=10
   ulpr='XPAR'
   DO kk WITH 16,20
   ON SELE POPU caca DO xpar
   ACTI POPU caca
OTHERWISE
   dijo=BAR()
   STORE parpop TO anterior
   IF dijo=5
      SET DELE OFF
      STORE .T. TO parpop
      DO oppar
      SET FILTER TO DELETED()
   ENDIF
   IF elipar(pq[DIJO])<>0
      GOTO respuesta
      IF dijo=2
         DO cpar
      ELSE
         IF dijo=4
            DO bpar
         ELSE
            DO llpar
            SET DELE ON
            SET FILTER TO
         ENDIF
      ENDIF
   ENDIF
   STORE parpop TO anterior
ENDCASE
RELE dijo
ulpr=PROGRAM()
RETURN
*: EOF: PAR.PRG
