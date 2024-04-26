*:*********************************************************************
*:
*:        Program: QRED.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPQ.PRG                      
*:
*:          Calls: ELIEMP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:53               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: QRED.PRG
*-- Fecha   : 11/12/90 06:59pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE INGRESO DE
*             REGISTRO DE REDONDEO
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC(" Generando Registro de Redondeo ",80,'*') COLOR SCHE 19
DO CASE
CASE BAR()=1
   SELE liq
   DELE FOR archivo='XXX'
   SELE emp
   SCAN
      SELE liq
      APPE BLAN
      REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 50,archivo WITH 'XXX',registro WITH 1,unidad WITH 0
      REPL fechaven WITH DATE(),INFORMA WITH .F.,cencos WITH emp->ccos,empleado WITH RECNO("EMP")
      SELE emp
   ENDSCAN
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliemp(" a Generar Registro de Redondeo")<>0
      GOTO respuesta
      @ 24,0 SAY PADC(" Generando Registro de Redondeo ",80,'*') COLOR SCHE 19
      SELE liq
      LOCATE FOR archivo='XXX' .AND. (legajo=emp->legajo .OR. empleado=RECNO("EMP"))
      IF FOUND()
         APPE BLAN
      ENDIF
      REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 50,archivo WITH 'XXX',registro WITH 1,unidad WITH 0
      REPL fechaven WITH DATE(),INFORMA WITH .F.,cencos WITH emp->ccos,empleado WITH RECNO("EMP")
   ENDIF
ENDCASE
@ 24,0 SAY PADC("  ",80,' ')
RETURN

*: EOF: QRED.PRG
