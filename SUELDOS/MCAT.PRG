*:*********************************************************************
*:
*:        Program: MCAT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: LLCAT.PRG      (procedure in PROCESOS.PRG)
*:               : LLTHOR.PRG     (procedure in PROCESOS.PRG)
*:
*:      Documented 04/24/91 at 17:04               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: MCAT.PRG
*-- Fecha   : 10/26/90 /  0:12:04
*-- Version : G. REINER - GENERADOR
*-- Notas   : MUESTRA CATEGORIA CATEGORIAS
********************************************************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 7,20 TO 16,73 TITL " "+cosa+" Categor¡as " SHAD COLO SCHE 8
me1=" "+cosa+" Categor¡as "
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "CATEGORIA" COLOR SCHE 3
@ 2,1 SAY "SUELDO MENSUAL O JORNAL" COLOR SCHE 3
@ 3,1 SAY "PERIODO DE PAGO" COLOR SCHE 3
@ 4,1 SAY "CONVENIO" COLOR SCHE 3
@ 2,30 GET m->sueldo;
   PICTURE "99999999999.99"
m->periodo=IIF(m->periodo='M',"Mensual  ","Quincenal")
@ 3,30 GET m->periodo
@ 1,30 GET m->categoria;
   PICTURE "XXXXXXXXXXXXXXXXXXXX";
   MESS me1+"- [ESC] para Men£"
GOTO m->convenio IN con
@ 4,30 GET con->convenio
CLEAR GETS
RETURN
*: EOF: MCAT.PRG
