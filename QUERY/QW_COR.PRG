function qw_COR
parameter ren,col,cual
private ren,col,cual
store NUL to CORfin,CORini
if filCOR=2
   if ELICO1()
      IF CORINI=CORFIN
         store cual+"="+ALLTRIM(STR(M.CORINI)) to queCOR      
      ELSE
         store cual+"<="+ALLTRIM(STR(M.CORFIN))+" .and. "+cual+">="+ALLTRIM(STR(M.CORINI)) to queCOR
      ENDIF
      ttCOR='Ordenes de '+korte+' entre N§ '+alltrim(str(m.CORINI))+' y '+alltrim(str(m.CORFIN))
      @ ren,col say padr(alltrim(str(m.CORINI))+' y '+alltrim(str(m.CORFIN)),20)
   else
      filCOR=1
   endif
endif
return FILCOR#2 .OR. (FILCOR=2 .AND. CORINI#CORFIN)
