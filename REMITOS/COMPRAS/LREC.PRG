FUNCTION LREC
	PARAMETER LAPAN
	respuesta='LREC#7#25#Tipo de Listado de Remitos de Proveedores#3;
#\<Cabecera;
#\<Ranking por Producto;
#\<Ranking por Monto;
#\<Productos'
	=DEFPOP()
	ON SELE POPU LREC DO LREC1 WITH LAPAN
	ACTI POPU LREC
	RELE POPU LREC
RETURN .T.
