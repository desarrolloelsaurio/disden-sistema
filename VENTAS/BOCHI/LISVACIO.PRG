TIPO_PER="C"
set excl off
set dele on
sele 1
use f:\sistemas\ventas\ventasa\mixta alias mix
sele 2
use f:\sistemas\ventas\ventasa\personas orde clientes alias per
TT=""
Tt1="LISTADO DE DOMICILIO VACIO"
repo form Lperi1 to prin prom for empty(per.domicilio)
return

function men_lin
return ""
