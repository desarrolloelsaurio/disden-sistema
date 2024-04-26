********************************************************************************
*-- Programa: LINGr.PRG
*-- Fecha   : 01-27-92 07:39pm
*-- Version : G. REINER
*-- Notas   : LISTADO DE INGRESOS DE CAJA
********************************************************************************
ulpr=PROGRAM()
quemon=bar()
DO CASE
CASE BAR()=1
   elmon=''
   =FLINGR()
case bar()=2
   elmon='moneda=left(xaus,1)'
	 =FLINGR()
CASE BAR()=3
   elmon='moneda=left(xadol,1)'
	 =FLINGR()
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
FUNCTION FLINGR
if quecli=3
	 do lingpc1
else
   if quefec=3
      do lingpf1
   else
      do lingp1
   endif
endif
RETURN .T.
