********************************************************************************
*-- Programa: RLIQ2.PRG
*-- Fecha   : 02/01/91 09:10pm
*-- Version : G. REINER
*-- Notas   : RECALCULA SUELDLS Y JORNALES POR CENTRO DE COSTOS
********************************************************************************
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
SELE emp
SET ORDER TO 2
SCAN FOR ccos=RECNO("CCOS")
   @ 24,0 SAY PADC(" Buscando Empleados ",80,"*") COLO SCHE 19
   DO rliq1
   SELE emp
ENDSCAN
@ 24,0 SAY SPACE(80)
RETURN