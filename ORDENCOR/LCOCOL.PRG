FUNCTION LCOCOL
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL
#DEFINE PICUMAX "9,999,999,999,999.99"           && PICUMAX
#DEFINE PAIP   "|"                               && PAIP
? PAIP
?? TEXTO
?? paip
?? str(PANTALON,xacdigi)
?? paip
?? str(REMERA,xacdigi)
?? paip
?? str(CAMISA,xacdigi)
?? paip
?? str(BUZO,xacdigi)
?? paip
?? str(OTROS,xacdigi)
?? paip
PITO=REMERA+PANTALON+CAMISA+BUZO+OTROS
?? str(PITO,xacdigi)
?? paip
STORE TOTAL[1]+PANTALON TO TOTAL[1]
STORE TOTAL[2]+REMERA   TO TOTAL[2]
STORE TOTAL[3]+CAMISA   TO TOTAL[3]
STORE TOTAL[4]+BUZO     TO TOTAL[4]
STORE TOTAL[5]+OTROS    TO TOTAL[5]
STORE TOTAL[6]+PITO     TO TOTAL[6]
RETURN .T.