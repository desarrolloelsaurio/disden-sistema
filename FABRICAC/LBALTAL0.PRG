FUNCTION LBALTAL0
#DEFINE PAIP   "|"                             && PAIP
? PAIP
?? NUMERO
?? PAIP
?? REMITO
?? PAIP
?? ARTICULO
=IIF(PORP,"",QOUT(PAIP+LEFT(MER.MERCA,30)))
?? PAIP
if month(ef)=m.xMES
   ?? STR(EEC,XACDIGI-2)
   TEEC=TEEC+EEC
else
   ?? space(xacdigi-2)
endif
?? PAIP
if month(sf)=m.xMES
   ?? STR(SSC,XACDIGI-2)
   TSSC=TSSC+SSC
else
   ?? space(xacdigi-2)
endif
?? PAIP
if empty(SF)
   ?? "----"
else
   DIAS=SF-EF
   ?? STR(DIAS,4)
   TDIA=TDIA+DIAS
endif
?? PAIP
CASOS=CASOS+1
RETURN .T.
