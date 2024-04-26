FUNCTION LINM5
#DEFINE PAIP   "|"                               && PAIP
A=PAIP+;
CODINM+;
PAIP+;
DOMICILIO+;
PAIP+;
IIF((ALLTRIM(DIPOS) $ DIPOC),"  S I  ","       ")+;
PAIP
A=A+;
IIF((ALLTRIM(MUNICIPAL) $ MUNIC),"  S I  ","       ")+;
PAIP+;
IIF((ALLTRIM(INMOBILIAR) $ INMOC),"  S I  ","       ")+;
PAIP
? A
CASOS=CASOS+1
RETURN .T.
