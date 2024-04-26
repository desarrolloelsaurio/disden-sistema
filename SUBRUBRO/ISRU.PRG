********************************************************************************
*-- Programa: ISRU.PRG
*-- Fecha   : 11-19-91 05:32pm
*-- Version : G. REINER
*-- Notas   : INGRESA SUB-RUBROS
*-- Modificaci¢n GOYO 08-13-92 02:01pm
********************************************************************************
SELE seg
stor HORA_ULP(PROGRAM()) TO ulpr
SEEK ulpr
IF CHEQSEG()
   =MOVEWIN(iRUBr,iRUBc,iRUBr+iRUBla+1,iRUBc+iRUBan+10,'WIN'," Ingreso Sub-Rubros ")
   SELE RUB
   STOR " Ingreso Sub-Rubros - " TO me1
   STOR 25 TO COL
   DO WHILE .T.
      SCAT MEMV BLAN
      DO mSRU WITH .F.
      stor nul to respuesta
      IF !EMPTY(ELIRUB("del Sub-Rubro",1,col))
         ELRUB=RUB.RUBRO
         NADA=ALLTRIM(ELRUB)+'-'+ZERO(RUB.CODRUB,3)
         M.CODRUB=RUB.CODRUB
         @ 1,COL GET NADA
         CLEA GETS
         @ 2,COL GET M.RUBRO PICT "@!" ;
           MESS me1+'Denominaci¢n del Sub-Rubro - [ESC] para Anular'
         READ
         if lastkey()#27 .AND. !EMPTY(M.RUBRO)
            @ 3,col get M.codsrub pIct '@z 999' ;
              VALID !YAESTABA(STR(M.CODRUB)+STR(M.CODSRUB),'RUB','TODOS') ;
              ERROR "Subrubro Existente" ;
              mess me1+'C¢digo del Sub-Rubro'
            READ
            if last()#27 .and. !empty(m.codsrub)
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
               IF ESOK
                  m.palistar=m.elrub+m.rubro
                  =agrabar("rub")
               ENDIF
            endif
         else
            exit
         ENDIF
      ELSE
         EXIT
      ENDIF
   ENDDO
   =RELEWIN("win")
else
   =iAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
