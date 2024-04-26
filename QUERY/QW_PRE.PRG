FUNCTION QW_PRE
EXTERNAL ARRAY HABILITADO
   i=iif(filpre=2,8,iif(filpre=1,4,nul))
TTPRE=iif(filpre=2,'Porcentajes de Utilidad',iif(filpre=1,'Precios','Lista Mixta'))
   if !empty(i)
      for xx=i to i+3
         store .f. to HABILITADO[xx]
      endf
   endif
RETURN .T.