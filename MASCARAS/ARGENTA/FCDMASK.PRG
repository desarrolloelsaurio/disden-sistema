***************************************************************************
*-- Programa: FCDMASK.PRG
*-- Fecha   : 02-07-92
*-- Versión : V.LEEGSTRA
*-- Notas   : MASCARA FACTURAS DE REMITENTES
***************************************************************************
CLEA
@ 1,3  SAY "Proveedor: "
@ 1,45 SAY "Nro FACTURA PROVEED.:"
@ 3,45 SAY "Fecha : "
@ 3,53 SAY DTOC(DATE())
@ 4,0  SAY "Cond. Pago: "
@ 5,0  SAY "Cotización del "+PADC(xadol,7)+":"
@ 6,0 say padl("FACTURA EN "+padc(xadols,4)+" O "+padc(xauss,4),22)+":"
c1=1
c2=42
c3=51
c4=64
*if producto
   A="┌"+repl("─",40)+"┬"+repl("─",8)+"┬"+repl("─",12)+"┬"+repl("─",14)+"┐"
   B="│"+space(40)+"│"+space(8)+"│"+space(12)+"│"+space(14)+"│"
   C="├"+repl("─",40)+"┼"+repl("─",8)+"┼"+repl("─",12)+"┼"+repl("─",14)+"┤"
   D="└"+repl("─",40)+"┴"+repl("─",8)+"┴"+repl("─",12)+"┴"+repl("─",14)+"┘"
   @ 7,0 SAY A
   @ 8,0 SAY B
   @ 8,c1 SAY "ARTICULO"
   @ 8,c2 SAY "CANTIDAD"
   @ 8,C3 SAY "PRECIO UNIT."
   @ 8,C4 SAY "PRECIO TOTAL"
   @ 9,0 SAY C
   FOR ren=10 TO 23
      @ ren,0 SAY B
   ENDF
   @ ren,0 SAY D
*else
*   @ 7,0 say "Tipo Gasto:"
*endif
RETURN
* EOF - INDENT
