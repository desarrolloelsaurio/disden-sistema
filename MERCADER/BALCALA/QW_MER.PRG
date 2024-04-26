function qw_mer
parameter ren,col,cual
private ren,col,cual
if filmer=2
   store nul to respuesta
   do grl2 with ren-7,col,"Mercader¡a a Listar",.T.
   on sele popu NADA DO RESP1
   ACTI POPU NADA
   RELE POPU NADA
	 store '' to fisc,tt
	 FISC=qwmer(bar())
	 if fisc#".F."
   	    quemer=fisc
		ttmer=tt
     else
        store 1 to filmer
	 endif
else
   store 1 to filmer
endif
return FILmer=1
