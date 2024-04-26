********************************************************************************
*-- Programa: BADI.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : BORRA ADICIONALES
********************************************************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*') COLO SCHE 19
ulpr=PROGRAM()
DO madi WITH 'Borra'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 19,1 SAY 'Est  Seguro de Borrar ? '
@ 19,25 GET sigue
READ
IF sigue='SI'
   DELE RECO ff
ENDIF
RELE WIND win
RELE respu,formqui,formmes,es,filtro,fq
RELE ALL LIKE adi* EXCEPT adipop
@ 24,0 SAY SPACE(80)
RETURN
