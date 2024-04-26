*:*********************************************************************
*:
*:        Program: GQSAL1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: GQSAL.PRG                     
*:
*:          Calls: ELISAL()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:09               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: GQSAL1.PRG
*-- Fecha   : 11/12/90 03:55pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA SALcionales
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF elisal(' a Generalizar')<>0
   GOTO respuesta
   @ 24,0 SAY PADC('Generalizando Salario Familiar',80,'*') COLO SCHE 19
   ulpr=PROGRAM()
   tiho=RECNO()
   SELE emp
   SCAN FOR &fisc
      SELE liq
      APPE BLAN
      REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 40,archivo WITH 'SAL',registro WITH tiho,unidad WITH 1
      REPL fechaven WITH sal->salvenc,INFORMA WITH .F.,cencos WITH emp->ccos,empleado WITH RECNO("EMP")
      SELE emp
   ENDSCAN
ENDIF
RELE tiho
RETURN

*: EOF: GQSAL1.PRG
