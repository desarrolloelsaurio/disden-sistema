*:*********************************************************************
*:
*:        Program: IQRET.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: QRET.PRG                      
*:
*:          Calls: IQRET1.PRG
*:               : ELIEMP()       (function  in PROCESOS.PRG)
*:               : IQRET1S.PRG
*:               : ELICAT()       (function  in PROCESOS.PRG)
*:               : ELICON()       (function  in PROCESOS.PRG)
*:               : ELICCOS()      (function  in PROCESOS.PRG)
*:               : ELIESP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:01               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: IQRET.PRG
*-- Fecha   : 8.11.1990
*-- Version : G. REINER
*-- Notas   : INGRESA RETENCIONES PARA LA LIQUIDACION
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO ordlis
DO CASE
CASE BAR()=1
   fisc='LASTKEY()<>27'
   DO iqret1
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(' - Ingreso Retenciones')<>0
      GOTO respuesta
      DO iqret1s
   ENDIF
CASE BAR()=3
   STORE 0 TO respuesta
   IF elicat(' - Ingreso Retenciones')<>0
      xcos=respuesta
      fisc='CAT=XCOS'
      DO iqret1
   ENDIF
CASE BAR()=4
   STORE 0 TO respuesta
   IF elicon(' - Ingreso Retenciones')<>0
      xcos=respuesta
      fisc='CON=XCOS'
      DO iqret1
   ENDIF
CASE BAR()=5
   STORE 0 TO respuesta
   IF eliccos(' - Ingreso Retenciones')<>0
      xcos=respuesta
      fisc='CCOS=XCOS'
      DO iqret1
   ENDIF
CASE BAR()=6
   STORE 0 TO respuesta
   IF eliesp(' - Ingreso Retenciones')<>0
      xcos=respuesta
      fisc='ESP=XCOS'
      DO iqret1
   ENDIF
ENDCASE
RETURN

*: EOF: IQRET.PRG
