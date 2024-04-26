********************************************************************************
*-- Programa: ELIREM.PRG
*-- Fecha   : 06/07/91 11:08am
*-- Version : E. BANALOTTI
*-- Notas   : ELIGE REMESA
********************************************************************************
function elirem
para merca,LABUSCA
store nul to nacan,respuesta
IF elipro('Seleccione Proveedor',-1,1))
   sele rem
   set order to tag remmer
   if seek(M.merca)
      scan while rem.merca=m.merca
         if rem.proveedor=pro.procod
            nacan=nacan+1
            decla arem[nacan],posre[nacan]
            arem(nacan)=STR(rem.remesa)
            posre(nacan)=recno()
         endif
      endscan
      if !empty(nacan)
       @ 5,50 MENU arem,nacan ;
       TITLE "Remesas"
       read menu to OPCION
       if opcion # 0
         OPCION=posre(OPCION)
         IF LABUSCA
            GO OPCION
         ENDIF
         STORE .t. TO RESPUESTA
       endif
      ELSE
         IF LABUSCA
         STORE .F. TO RESPUESTA
         ENDIF
      endif
   endif
endif
return respuesta
