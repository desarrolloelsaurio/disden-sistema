FUNCTION LINM6
#DEFINE PAIP   "|"                               && PAIP
? PAIP
?? CODINM
?? PAIP
?? LEFT(DOMICILIO,20)
?? PAIP
?? IIF(EMPTY(INMOC),"VACIO ","      ")
?? PAIP
?? IIF(EMPTY(MUNIC),"VACIO ","      ")
?? PAIP
?? IIF(EMPTY(DIPOC),"VACIO ","      ")
?? PAIP
?? IIF(EMPTY(INMOBILIAR),"VACIO ","      ")
?? PAIP
?? IIF(EMPTY(MUNICIPAL),"VACIO ","      ")
?? PAIP
?? IIF(EMPTY(DIPOS),"VACIO ","      ")
?? PAIP
CASOS=CASOS+1
RETURN .T.
