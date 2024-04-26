*:*********************************************************************
*:
*:        Program: ICDG.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: SUELDOS.PRG
*:
*:      Documented 04/23/91 at 20:44               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: ICDG.PRG
*-- Fecha   : 01/19/91 02:37am
*-- Version : G. REINER
*-- Notas   : INGRESA
********************************************************************************
@ 0,34 SAY TIME() COLOR I
DEFI WIND win FROM 0,0 TO 24,79 COLOR SCHE 23
@ 1,1 TO 23,78 '' COLOR SCHE 16
@ 2,2 TO 22,77 '' COLOR SCHE 15
@ 3,3 TO 21,76 '' COLOR SCHE 17
@ 4,4 TO 20,75 '' COLOR SCHE 14
@ 5,5 TO 19,74 '' COLOR SCHE 15
@ 6,6 TO 18,73 '~' COLOR SCHE 17
@ 8,0 SAY PADC('CODIGO DE INGRESO',80,'-') COLOR I
nada=SPACE(20)
@ 12,30 GET nada COLOR SCHE 24
READ
nada=ALLTRIM(nada)
cok=3
IF nada=chr(79)+chr(82)+chr(84)+chr(69)+chr(78)+chr(67)+chr(73)+chr(65)
   juligan='SI'
ENDIF
CLEA
RELE WIND win
RELE nada
@ 24,0 SAY SPACE(80)
RETURN
