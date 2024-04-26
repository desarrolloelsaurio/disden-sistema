********************************************************************************
*-- Programa: biac.PRG
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : BORRA indices
********************************************************************************
ulpr=hora_ulp(program())
STOR RECNO() TO ff
if cheqseg()
   SELE iac
   =lock() .or. lok("IAC")
   STOR " Borra Indices - " TO me1
   STOR 25 TO COL
   stor nul TO kok
   =movewin(iiacr,iiacc,iiacr+iiacla+1,iiacc+iiacan,"win"," Borra Indices ")
   SCAT TO INDICE 
   ACTI WIND WIN
   =miac(.t.)
   IF confirma("Borrar los Indices",.T.,12,nul)
      SELE iac
      DELE RECO ff
      =repuse()
      =iaud(indice[14]+str(indice[13],4))
   ENDIF
   =RELEWIN('win')
ELSE
   =iaudI()
ENDIF
RETURN men_lin(botom)
