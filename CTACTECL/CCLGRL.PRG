FUNCTION CCLGRL
PARAMETER RR,CC
respuesta='nada#'+STR(RR)+'#'+STR(20)+'#Estado de Cuenta#3;
#\<Deuda de los Clientes;
#\<Cheques en Cartera;
#\<Agrupa por Factura;
#\<Estado Patrimonial;
#\<Falta de Recepci¢n de Pagos;
#An \<lisis de un Cliente'
respuesta=respuesta+';
#\<Hist¢rico;
#\<Mal Imputadas;
#Saldo Ne\<gativo;
#C\<onsistencia de Recibos;
#\<Un Cliente'
RETURN defpop()
