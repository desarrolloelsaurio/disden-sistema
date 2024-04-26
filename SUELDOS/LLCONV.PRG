*:*********************************************************************
*:
*:        Program: LLCONV.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CONV.PRG                      
*:
*:          Calls: MCONV.PRG
*:
*:      Documented 04/23/91 at 20:49               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLCONV.PRG
*-- Fecha   : 10/26/90 / 19:30:43
*-- Version : G. REINER - GENERADOR
*-- Notas   : RECUPERA CONVENIOS
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
STORE 'NO' TO sigue
DO mconv WITH 'Recupera'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
@ 7,1 SAY 'Est  Seguro de Recuperar ? '
@ 7,25 GET sigue
READ
IF sigue='SI'
   RECALL RECO ff
ENDIF
RELE WIND win
RELE convenio,pornoct,maxdias,maxhoras,basconf,me1,xasconf,ff,sigue
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LLCONV.PRG
