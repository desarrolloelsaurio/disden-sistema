********************************************************************************
*-- Name....: INMERIMP
*-- Date....: 9-21-89
*-- Version.: G. REINER
*-- Notes...: INGRESO IMPORTACION PROPIA
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
SELE MER
ON KEY LABEL TAB KEYB CHR(23)
ON KEY LABEL ENTER DO INM1
DEFI WIND WIN FROM 2,0 TO 22,79 TITL " MERCADERIA DE IMPORTACION PROPIA " DOUB
=MEN_LIN("[ENTER] para Cambiar de Opciones / [TAB] para Salir") 

BROW FIEL ARTIC:H="ARTICULO":R,;
DETALLE:H="DENOMINACION":R,;
A=" IMP PROPIA ?":H="IMP PROPIA" ,;
B=IIF(IMPORPROP," SI "," NO "):H="????" ;
FREE A ;
WIND WIN

ON KEY LABEL TAB 
ON KEY LABEL ENTER 
RETURN men_lin(botom)

FUNCTION INM1
IF IMPORPROP
   REPL IMPORPROP WITH .F.
ELSE
   REPL IMPORPROP WITH .T.
ENDIF
KEYB "{DNARROW}"
SHOW GETS WIND WIN
RETURN MEN_LIN("[ENTER] para Cambiar de Opciones / [TAB] para Salir") 
