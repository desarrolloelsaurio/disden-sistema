FUNCTION LPEC
	PARAMETER LAPAN
	respuesta='lpec#8#40#Tipo de Listado de Notas de Pedido de Proveedores#3;
#\<Cabecera;
#\<Ranking por Producto;
#\<Ranking por Monto;
#\<Productos'
	=DEFPOP()
	ON SELE POPU LPEC DO LPEC1 WITH LAPAN
	ACTI POPU LPEC
	RELE POPU LPEC
RETURN .T.
