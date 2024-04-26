PARAMETER PORPx
#DEFINE PAIP   "|"                               && PAIP
M.OPTAR=ALGUN(30,"Tipo de Listado",;
  "\<Completo;"+;
  "C\<ajas por Cliente")
DO CASE
cASE M.OPTAR=1
   do lper with porpx
CASE M.OPTAR=2
=working()
=dotalk()
   =opcjj()
   set order to tag codcli
   tmp=gentmp()
   tmp1=gentmp()
   =flock() .or. flok()
   copy to (tmp)
   unlo in cjj
   =prxarea(.t.)
   use (tmp) alias tmp
   repl all columna with 1
   index on codcli tag codcli
   set order to tag codcli
   total on codcli field columna to (tmp1)
   =prxarea(.t.)
   use (tmp1) alias tmp1
   =prxarea(.t.)
   create cursor temporal ;
   (cliente c(30),;
   codcli c(10),;
   columna n(10))
   appe from (tmp1)
   =opcli()
   sele temporal
   set order to tag codcli in per
   set rela to CODCLI into per
   repl all cliente with per.cliente
   index on cliente tag codcli
   set order to tag codcli
   TT="Listado de Cajas de Clientes"
   acla=paip+;
   PADC("CODIGO",10)+;
   PAIP+;
   padc("CLIENTE",30)+;
   PAIP+;
   PADC("CAJAS",XACDIGI)+;
   PAIP
   =LGRL2(PORPX,"TEMPORAL","LCLICA0()","CAJAS X CLIENTES",'LCLICA',.T.,REPL("9",XACDIGI))
   =untalk()
   =unwork()
   =off_tmp()
ENDCASE
return