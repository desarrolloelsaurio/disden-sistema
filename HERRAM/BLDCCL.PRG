sele 1
use H:\ARCHIVOS\VENTASA\LCACLMA.DBF order tag numerore alias ccl
sele 2
use H:\ARCHIVOS\VENTASA\LfAacMA.DBF order tag factura alias fac
sele 3
use H:\ARCHIVOS\VENTASA\mixta.DBF order tag pagcod alias mix
sele 2
clea
scan
? factura
if xseek(fac.factura,'ccl','numerore')
   ?? '|'
   ?? ccl.numerore
   ?? '|'
   ?? ccl.codcli
   ?? '|'
   ?? fac.codcli
else
   sele ccl
   appe blan
   repl codcli with fac.codcli
   repl fechaop with fac.fechaem
   repl fechave with fac.fechaem
   repl detalle with 'FA-000-   -   -   -   -       '
   repl compr with "FAC.N§"+str(fac.factura,9)
   repl comprre with 'FA'
   repl numerore with fac.factura
   repl monto with fac.montonet
   repl moneda with 'P'
   repl equivale with fac.montonet
   repl pagada with .f.
   repl fecha with fac.fecha
   repl usuario with 'FERNANDA'
   sele fac
endif
endscan
