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
   =FLINGK()
case bar()=2
   elmon='moneda=left(xaus,1)'
   =FLINGK()
CASE BAR()=3
   elmon='moneda=left(xadol,1)'
   =FLINGK()
ENDCASE
ulpr=PROGRAM()
=men_lin(botom)
RETURN
FUNCTION FLINGK
if quecli=3
   do lingic1
else
   if quefec=3
      do lingif1
   else
      do lingi1
   endif
endif
RETURN .T.
