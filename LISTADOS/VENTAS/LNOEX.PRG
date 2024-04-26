FUNCTION LNOEX
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
? PAIP
?? NROITE
?? PAIP
?? STR(CANT,XACDIGI)
?? PAIP
STORE TOTAL+CANT TO TOTAL
RETURN .T.