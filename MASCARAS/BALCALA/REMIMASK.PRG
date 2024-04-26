function REMIMASK
parameter osa,ESPEDIDO
private osa,salida
if osa
   @ 5,1 SAY "Empresa   :"
   IF ESPEDIDO
   @ 6,1 SAY "N. Ped. N§:"
   ELSE
   @ 6,1 SAY "Remito N§ :"
   ENDIF
   @ 1,45 SAY LEFT(PROPER(BIAJA),7)+":"
   @ 4,45 SAY "Fecha de emisi¢n:"
   if ulpr#"REMI"   
   @ 5,45 SAY "Moneda:"
   @ 6,45 SAY "Cotizaci¢n:"
   @ 1,1 SAY "Cliente:"   
   @ 2,45 SAY "Cond. Pago:"
   endif
endif
salida=CUADRO("5 7 23 0 1 10 30 8 10 13")
@ 8,2 SAY "ARTICULO"
@ 8,13 SAY "MERCADERIA"
@ 8,45 SAY "CANT"
@ 8,52 SAY "PRECIO UN."
@ 8,64 SAY "PRECIO TOTAL"
return salida
