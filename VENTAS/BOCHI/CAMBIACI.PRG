sele 1
use f:\sistemas\ventas\ventasa\factura alias fac
sele 2
use f:\sistemas\ventas\ventasa\personas orde tag codcli alias cli
sele 3
use f:\sistemas\ventas\ventasa\mixta orde tag ciucod alias ciu
sele  1
set rela to codcli into cli
sele 2
set rela to localidad into ciu
sele 1
count to pepe for ciu.nu1<>ciu.nu2
wait str(pepe) wind
brow fiel factura, cli.codcli, cli.cliente, ciu.texto1, ciu.nu1, ciu.nu2 ;
          for ciu.nu1<>ciu.nu2

