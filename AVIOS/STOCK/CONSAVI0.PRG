#DEFINE PAIP   "|"                               && PAIP
FUNCTION CONSAVI0
? PAIP
?? " "+SUBSTR(AVICODPRO,5,2)
?? PAIP
?? " "+SUBSTR(AVICODPRO,3,2)
?? PAIP
?? STR(SALIDA,XACDIGI)
STORE TOTAL[1]+SALIDA TO TOTAL[1]
?? PAIP
ELCOS=AVIS.MONTO*SALIDA
?? STR(ELCOS,XACDIGI)
STORE TOTAL[2]+ELCOS TO TOTAL[2]
?? PAIP
RETURN .T.