***************************************************************************
*-- Programa: FCDMASK.PRG
*-- Fecha   : 02-07-92
*-- Versi¢n : V.LEEGSTRA
*-- Notas   : MASCARA FACTURAS DE REMITENTES
***************************************************************************
CLEA
@ 1,3  SAY "Proveedor: "
@ 1,45 SAY "Nro FACTURA PROVEED.:"
@ 3,45 SAY "Fecha : "
@ 3,53 SAY DTOC(DATE())
@ 4,0  SAY "Cond. Pago: "
@ 5,0  SAY "Cotizaci¢n del "+PADC(xadol,7)+":"
@ 6,0 say padl("FACTURA EN "+padc(xadols,4)+" O "+padc(xauss,4),22)+":"
c1=1
c2=42
c3=51
c4=64
*if producto
   A="Ú"+repl("Ä",40)+"Â"+repl("Ä",8)+"Â"+repl("Ä",12)+"Â"+repl("Ä",14)+"¿"
   B="³"+space(40)+"³"+space(8)+"³"+space(12)+"³"+space(14)+"³"
   C="Ã"+repl("Ä",40)+"Å"+repl("Ä",8)+"Å"+repl("Ä",12)+"Å"+repl("Ä",14)+"´"
   D="À"+repl("Ä",40)+"Á"+repl("Ä",8)+"Á"+repl("Ä",12)+"Á"+repl("Ä",14)+"Ù"
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
