set confirm on
set date brit
set excl off
set dele on
set talk on nowindow

use f:\sistemas\ventas\ventasa\factudat alias fax in 1
use f:\sistemas\ventas\ventasa\factura  alias fac in 2
use f:\sistemas\ventas\ventasa\personas alias per in 3
use f:\sistemas\ventas\ventasa\merca    alias mer in 4
use f:\sistemas\ventas\ventasa\mixta    alias mix in 5
use \\bochi\zip\ventasa\factudat        alias fax2 in 6
use \\bochi\zip\ventasa\factura         alias fac2 in 7

store date() to fechini, fechfin
store 0.00 to m.pesos2000, m.pesos2008, pesost
do para3mx.spr