********************************************************************************
*-- Programa: LPREP.PRG
*-- Fecha   : 08/26/91 11:18am
*-- Version : G. REINER
*-- Notas   : DERIVA A lista de precios
*-- Modificaci¢n GOYO 07-02-92 12:12pm
*-- VERSION NOVOGAR
********************************************************************************
FUNCTION QW_PRENO
store .t. to habilitado
STORE .F. TO habilitado[13]
i=iif(filpre=2,9,iif(filpre=1,5,nul))
TTPRE=iif(filpre=2,'Porcentajes de Utilidad',iif(filpre=1,'Precios','Lista Mixta'))
if !empty(i)
   for xx=i to i+3
      store .f. to HABILITADO[xx]
   endf
endif
if filpre=3
   if !empty(lprei2())
      texto[cant_max,1]=alltrim(nom_lista)
      store .T. to habilitado[cant_max]
   else
      store .t. to habilitado
      store .f. to habilitado[cant_max]
   endif
endif
RETURN .T.
