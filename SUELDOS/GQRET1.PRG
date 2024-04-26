*:*********************************************************************
*:
*:        Program: GQRET1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: GQRET.PRG                     
*:
*:          Calls: ELIRET()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: GQRET1.PRG
*-- Fecha   : 11/12/90 03:55pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA RETENCIONES
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF eliret('a Generalizar')<>0
   GOTO respuesta
   @ 24,0 SAY PADC('Generalizando Retenciones',80,'*') COLOR SCHE 19
   ulpr=PROGRAM()
   tiho=RECNO()
   SELE emp
   SCAN FOR &fisc
      SELE liq
      APPE BLAN
      REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 30,archivo WITH 'RET',registro WITH tiho,unidad WITH 0
      REPL fechaven WITH ret->retvenc,INFORMA WITH .F.,cencos WITH emp->ccos,empleado WITH RECNO("EMP")
      SELE emp
   ENDSCAN
ENDIF
RELE tiho
RETURN

*: EOF: GQRET1.PRG
