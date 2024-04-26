********************************************************************************
*-- Programa: LLSAL.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : RECUPERA SALARIO FAMILIAR
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
DO msal WITH 'Recupera'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10,' ') COLOR I
ACTI WIND win
sigue='NO'
@ 9,1 SAY 'Est  Seguro de Recuperar ? '
@ 9,29 GET sigue
READ
IF sigue='SI'
   RECALL RECO ff
ENDIF
RELE WIND win
RELE salario,salmonto,salper,salmes,salqui,salvenc,salreset,me1,ff,sigue
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LLSAL.PRG
