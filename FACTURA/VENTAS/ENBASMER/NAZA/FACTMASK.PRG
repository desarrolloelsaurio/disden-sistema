FUNCTION FACTMASK
PARAMETER ALGO
PRIVATE ALGO
SALIR=CUADRO("4 7 23 0 1 16 34 11 14")
IF ALGO
      @ 1,1 SAY "Cliente:"
      @ 5,1 SAY "Marca     :"
      @ 6,1 SAY "Factura N§:"
      @ 1,45 SAY biaja+":"
      @ 2,45 SAY "Cond. Pago:"
      @ 4,45 SAY "Fecha de emisi¢n:"
      @ 5,45 SAY "Moneda en que se factura:"
      @ 6,45 SAY "Cotizaci¢n:"

      @ 8,1 SAY "ARTICULO"
      @ 8,18 SAY "MERCADERIA"
      @ 8,36 SAY "TAL/CUR"
      @ 8,44 SAY "CANTIDAD"
      @ 8,53 SAY "PRECIO UNI."
      @ 8,66 SAY "PRECIO TOTAL"
ENDIF
RETURN SALIR