Function qw_TIP
parameter QWT_REN,QWT_COL,QWT_CUAL
private QWT_REN,QWT_COL,QWT_CUAL
STORE NUL TO tip_salida
if filTIP=2
   STORE "" TO TT,FISC
   QWSALIDA=QWTIP(MIXGRL("Tipos de Unidad","Tipo de Unidad","Tipos de Unidad",.t.),QWT_CUAL)
    IF QWSALIDA#".F."
      QW=AT(CHR(250),QWSALIDA)
      QUEUNI=LEFT(QWSALIDA,QW-1)
      TTUNI=SUBSTR(QWSALIDA,QW+1)
   ELSE
      store 1 to filUNI
   endif
endif
return TIP_salida#2
