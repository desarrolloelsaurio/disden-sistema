function qw_pro
parameter ren,col,cual,paimp
private ren,col,cual
store 1 to proant
if filpro=2
   store nul to respuesta
   store '' to fisc,tt
   =progrl(paimp)
   if fisc#".F."
      quepro=fisc
      ttpro=ttQUE
      proant=filpro
      FILPRO=2
   else
      store 1 to filpro
   endif
endif
return proant#2
