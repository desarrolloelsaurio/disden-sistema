FUNCTION FACGRL
PARAMETER FAC_REN,FAC_COL
respuesta='nadax#'+;
ALLTRIM(STR(FAC_REN))+"#"+;
ALLTRIM(STR(FAC_COL))+"#;
Tipo de Listado de Facturas#3;
#\<Listados;
#\<Documentaci¢n Emitida;
#Libro de \<IVA Ventas;
#Libro de IVA Ventas por \<Producto;
#\<Ultima Operaci¢n;
#Pla\<nilla;
#\<Costos"
respuesta=respuesta+'#\<Diferencia de Precios;
#\<Facturas Faltantes;
#M s de \<$ 15000 Trimestral;
#M s de $ \<10000 Mensual'
RETURN defpop()
