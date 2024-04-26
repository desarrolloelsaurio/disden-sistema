function qw_pag3
parameter ren,col,cual
private ren,col,cual
if filpag=2
   store nul to respuesta
   if !empty(elipag("a Listar",ren,col))
      ttpag='Cond. de Pago: '+alltrim(mix.texto1)
      store cual+;
      'CONDPAGO1="'+left(mix.texto2,2)+'"'+;
      ' .OR. '+;
      cual+;
      'CONDPAGO2="'+left(mix.texto2,2)+'"'+;
      ' .OR. '+;
      cual+;
      'CONDPAGO3="'+left(mix.texto2,2)+'"' ;
      to quepag
      @ ren,col say alltrim(STRTRAn(TRANS(mix.texto1,'@R 999-999-999-999-999-999'),'-000','    ') )
   ELSE
      STORE 1 TO FILPAG
   endif
endif
return FILPAG=1
