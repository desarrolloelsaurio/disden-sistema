*:*********************************************************************
*:
*:        Program: IHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: HOR.PRG                       
*:
*:          Calls: IHOR1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : IHOR1S.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:00               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IHOR.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : INGRESA HORAS TRABAJADAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=1
   fisc='LASTKEY()<>27'
   DO ihor1
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(' - Ingreso Horas Trabajadas')<>0
      GOTO respuesta
      DO ihor1s
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO ihor1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO ihor1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO ihor1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Horas Trabajadas')<>0
      xcos=respuesta
      fisc='ESP=XCOS'
      DO ihor1
   ENDIF
ENDCASE
RETURN

*: EOF: IHOR.PRG
