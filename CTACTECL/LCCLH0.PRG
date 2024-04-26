function lcclh0
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE PICUMA1 "9,999,999,999,999"              && PICUMA1
#DEFINE PAIP   "|"                               && PAIP
#DEFINE FOLC  ".F."                              && FOLC
? paip
?? FECHAOP
?? PAIP
?? DETALLE
?? PAIP
?? COMPRRE
?? " "
?? LEFT(COMPR,17)
?? PAIP
STORE M.TOTAL+GY_DEBE+GY_HABER TO M.TOTAL
?? TRANS(TOTAL,RIGHT(PICUMAX,XACDIGI))
?? PAIP