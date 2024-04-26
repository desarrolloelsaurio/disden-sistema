*:*********************************************************************
*:
*:        Program: MVAR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLVAR.PRG      (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
*********************************************
*-- Programa: MVAR
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : MUESTRA DATOS VARIABLES
*********************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SCATTER MEMVAR
DEFINE WINDOW win FROM 12,15 TO 19,55 DOUBLE TITL ' '+cosa+' Constantes ' SHAD COLO SCHE 8
me1=' '+cosa+' Constantes '
ACTI WINDOW win
@ 1,2 SAY "DEN. CONSTANTE" COLOR SCHE 3
@ 2,2 SAY "CONTENIDO" COLOR SCHE 3
@ 2,17 GET m->contenido PICTURE "XXXXXXXXXXXXXXXXXXXX" COLOR I
@ 1,17 GET m->nombre PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESSAGE me1+'- [ESC] para Men£'
CLEAR GETS
RETURN
*: EOF: MVAR.PRG
