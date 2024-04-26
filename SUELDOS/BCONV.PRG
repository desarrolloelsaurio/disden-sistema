****************************************
*-- Programa: BCONV.PRG
*-- Fecha   : 10/26/90 / 19:30:43
*-- Version : G. REINER - GENERADOR
*-- Notas   : BORRA CONVENIOS CONVENIOS
****************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*') COLO SCHE 19
ulpr=PROGRAM()
DO mconv WITH "Borra"
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 7,1 SAY 'Est  Seguro de Borrar ? '
@ 7,25 GET sigue
READ
IF sigue='SI'
   DELE RECO ff
ENDIF
RELE WIND win
RELE convenio,pornoct,maxdias,maxhoras,basconf,me1,xasconf,ff,sigue
@ 24,0 SAY SPACE(80)
RETURN
