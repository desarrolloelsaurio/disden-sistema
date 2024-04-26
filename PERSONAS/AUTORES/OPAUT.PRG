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
   SET ORDER TO TAG AUTORES
ELSE
   =MEN_LIN(ABA+'Autores')
   SELE 21
   USE (PATHPRO+'\PERSONAS') ORDER TAG AUTORES ALIAS PER
ENDIF
RETURN IIF(AUTPOP,DEFPOPER(AUTPOPR,AUTPOPC),.T.) .AND. MEN_LIN(BOTOM)
