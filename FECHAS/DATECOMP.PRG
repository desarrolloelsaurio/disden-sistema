FUNCTION DATECOMP
PARAMETER DATE_FEC
PRIVATE DATE_FEC,DIA,MES,ANIO
DIA=ALLTRIM(STR(DAY(DATE_FEC)))
MES=QMES(MONTH(DATE_FEC))
ANIO=ALLTRIM(STR(YEAR(DATE_FEC)))
RETURN DIA+' de '+MES+' de '+ANIO