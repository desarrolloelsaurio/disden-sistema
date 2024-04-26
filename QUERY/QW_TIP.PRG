function qw_TIP
parameter ren,col,cual
private ren,col,cual
STORE NUL TO tip_salida
if filTIP=2
   STORE "" TO TT,FISC
   QWSALIDA=QWTIP(MIXGRL("Tipos de Unidad","Tipo de Unidad","Tipos de Unidad",.t.),cual)
   IF QWSALIDA#".F."
   QW=AT("ú",QWSALIDA)
   QUETIP=LEFT(QWSALIDA,QW-1)
   TTTIP=SUBSTR(QWSALIDA,QW+1)
   ELSE
      store 1 to filTIP
   endif
endif
return tip_salida#2
