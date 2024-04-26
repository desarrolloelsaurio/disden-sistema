*:*********************************************************************
*:
*:        Program: GSAC1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: AGUINA.PRG
*:
*:          Calls: ELIADI()       (function  in ?)
*:
*:      Documented 04/25/91 at 10:19               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: gsac1.prg
*-- Fecha   : 02/12/91 01:06pm
*-- Version : g. reiner
*-- Notas   : genera registro de aguinaldo promedio
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE BAR()=1
   STORE 0 TO respuesta
   IF eliTHOR(" del S.A.C. ")<>0
      GOTO respuesta
      SELE liq
      @ 24,0 SAY PADC(" Borrando Registros Existentes ",80) COLO SCHE 19
      DELE ALL FOR filtcon=10 .AND. registro=respuesta
      @ 24,0 SAY PADC(" Compactando el Archivo de Liquidaci¢n ",80) COLO SCHE 19
      PACK
      SELE emp
      SCAN FOR periodos<>0
         GOTO emp->cat IN cat
         SELE liq
         APPE BLAN
         REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 10,archivo WITH 'THOR',registro WITH respuesta,unidad WITH 1,fechaven WITH DATE(),INFORMA WITH .F.
         REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
         REPL valor1 WITH emp->mejorsuel/IIF(cat->periodo='M',12,12)
         SELE emp
      ENDSCAN
   ENDIF
CASE BAR()=2
   STORE 0 TO respuesta
   IF eliTHOR(" del S.A.C. ")<>0
      GOTO respuesta
      SELE liq
      @ 24,0 SAY PADC(" Borrando Registros Existentes ",80) COLO SCHE 19
      GOTO TOP
      DO WHILE filtcon<>10 .OR. registro<>respuesta
         SKIP
      ENDDO
      IF .NOT. EOF()
         SELE emp
         GOTO emp->cat IN cat
         SELE liq
         APPE BLAN
         REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 10,archivo WITH 'THOR',registro WITH respuesta,unidad WITH 1,fechaven WITH DATE(),INFORMA WITH .F.
         REPL cencos WITH emp->ccos,empleado WITH RECNO("EMP")
         REPL valor1 WITH emp->mejorsuel/IIF(cat->periodo='M',12,12)
      ENDIF
   ENDIF
ENDCASE
@ 24,0 SAY SPACE(80)
ulpr=PROGRAM()
RETURN
*: EOF: GSAC1.PRG
