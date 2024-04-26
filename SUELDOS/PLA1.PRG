********************************************************************************
*-- Programa: pnov.prg
*-- Fecha   : 01/15/91 09:02pm
*-- Version : G. REINER
*-- Notas   : deriva a impresion de planillas de ingreso de novedades
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
DO CASE
CASE bar()=1
	do lplai1
case bar()=2
   DO GPLA
case bar()=3
	do gpla1
endcase
RETURN
