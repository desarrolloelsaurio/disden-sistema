********************************************************************************
*-- Programa: BGAS.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : BORRA TIPO DE ADELANTO
********************************************************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*') COLO SCHE 19
ulpr=PROGRAM()
DO mgas WITH 'Borra'
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
ulpr=PROGRAM()
sigue='NO'
@ 4,1 SAY 'Est  Seguro de Borrar ? '
@ 4,25 GET sigue
READ
IF sigue='SI'
   DELE RECO ff
ENDIF
RELE WIND win
RELE gasto,empresa,me1,ff,sigue,caca
@ 24,0 SAY SPACE(80)
RETURN
