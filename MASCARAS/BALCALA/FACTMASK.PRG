function factmask
parameter osa
private osa,salida
if osa
   @ 1,1 SAY "Cliente:"
   @ 5,1 SAY "Empresa   :"
   @ 6,1 SAY "Factura N§:"
   @ 1,45 SAY left(biaja,8)+":"
   @ 2,45 SAY "Cond. Pago:"
   @ 4,45 SAY "Fecha de emisi¢n:"
   @ 5,45 SAY "Moneda en que se factura:"
   @ 6,45 SAY "Cotizaci¢n:"
endif
salida=CUADRO("5 7 23 0 1 10 30 8 10 13")
@ 8,2 SAY "ARTICULO"
@ 8,13 SAY "MERCADERIA"
@ 8,45 SAY "CANT"
@ 8,52 SAY "PRECIO UN."
@ 8,64 SAY "PRECIO TOTAL"
return salida
