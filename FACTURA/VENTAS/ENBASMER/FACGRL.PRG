FUNCTION FACGRL
PARAMETER FAC_REN,FAC_COL
respuesta='nadax#'+;
ALLTRIM(STR(FAC_REN))+"#"+;
ALLTRIM(STR(FAC_COL))+"#;
Tipo de Listado de Facturas#3;
#\<Listados;
#\<Documentación Emitida;
#Libro de \<IVA Ventas;
#Libro de IVA Ventas por \<Producto;
#\<Ultima Operación;
#Pla\<nilla;
#\<Costos;
#\<Diferencia de Precios;
#\<Facturas Faltantes"
RETURN defpop()
