set excl off
sele 1
use f:\sistemas\ventas\ventasa\merca alias mer
sele 2
use c:\paraweb\rubrohab alias hab
scan
	sele 1
	list articulo, merca, rubro off for rubro=hab.rubro
endscan
close databases