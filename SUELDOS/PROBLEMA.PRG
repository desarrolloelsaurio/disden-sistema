*:*********************************************************************
*:
*:        Program: PROBLEMA.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LIQUID.PRG
*:
*:          Calls: ELIJAN.PRG
*:               : OPEMP          (procedure in PROCESOS.PRG)
*:               : OPLIQ          (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 19:52               FoxDoc  version 2.01
*:*********************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO elijan
IF jannro<>0
   DO opemp
   SET ORDER TO 2
   ff=recc()
   DO opliq
   dele for empleado<1 .or. empleado>ff
   @ 24,0 SAY PADC(" Tratando de solucionar el Problema ",80,"*") COLO SCHE 19
   SCAN
      SELE emp
      SEEK liq->legajo
      IF FOUND()
         SELE liq
         REPL empleado WITH RECNO('EMP')
      ELSE
         SELE liq
         DELE RECO RECNO()
      ENDIF
   ENDSCAN
ENDIF
do opthor
ff=recc()
@ 24,0 SAY PADC(" Verificando Integridad de la Base de Horas ",80,"*") COLO SCHE 19
sele liq
dele for filtcon=10 .and. (registro>ff .or. registro<1)
do opadi
ff=recc()
@ 24,0 SAY PADC(" Verificando Integridad de la Base de Adicionales ",80,"*") COLO SCHE 19
sele liq
dele for filtcon=20 .and. (registro>ff .or. registro<1)
do opret
ff=recc()
@ 24,0 SAY PADC(" Verificando Integridad de la Base de Retenciones ",80,"*") COLO SCHE 19
sele liq
dele for filtcon=30 .and. (registro>ff .or. registro<1)
do opsal
ff=recc()
@ 24,0 SAY PADC(" Verificando Integridad de la Base de Salario Familiar ",80,"*") COLO SCHE 19
sele liq
dele for filtcon=40 .and. (registro>ff .or. registro<1)
=OPGAS()
ff=recc()
@ 24,0 SAY PADC(" Verificando Integridad de la Base de Salario Familiar ",80,"*") COLO SCHE 19
sele liq
dele for filtcon>70 .and. (registro>ff .or. registro<1)
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: PROBLEMA.PRG
