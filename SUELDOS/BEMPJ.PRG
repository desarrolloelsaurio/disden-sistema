*:*********************************************************************
*:
*:        Program: BEMPJ.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: EMPJ.PRG                      
*:
*:          Calls: ELIEMP()       (function  in PROCESOS.PRG)
*:
*:      Documented 04/23/91 at 20:54               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: BEMPJ.PRG
*-- Fecha   : 12/12/90 07:13pm
*-- Version : G. REINER
*-- Notas   : BORRA LEGAJO DE EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF eliemp(" para Borrar Legajo ")<>0
   GOTO respuesta
   ACTI SCRE
   @ 24,0 SAY PADC('[ESC] para Grabar',80,' ')
   DEFI WIND win FROM 4,4 TO 13,50 DOUBLE TITLE ' Datos del Empleado ' SHAD COLOR SCHE 8
   ACTI WIND win
   @ 1,1 SAY 'Empleado' COLOR SCHE 3
   @ 1,20 GET emp->apynom PICTURE 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
   GOTO emp->cat IN cat
   @ 2,1 SAY "Categor¡a" COLOR SCHE 3
   @ 2,12 GET cat->categoria PICTURE 'XXXXXXXXXXXXXXXXXXXX'
   GOTO emp->con IN con
   @ 3,1 SAY "Convenio" COLOR SCHE 3
   @ 3,12 GET con->convenio PICTURE 'XXXXXXXXXXXXXXXXXXXX'
   GOTO emp->jan IN jan
   @ 4,1 SAY "Empresa" COLOR SCHE 3
   @ 4,12 GET jan->empresa PICTURE 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
   CLEAR GETS
   sgr="NO"
   @ 6,1 SAY 'Est  seguro de Borrar ? ' GET sgr
   READ
   IF sgr='SI'
      REPL texto WITH ""
   ENDIF
   RELE WIND win
ENDIF
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: BEMPJ.PRG
