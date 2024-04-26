*:*********************************************************************
*:
*:        Program: MCCOS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLCCOS.PRG     (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: MCCOS.PRG
*-- Fecha   : 25/10/90 /  0:10:20
*-- Version : G. REINER - GENERADOR
*-- Notas   : MUESTRA CENTROS DE COSTOS
********************************************************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 7,15 TO 15,57 TITL " "+cosa+" Centro de Costos " SHAD COLO SCHE 8
me1=" "+cosa+" Centro de Costos "
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "CENTRO DE COSTOS" COLOR SCHE 3
@ 2,1 SAY "IDENTIFICACION" COLOR SCHE 3
@ 2,20 GET m->idcencos
@ 3,1 SAY "EMPRESA" COLOR SCHE 3
GOTO m->empresa IN jan
@ 3,20 GET jan->empresa
@ 1,20 GET m->cencos;
   PICTURE "XXXXXXXXXXXXXXXXXXX";
   MESS me1+"- [ESC] para Men£"
CLEAR GETS
RETURN
*: EOF: MCCOS.PRG
