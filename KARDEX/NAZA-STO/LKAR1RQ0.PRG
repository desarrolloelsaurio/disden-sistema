FUNCTION LKAR1RQ0
#DEFINE NUL    0                                 && NUL
#DEFINE PAIP   "|"                               && PAIP
? PAIP
?? KARS.FECHAOP
?? PAIP
?? ELCOD()
?? PAIP
?? LEFT(ELTEX(),30)
?? PAIP
?? STR(KARS.ENTRADA,XACDIGI,2)
?? PAIP
?? LEFT(ELUNI(),4)
?? PAIP
RETURN .T.
