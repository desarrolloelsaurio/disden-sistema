CREATE DBF IMPUESTOS ;
(FECHAOP D(8),;
PARTIDA C(15),;
IMPUESTO C(1),;
PERIODO N(2),;
CUOTA N(2),;
ANIO N(4),;
MONTO N(10,2),;
FECHA D(8),;
USUARIO C(10))

INDEX ON PARTIDA+IMPUESTO+STR(PERIODO,2)+STR(ANIO,2)+STR(CUOTA,1) TAG CONTROL