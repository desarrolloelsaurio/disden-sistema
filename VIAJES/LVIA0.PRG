#DEFINE PAIP   "|"                               && PAIP
FUNCTION LVIA0
? PAIP
?? STR(NUMERO,6)
?? PAIP
?? SAYPER(BUQUE,"BUQCOD")
LAB=LEFT(PER.DETALLE,8)
?? PAIP
?? SAYPER(CLIENTE,"CODCLI")
?? PAIP
?? LAB
?? PAIP
RETURN .T.