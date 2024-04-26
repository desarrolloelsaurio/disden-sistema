*:*********************************************************************
*:
*:        Program: BTHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: THOR.PRG                      
*:
*:          Calls: MTHOR.PRG
*:
*:      Documented 04/23/91 at 20:51               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: Bthor.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : BORRA tipo de hora
********************************************************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*') COLO SCHE 19
ulpr=PROGRAM()
DO mthor WITH 'Borra'
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
ulpr=PROGRAM()
sigue='NO'
@ 19,1 SAY 'Est  Seguro de Borrar ? '
@ 19,25 GET sigue
READ
IF sigue='SI'
   GOTO ff
   SELE VAR
   v1='m->'+ALLTRIM(UPPER(thor->horvarhs))
   SET ORDER TO 2
   SEEK v1
   IF FOUND()
      DELE RECO RECNO()
   ENDIF
   v1='m->'+ALLTRIM(UPPER(thor->horvarmon))
   SEEK v1
   IF FOUND()
      DELE RECO RECNO()
   ENDIF
   SET ORDER TO 1
   SELE thor
   DELE RECO ff
ENDIF
RELE WIND win
RELE ALL LIKE hor*
RELE me1,ff,sigue,v1
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: BTHOR.PRG
