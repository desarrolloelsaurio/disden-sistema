*************************************
*-- Programa: XDES.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE DESTA
**************************************
PROCEDURE XDES
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
=HORA_ULP()
ULPR=PROGRAM()
IF CHEQSEG()
   =OPDES()
   SELE DES
   =men_lin('Reindexando el Archivo')
   =FLOCK("DES") .OR. FLOK("DES")
   =DOTALK()
   =OPDESX()
   SELE DES
           Index TAG   AVICODPRO  ON AVICODPRO
           Index TAG   TELCODPRO  ON TELCODPRO
           Index TAG   DESPAVI    ON ARTICULO+AVICODPRO+STR(TALLE)   FOR .NOT.EMPTY(AVICODPRO)
           Index TAG   DESPTEL    ON ARTICULO+TELCODPRO+STR(TALLE)   FOR .NOT.EMPTY(TELCODPRO)
           Index TAG   ARTICULO   ON ARTICULO
           Index TAG   ARTITAL    ON ARTICULO+STR(TALLE)
   TX='CREA INDICE '
   =REOPDES()
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN MEN_LIN(BOTOM)
