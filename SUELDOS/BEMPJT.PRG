*:*********************************************************************
*:
*:        Program: BEMPJT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPJ.PRG                      
*:
*:          Calls: OPJAN          (procedure in PROCESOS.PRG)
*:               : ELIJAN         (procedure in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: BEMPJT.PRG
*-- Fecha   : 01/22/91 11:28am
*-- Version : G. REINER
*-- Notas   : BORRA EL LEGAJO DE TODOS LOS EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO opjan
IF jannro=0
   DO elijan
ENDIF
IF jannro<>0
   STORE 'NO' TO respuesta
   @ 24,0 SAY PADC(' Borra Legajo de Empleados de '+ALLTRIM(m->janname),80,'*') COLOR SCHE 19
   DEFINE WINDOW win FROM 10,0 TO 14,77 DOUBLE TITL ' Borra Legajos ' SHAD COLOR SCHE 8
   ACTI WINDOW win
   @ 1,1 SAY "Borra "
   @ 1,7 SAY "TODOS" COLOR SCHE 19
   @ 1,12 SAY " los legajos de la empresa "+ALLTRIM(m->janname)+" ? " GET respuesta
   READ
   RELE WIND win
   IF respuesta="SI"
      SELE emp
      @ 24,0 SAY PADC(' Borrando Legajos ',80,'*') COLO SCHE 19
      REPL ALL texto WITH "" FOR jan=m->jannro
   ENDIF
ENDIF
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: BEMPJT.PRG
