*:*********************************************************************
*:
*:        Program: GHOR1.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: GHOR.PRG                      
*:
*:          Calls: ELITHOR()      (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 21:03               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: GHOR1.PRG
*-- Fecha   : 11/12/90 03:55pm
*-- Version : G. REINER
*-- Notas   : GENERALIZA HORAS TRABAJADAS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 10,0 TO 14,79
IF elithor(' a Generalizar')<>0
   GOTO respuesta
   @ 24,0 SAY PADC('Generalizando Horas Trabajadas',80,'*')
   DEFINE WINDOW win FROM 10,0 TO 14,77 TITL " Cantidad de "+ALLTRIM(hortipohor)+' a Generalizar' SHAD COLOR SCHE 8
   ACTI WIND win
   cantidad=0
   @ 1,10 SAY 'Cantidad de Horas ' GET cantidad PICTURE '999.99'
   READ
   IF cantidad>0
      nada=CTOD('31/12/99')
      ulpr=PROGRAM()
      tiho=RECNO()
      SELE emp
      SCAN FOR &fisc
         SELE liq
         APPE BLAN
         REPL empresa WITH emp->jan,legajo WITH emp->legajo,filtcon WITH 10,archivo WITH 'THOR',registro WITH tiho,unidad WITH cantidad
         REPL fechaven WITH IIF(thor->horreset='SI',DATE(),nada),INFORMA WITH thor->horinfo='SI',cencos WITH emp->ccos,empleado WITH RECNO("EMP")
         SELE emp
      ENDSCAN
   ENDIF
ENDIF
RELE tiho,cantidad,nada
RELE WIND win
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: GHOR1.PRG
