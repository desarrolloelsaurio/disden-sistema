********************************************************************************
*-- Programa: LLRET.PRG
*-- Fecha   : 10/27/90 11:07am
*-- Version : G. REINER
*-- Notas   : RECUPERA RETENCIONES
********************************************************************************
ff=RECNO()
ulpr=PROGRAM()
@ 0,34 SAY TIME() COLOR I
@ 0,46 SAY PADC(PROGRAM(),10) COLOR I
@ 24,0 SAY PADC('Cuidado con lo que hace !',80,'*')
DO mret WITH 'Recupera'
ulpr=PROGRAM()
ACTI SCRE
@ 0,46 SAY PADC(PROGRAM(),10) COLOR I
ACTI WIND win
sigue='NO'
@ wrow()-2,1 SAY 'Est  Seguro de Recuperar ? '
@ wrow()-2,29 GET sigue
READ
IF sigue='SI'
   RECALL RECO ff
ENDIF
RELE WIND win
RELE respu,formqui,formmes,es,filtro,fq,fm
RELE ALL LIKE ret* EXCEPT retpop
@ 24,0 SAY SPACE(80)
RETURN
*: EOF: LLRET.PRG
