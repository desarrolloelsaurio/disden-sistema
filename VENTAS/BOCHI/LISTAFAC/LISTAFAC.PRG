procedure listafac
set excl off
set dele on

sele 1
use f:\sistemas\ventas\ventasa\personas order proveedo alias pro 
brow fiel Proveedor=cliente
qa=codcli
sele 2
use f:\sistemas\compras\comprasa\facturac alias fac 
SELECT a.cliente, b.factura, b.fechave, b.monto ;
	FROM pro a, fac b ;
	WHERE a.codcli = b.codcli and b.codcli=qa ;
	INTO TABLE temp order by fechave
repo form listafac to print promp
return