*:*********************************************************************
*:
*:        Program: LLCAT.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CAT.PRG                       
*:
*:          Calls: MCAT.PRG
*:
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLCAT.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : RECUPERA CATEGORIA
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
DO mcat WITH 'Recupera'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 6,1 SAY 'Est  Seguro de Recuperar ? '
@ 6,29 GET sigue
READ
IF sigue='SI'
   RECALL RECO ff
ENDIF
RELE WIND win
RELE categoria,sueldo,periodo,me1,ff,sigue
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LLCAT.PRG
