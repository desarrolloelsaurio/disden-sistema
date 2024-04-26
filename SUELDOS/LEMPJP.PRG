*:*********************************************************************
*:
*:        Program: LEMPJP.PRG
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
*-- Programa: LEMPJP.PRG
*-- Fecha   : 12/12/90 06:51pm
*-- Version : G. REINER
*-- Notas   : MUESTRA LEGAJO DE EMPLEADOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
IF eliemp(" para Ingresar / Corregir Legajo ")<>0
   GOTO respuesta
   ACTI SCRE
   @ 24,0 SAY PADC('[ESC] para Final',80,' ')
   DEFI WIND win FROM 3,4 TO 10,50 DOUBLE TITLE ' Datos del Empleado ' SHAD COLO SCHE 8
   DEFI WIND win1 FROM 9,6 TO 21,77 DOUBLE TITLE ' Legajo de '+ALLTRIM(emp->apynom)+" " SHAD COLO SCHE 8
   ACTI WIND win
   @ 1,1 SAY 'Empleado' COLOR SCHE 3
   @ 1,12 GET emp->apynom PICTURE 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
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
   MODI MEMO texto NOEDIT WINDOW win1
   DEAC WIND ALL
   RELE WIND win,win1
ENDIF
RETURN

*: EOF: LEMPJP.PRG
