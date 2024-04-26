function qw_RUB
#DEFINE NUL    0                                 && NUL
parameter ren,col,cual
private ren,col,cual
STORE NUL TO RUB_salida
if filRUB=2
   STORE "" TO TT,FISC
   QWSALIDA=QWRUB(MIXGRL("Seleccion de Rubros ","Rubro","Rubros",.t.),cual)
   IF QWSALIDA#".F."
      QW=AT("ú",QWSALIDA)
      QUERUB=LEFT(QWSALIDA,QW-1)
      TTRUB=SUBSTR(QWSALIDA,QW+1)
      @ REN,COL say LEFT(TTRUB,20)      
   ELSE
      store 1 to filRUB
   endif
endif
return RUB_salida#2
