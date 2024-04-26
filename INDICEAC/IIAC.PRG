********************************************************************************
*-- Programa: Iiac.PRG
*-- Fecha   : 06/12/91 12:44pm
*-- Version : R. 'EL BATA'
*-- Notas   : INGRESA indices
*-- Modificaci¢n GOYO
********************************************************************************
ulpr=hora_ulp(program())
if cheqseg()
   SELE iac
   STOR " Ingreso Indices - " TO me1
   STOR 25 TO COL
   stor nul TO kok
   =movewin(iiacr,iiacc,iiacr+iiacla+1,iiacc+iiacan,"win"," Ingreso Indices ")
   DO WHILE .T.
      rele indice
      sele iac
      SCAT TO INDICE BLAN
      ACTI WIND WIN
      =miac(.F.)
      if eliact("",1,COL)
         nada=mix.texto1
         indice(14)=left(mix.texto2,2)
         acti wind win
         @ 1,COL GET nada
         CLEAR GETS
         m.nada=indice(13)
         @ 2,COL GET m.nada PICT '9999' ;
           valid !yaestaba(indice(14)+str(m.nada,4),'IAC','actual');
           error 'CODIGO Y A¥O EXISTENTE';
           MESS me1+'[ENTER] para Men£'
         READ
         if last()#27
            indice(13)=m.nada
            =AR_GET(@INDICE,1,12,1,1,3,col,'99999999.999')
            READ
            IF LAST()#27 .AND. !EMPTY(indice(13)) .AND. !EMPTY(indice(14))
               =men_lin(grabando)
               =agrabar("IAC",@indice,.t.)
               =iaud(indice[14]+str(indice[13],4))
            ELSE
               EXIT
            ENDIF
         else
         exit
         endif
      ELSE
         EXIT
      ENDIF
   ENDDO
   =RELEWIN('win')
ELSE
   =iaudI()
ENDIF
RETURN men_lin(botom)
