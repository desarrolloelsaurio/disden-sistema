*
*-- Name....: FCDMASK.PRG
*-- Notes...: MASCARA FACTURA PROVEEDOR
*
CLEA
@ 1,45 to 3,79
@ 2,47 SAY "Consorcio: "
@ 2,57 SAY cns.consorcio
@ 1,3  SAY "Proveedor: "
@ 4,48 SAY "Nro FACTURA:"
@ 5,48 SAY "Fecha      :"
@ 5,60 SAY DTOC(DATE())
@ 4,0  SAY "Cond. Pago "+space(11)+":"
@ 5,0  SAY "Cotización del "+PADC(xadol,7)+":"
@ 6,0  SAY PADL("FACTURA EN "+PADC(xadols,4)+" O "+PADC(xauss,4),22)+":"
@ 6,48 SAY "Tipo Gasto :"
IF producto
**=CUADRO()
   A="┌"+REPL("─",13)+"┬"+REPL("─",30)+"┬"+REPL("─",5)+"┬"+REPL("─",12)+"┬"+REPL("─",14)+"┐"
   B="│"+SPACE(13)+"│"+SPACE(30)+"│"+SPACE(5)+"│"+SPACE(12)+"│"+SPACE(14)+"│"
   C="├"+REPL("─",13)+"┼"+REPL("─",30)+"┼"+REPL("─",5)+"┼"+REPL("─",12)+"┼"+REPL("─",14)+"┤"
   D="└"+REPL("─",13)+"┴"+REPL("─",30)+"┴"+REPL("─",5)+"┴"+REPL("─",12)+"┴"+REPL("─",14)+"┘"
   @ 7,0 SAY A
   @ 8,0 SAY B
   @ 9,0 SAY C
   FOR ren=10 TO 23
      @ ren,0 SAY B
   ENDF
   @ ren,0 SAY D
   @ 8,3 SAY "ARTICULO"
   @ 8,24 SAY "DESCRIPCION"
   @ 8,46 SAY "CANT."
   @ 8,53 SAY "COSTO UNIT."
   @ 8,66 SAY "COSTO TOTAL"
ENDIF
RETURN

