*:*********************************************************************
*:
*:        Program: LLTHOR.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: THOR.PRG                      
*:
*:          Calls: MCAT.PRG
*:
*:      Documented 04/23/91 at 20:51               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLthor.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : RECUPERA tipo de hora
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
DO mthor WITH 'Recupera'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 19,1 SAY 'Est  Seguro de Recuperar ? '
@ 19,29 GET sigue
READ
IF sigue='SI'
   GOTO ff
   v1='m->'+ALLTRIM(UPPER(thor->horvarmon))
   SEEK v1
   IF FOUND()
      RECALL RECO RECNO()
   ENDIF
   v1='m->'+ALLTRIM(UPPER(thor->horvarhs))
   SEEK v1
   IF FOUND()
      RECALL RECO RECNO()
   ENDIF
   RECALL RECO ff
ENDIF
RELE WIND win
RELE ALL LIKE hor*
RELE me1,ff,sigue,v1
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: LLTHOR.PRG
