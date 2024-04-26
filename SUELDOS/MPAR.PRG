*:*********************************************************************
*:
*:        Program: MPAR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLPAR.PRG      (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
*********************************************
*-- Programa: MPAR
*-- Fecha   : 24/07/90
*-- Version : G. REINER
*-- Notas   : MUESTRA PARENTESCO
*********************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
me1=' '+cosa+' PARENTESCOS '
DEFINE WINDOW win FROM 12,20 TO 18,60 DOUBLE TITL ' '+cosa+' Parentescos ' SHAD COLO SCHE 8
ACTI WINDOW win
@ 1,2 SAY "PARENTESCO" COLOR SCHE 3
SCATTER MEMVAR
@ 1,17 GET m->parentesco PICTURE "XXXXXXXXXXXXXXXXXXXX"
CLEAR GETS
RETURN
*: EOF: MPAR.PRG
