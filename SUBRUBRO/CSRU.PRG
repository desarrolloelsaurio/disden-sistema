**********************************
*-- Programa: CSRU.PRG
*-- Fecha   : 11-20-91 04:10pm
*-- Version : G. REINER
*-- Notas   : CORRIGE SUB-RUBROS
**********************************
STOR RECNO() TO ff
registro=STR(ff)
SELE seg
stor HORA_ulp(PROGRAM()) TO ulpr
SEEK ulpr
ELRUB=''
IF CHEQSEG()
   =MOVEWIN(cRUBr,cRUBc,cRUBr+cRUBla+2,cRUBc+cRUBan+5,'WIN'," Correcci¢n Sub-Rubros ")
   SELE RUB
   =LOCK() .OR. lok("RUB")
   STOR " Correcci¢n Sub-Rubros - " TO me1
   STOR 21 TO COL
   STOR .F. TO kok,cambio
   STOR .T. TO sigue
   elrub=mSRU(.t.)
   scat memv
   ****************************************************
   @ 2,COL GET M.RUBRO PICT "@!" ;
     MESS me1+'Denominaci¢n del Sub-Rubro - [ESC] para Anular'
   READ
   if update()
      set order to tag codrub
      esok=.t.
      seek STR(m.codrub)
      set order to tag codSUB
      scan while rub.codrub=m.codrub
         if rub.rubro=m.rubro
            store .f. to esok
            =cartel2("LA COMBINACION","RUBRO "+ALLTRIM(M.ELRUB),"SUBRUBRO "+ALLTRIM(M.RUBRO),"EXISTE")
            EXIT
         endif
      endscan
      store esok to sigue,sigue,cambio
   endif
   if sigue
      if lastkey()#27 .AND. !EMPTY(M.RUBRO)
         @ 3,col get M.codsrub pIct '@z 999' ;
           VALID !YAESTABA(STR(M.CODRUB)+STR(M.CODSRUB),'RUB','TODOS',.f.,.t.) ;
           ERROR "Subrubro Existente" ;
           mess me1+'C¢digo del Sub-Rubro'
         READ
         cambio=iif(cambio,cambio,update())
         if last()#27 .and. !empty(m.codsrub) .and. cambio
            go ff
            m.palistar=elrub+m.rubro
            gath memv
            =repuse()
         endif
         =iaud(zero(m.codrub,3)+'-'+zero(m.codsrub,3)+'-'+m.rubro)
      endif
   endif
   UNLO IN RUB
   =relewin("win")
ELSE
   =iaudi()
ENDIF
RETURN men_lin(botom)
