PARAMETER LIN3
do RECUADRO
if !EMPTY(KREPORTE)
   @3,1 say "Reporte: "+KREPORTE
endif
@10,5 say "<A> Acumulado, <P> Periodico"
IF LIN3#4
   @11,5 say "Del mes"
ENDIF
IF LIN3>1
   @12,5 say "Nivel <1..8>"
   @13,5 say "<T> Todos, <R> Rango"
   IF LIN3>2
      @15,5 say "Comenzar en la Pagina"
   ENDIF
ELSE
   @12,5 say "<T> Todos, <R> Rango"
ENDIF
RETURN
