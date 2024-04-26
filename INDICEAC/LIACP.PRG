********************************************************************************
*-- Programa: Ciac.PRG
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : CORRIGE indices
********************************************************************************
ulpr=hora_ulp(program())
STOR RECNO() TO ff
if cheqseg()
   SELE iac
   STOR " Consulta Indices - " TO me1
   STOR 25 TO COL
   stor nul TO kok
   =movewin(iiacr,iiacc,iiacr+iiacla+1,iiacc+iiacan,"win"," Consulta Indices ")
   SCAT TO INDICE 
   ACTI WIND WIN
   =miac(.t.)
   =inkey(nul,"HM")
   =RELEWIN('win')
ELSE
   =iaudI()
ENDIF
RETURN men_lin(botom)
