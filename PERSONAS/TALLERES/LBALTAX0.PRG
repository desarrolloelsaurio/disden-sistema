FUNCTION LBALTAX0
#DEFINE PAIP   "|"                             && PAIP
=XSEEK(ARTICULO, "MER", "ARTICULO")
? PAIP
?? NUMERO
?? PAIP
?? REMITO
?? PAIP
?? ARTICULO
=IIF(PORPAN,"",QOUT(PAIP+LEFT(MER.MERCA,30)))
=XSEEK(PRC, "PRC", "PRCCOD")
=QOUT(PAIP+LEFT(PRC.PROCFAB,IIF(PORPAN,10,30)))
?? PAIP
if month(ef)=m.xMES
   ?? STR(EEC,XACDIGI-2)
   STORE EEC+TOTAL[1] TO TOTAL[1]
else
   ?? space(xacdigi-2)
endif
?? PAIP
if month(sf)=m.xMES
   ?? STR(SSC,XACDIGI-2)
   STORE SSC+TOTAL[2] TO TOTAL[2]
else
   ?? space(xacdigi-2)
endif
?? PAIP
if empty(SF)
   ?? "----"
else
   DIAS=SF-EF
   ?? STR(DIAS,4)
*   STORE DIAS+TOTAL[3] TO TOTAL[3]
endif
?? PAIP
if month(sf)=m.xMES .AND. !EMPTY(MONTO)
   ?? STR(MONTO,XACDIGI,2)
   STORE MONTO+TOTAL[4] TO TOTAL[4]
*   STORE MONTO+TOTAL TO TOTAL
else
   ?? space(xacdigi)
endif
?? PAIP
CASOS=CASOS+1
RETURN .T.
