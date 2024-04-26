*:*********************************************************************
*:
*:        Program: LLCCOS.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: CCOS.PRG                      
*:
*:          Calls: MCCOS.PRG
*:
*:      Documented 04/23/91 at 20:48               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLCCOS.PRG
*-- Fecha   : 10/26/90 05:53pm
*-- Version : G. REINER
*-- Notas   : LLAMA CENTRO DE COSTOS
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
DO mccos WITH 'Recupera'
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
ulpr=PROGRAM()
borra='NO'
@ 5,1 SAY 'Est  Seguro de Llamar ? ' COLOR SCHE 3
@ 5,26 GET borra
READ
IF borra="SI"
   RECALL RECO ff
ENDIF
RELE WIND win
RELE cencos,idcencos,empresa,me1,ff,sigue,nada,borra,caca
@ 24,0 SAY SPACE(80)
RETURN

*: EOF: LLCCOS.PRG
