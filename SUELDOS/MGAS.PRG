********************************************************************************
*-- Programa: MGAS.PRG
*-- Fecha   : 10/26/90 / 12:40:18
*-- Version : G. REINER - GENERADOR
*-- Notas   : MUESTRA TIPO DE ADELANTO
********************************************************************************
PARAMETER cosa
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DEFINE WINDOW win FROM 14,20 TO 19,62 TITL " "+cosa+" Tipo de Adelanto " SHAD COLO SCHE 8
me1=" "+cosa+" Tipo de Adelanto "
ACTI WIND win
SCATTER MEMVAR
@ 1,1 SAY "Tipo de Adelanto" COLOR SCHE 3
@ 2,1 SAY "EMPRESA" COLOR SCHE 3
GOTO m->empresa IN jan
caca=LEFT(jan->empresa,20)
@ 2,20 GET caca
@ 1,20 GET m->gasto;
   PICTURE "XXXXXXXXXXXXXXXXXXXX"
CLEAR GETS
RETURN
