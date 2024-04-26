*:*********************************************************************
*:
*:        Program: MCONV.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLCONV.PRG     (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: MCONV.PRG
*-- Fecha   : 10/26/90 / 19:30:43
*-- Version : G. REINER - GENERADOR
*-- Notas   : MUESTRA CONVENIOS
********************************************************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 10,15 TO 20,70 TITL " "+cosa+" Convenio " SHAD COLO SCHE 8
me1=" "+cosa+" Convenio "
sigue='NO'
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "CONVENIO" COLOR SCHE 3
@ 2,1 SAY "PORC. AUMENTO Hs. NOCTURNAS" COLOR SCHE 3
@ 2,33 GET m->pornoct;
   PICTURE "999999"
@ 3,1 SAY "Cant. D¡as en el Mes" COLOR SCHE 3
@ 3,33 GET m->maxdias;
   PICTURE "999.99"
@ 4,1 SAY "Cant. Horas en el Mes" COLOR SCHE 3
@ 4,33 GET m->maxhoras;
   PICTURE "999999"
@ 5,1 SAY "Calcula s/B sico Conformado ?" COLOR SCHE 3
xasconf=IIF(basconf,'SI','NO')
@ 5,33 GET xasconf
@ 1,33 GET m->convenio;
   PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+"- [ESC] para Men£"
CLEAR GETS
RETURN
*: EOF: MCONV.PRG
