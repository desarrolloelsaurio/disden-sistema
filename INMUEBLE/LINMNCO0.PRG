FUNCTION LINMNCO0
#DEFINE PAIP   "|"                               && PAIP
#DEFINE NUL     0                                 && NUL
? PAIP
?? CODINM
?? PAIP
?? LEFT(DOMICILIO,30)
?? PAIP
?? SAYPER(PROCOD,"PRPCOD")
?? PAIP
STORE CASOS+1 TO CASOS
RETURN .T.
