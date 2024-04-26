*************************************************************************
*-- Programa: OPVEN.PRG
*-- Fecha   : 28/10/96
*-- Version : 'EL BATA'
*-- Notas   : ABRE ARCHIVO VENDEDORES (PARA BOCHI)
********************************************************************************
FUNCTION OPVEN
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF !USED("VEN")
   =PRXAREA(.T.)
   USE (PATHVEN+'\VENDEDOR') ORDER TAG CODIGO ALIAS VEN
ENDIF
RETURN MEN_LIN(BOTOM)

