****************************************
*-- PROGRAMA: OPCLITXT.PRG
*-- FECHA   : 21/10/95
*-- VERSION : G. REINER
*-- NOTAS   : ABRE ARCHIVO CLIENTES TEMPORAL
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
IF USED("CLITXT")
   SELE CLITXT
   SET ORDER TO TAG FACTURA
ELSE
   =MEN_LIN(ABA+'Clientes Contado')
   =PRXAREA(.T.)
   USE (PATHPRO+'\CLITXT') ORDER TAG FACTURA ALIAS CLITXT
ENDIF
RETURN MEN_LIN(BOTOM)
