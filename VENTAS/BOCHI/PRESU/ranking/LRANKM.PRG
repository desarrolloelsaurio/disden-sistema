PROCEDURE LRANKM
PARAMETER EL_PPAN
DEFINE POPUP ranking FROM 3,50 MARGIN SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF ranking PROM "\<Unidades"
DEFINE BAR 2 OF ranking PROM "U\<nidades - 100 primeros"
DEFINE BAR 3 OF ranking PROM "\<Montos sin IVA"
DEFINE BAR 4 OF ranking PROM "M\<ontos sin IVA - 100 primeros"
DEFINE BAR 5 OF ranking PROM "Mi\<x"
ON SELE POPU RANKING DO LRANKM1
ACTI POPU RANKING
RELE POPU RANKING
RETURN .T.

PROCEDURE LRANKM1
elprom=alltrim(prompt())
do case
case elprom="Unidades - 100 primeros"
TL_LIS=2
case elprom="Montos sin IVA - 100 primeros"
TL_LIS=4
case elprom="Unidades"
TL_LIS=1
case elprom="Montos sin IVA"
TL_LIS=3
case elprom="Mix"
TL_LIS=5
case elprom="Costo -> Pcio Vta."
store (bar()#5) to m.EL_PPAN
TL_LIS=6
DEFINE POPUP solosumm ;
FROM 18,60 SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF solosumm PROM "\<Todas las facturas"
DEFINE BAR 2 OF solosumm PROM "\<Resúmen"
ON SELE POPU solosumm do elsumm
ACTI POPU solosumm 
RELE POPU solosumm 
ENDCASE

DEFINE POPUP unidades FROM 8,65 MARGIN SHADOW COLOR SCHEME 4
DEFINE BAR 1 OF unidades PROM "\<Todas las facturas"
DEFINE BAR 2 OF unidades PROM "Facturas '\<A'"
DEFINE BAR 3 OF unidades PROM "Facturas '\<B'"
DEFINE BAR 4 OF unidades PROM "Por \<Zona"
DEFINE BAR 5 OF unidades PROM "Por A\<grupación"
DEFINE BAR 6 OF unidades PROM "Por \<Proveedor"
DEFINE BAR 7 OF unidades PROM "Por \<Cliente"
ON SELE POPU UNIDADES DO LRANK WITH BAR(),TL_LIS,EL_PPAN
ACTI POPU UNIDADES 
RELE POPU UNIDADES
RETURN .T.

proc elsumm
TL_LIS=iif(bar()=2,7,6)
keyb chr(27)
retu .t.