FUNCTION TALLECAN
=MOVEWIN(10,0,15,78,'FIC',' Stock para Fabricaci¢n '+mrcd+' ')
STORE NUL TO respuesta
@ 1,1 SAY "Cantidad a Fabricar ([ESC] Para Men£) " GET CAMUT PICTURE '999999';
   MESS "Cantidad de unidades de "+mrcd+" que se desean Fabricar"
@ 2,1 SAY "Talle                                 " GET ELTALLE PICT '99.99' ;
  DEFA 0 ;
  MESS 'Talle a Listar'
READ
=RELEWIN("fic")
RETURN LAST()#27 .and. camut>0 .and. eltalle>=xatalmin .and. eltalle<=xatalmax .and. empty(mod(eltalle,xatalstep))
