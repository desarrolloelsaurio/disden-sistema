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
   STOR " Corrige Indices - " TO me1
   STOR 25 TO COL
   stor nul TO kok
   =movewin(iiacr,iiacc,iiacr+iiacla+1,iiacc+iiacan,"win"," Corrige Indices ")
   SCAT TO INDICE 
   ACTI WIND WIN
   =miac(.t.)
   =AR_GET(@INDICE,1,12,1,1,3,col,'99999999.999')
   READ
   IF LAST()#27 
      SELE iac
      GOTO ff
      =men_lin(grabando)
      gath from indice
      =repuse()
      =iaud(indice[14]+str(indice[13],4))
   ENDIF
   =RELEWIN('win')
ELSE
   =iaudI()
ENDIF
RETURN men_lin(botom)
