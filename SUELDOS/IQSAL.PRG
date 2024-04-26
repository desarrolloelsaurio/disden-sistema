*:*********************************************************************
*:
*:        Program: IQSAL.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: QSAL.PRG                      
*:
*:          Calls: IQSAL1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : IQSAL1S.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:01               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IQSAL.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : INGRESA SALARIO FAMILAR PARA LA LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=1
   fisc='LASTKEY()<>27'
   DO iqsal1
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(' - Ingreso Salario Familiar')<>0
      GOTO respuesta
      DO iqsal1s
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Salario Familiar')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO iqsal1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Salario Familiar')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO iqsal1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Salario Familiar')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO iqsal1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Salario Familiar')<>0
      xcos=respuesta
      fisc='ESP=XCOS'
      DO iqsal1
   ENDIF
ENDCASE
RETURN

*: EOF: IQSAL.PRG
