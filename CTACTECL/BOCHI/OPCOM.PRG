********************************************************************************
*-- Programa: OPCOM.PRG
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF ESOPEN("Comisiones",19,"COM")
	USE (PATHVEN+'\COMIS') ORDER TAG ARTICULO ALIAS com
ENDIF
RETURN MEN_LIN(BOTOM)

