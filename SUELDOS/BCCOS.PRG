********************************************************************************
*-- Programa: BCCOS.PRG
*-- Fecha   : 10/26/90 05:53pm
*-- Version : G. REINER
*-- Notas   : BORRA CENTRO DE COSTOS
********************************************************************************
ff=RECNO()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*') COLO SCHE 19
DO mccos WITH 'Borra'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
borra='NO'
@ 5,1 SAY 'Est  Seguro de Borrar ? ' COLOR SCHE 3
@ 5,26 GET borra
READ
IF borra="SI"
   GOTO ff
   DELE RECO ff
ENDIF
RELE WIND win
RELE cencos,idcencos,empresa,me1,ff,sigue,nada,borra,caca
@ 24,0 SAY SPACE(80)
RETURN
