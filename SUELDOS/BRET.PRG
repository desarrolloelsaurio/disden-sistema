*:*********************************************************************
*:
*:        Program: BRET.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: RET.PRG                       
*:
*:          Calls: MRET.PRG
*:
*:      Documented 04/23/91 at 20:52               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: BRET.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : BORRA RETENCIONES
********************************************************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*') COLO SCHE 19
ulpr=PROGRAM()
DO mret WITH 'Borra'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 16,1 SAY 'Est  Seguro de Borrar ? '
@ 16,25 GET sigue
READ
IF sigue='SI'
   DELE RECO ff
ENDIF
RELE WIND win
RELE respu,formqui,formmes,es,filtro,fq,fm
RELE ALL LIKE ret* EXCEPT ret
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: BRET.PRG
