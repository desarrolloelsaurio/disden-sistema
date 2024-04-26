*:*********************************************************************
*:
*:        Program: LLADI.PRG
*:
*:         System: SUELDOS Y JORNALES
*:         Author: GREGORIO REINER
*:      Copyright (c) 1991, GOYO REINER
*:  Last modified: 04/20/91      0:00
*:
*:      Called by: ADI.PRG                       
*:
*:          Calls: MADI.PRG
*:
*:      Documented 04/23/91 at 20:51               FoxDoc  version 2.01
*:*********************************************************************
********************************************************************************
*-- Programa: LLADI.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : RECUPERA ADICIONALES
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
DO madi WITH 'Recupera'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 19,1 SAY 'Est  Seguro de Recuperar ? '
@ 19,29 GET sigue
READ
IF sigue='SI'
   RECALL RECO ff
ENDIF
RELE WIND win
RELE respu,formqui,formmes,es,filtro,fq
RELE ALL LIKE adi* EXCEPT adipop
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LLADI.PRG
