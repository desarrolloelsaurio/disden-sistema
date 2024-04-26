****************************************
*-- PROGRAMA: OPPER.PRG
*-- FECHA   : 06/12/91 01:50PM
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO CLIENTES
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF USED("PER")
   SELE PER
   SET ORDER TO TAG CLIENTES
ELSE
   =MEN_LIN(ABA+'Clientes')
   SELE 0
   USE (camino+'\PERSONAS') ORDER TAG CLIENTES ALIAS PER
ENDIF
RETURN IIF(CLIPOP,DEFPOPER(CLIPOPR,CLIPOPC),.T.) .AND. MEN_LIN(BOTOM)
