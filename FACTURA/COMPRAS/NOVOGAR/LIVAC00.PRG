FUNCTION LIVAC00
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE PICUMA1 "9,999,999,999,999"              && PICUMA1
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
? PAIP
?? FECHAEM
?? PAIP
?? TIPO
?? SPACE(1)
?? factura
?? paip
?? sayper(codcli,"procod",15)
?? paip
?? per.condiva
?? " " 
?? per.nroiva
?? paip
?? str(montobru,10,2)
STORE TOTAL[1]+MONTOBRU TO TOTAL[1]
?? paip
?? str(montoexe,10,2)
STORE TOTAL[2]+MONTOEXE TO TOTAL[2]
?? paip
?? str(montoot3,10,2)
STORE TOTAL[3]+MONTOOT3 TO TOTAL[3]
?? paip
?? str(montoiva,10,2)
STORE TOTAL[4]+MONTOIVA TO TOTAL[4]
?? paip
?? str(montoper,10,2)
STORE TOTAL[5]+MONTOPER TO TOTAL[5]
?? paip
?? str(montonet,10,2)
STORE TOTAL[6]+MONTONET TO TOTAL[6]
?? paip
return .t.
