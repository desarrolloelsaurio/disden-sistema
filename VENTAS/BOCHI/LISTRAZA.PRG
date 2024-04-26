use f:\sistemas\ventas\ventasa\ccstock alias ccs in 0
use f:\sistemas\ventas\ventasa\lotes   alias lot in 0
************   lista stock en disden
if .f.
SELECT sum(0-cantidad) as unidades, articulo, lote FROM ccs group by articulo, lote ;
  union all ;
  select sum(cantidad) as unidades, articulo, lote FROM lot group by articulo, lote;
  into cursor jj
endif
************   lista stock de un cliente
if .f.
SELECT sum(cantidad) as unidades, articulo, lote FROM ccs group by articulo, lote where codcli="C000000612" ;
  into cursor jj
endif
************   lista stock de un lote OJO falta
if .f.
SELECT sum(cantidad) as unidades, articulo, lote FROM ccs group by articulo, lote where codcli="C000000612" ;
  into cursor jj
endif
************   totaliza
sele jj
inde on articulo+lote tag x
total on articulo+lote to pepe
*** SELECT  ccs group by articulo, lote
