#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

IF !USED("CFAC")
    =MEN_LIN(ABA+"Control de Facturas Talleres")
    =prxarea(.t.)
    USE F:\SISTEMAS\CONTROL\ctrltall ORDER TAG CORTE ALIAS cfac
ELSE
   SELE CFAC    
ENDIF
RETURN MEN_LIN(BOTOM)
