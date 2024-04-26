*:*********************************************************************
*:
*:        Program: MESP.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLESP.PRG      (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
*********************************************
*-- Programa: MESP.PRG
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : MUESTRA ESPECIALIDAD
*********************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 10,20 TO 16,60 DOUBLE TITL ' '+cosa+' Especialidades ' SHAD COLO SCHE 8
me1=' '+cosa+' Especialidades '
ACTI WINDOW win
@ 1,2 SAY "ESPECIALIDAD" COLOR SCHE 3
SCATTER MEMVAR
@ 1,17 GET m->especiali PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+'- [ESC] para Men£'
CLEAR GETS
RETURN
*: EOF: MESP.PRG
