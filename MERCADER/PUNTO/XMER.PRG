*************************************
*-- Programa: XMER.PRG
*-- Fecha   : 08-03-92 08:18pm
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MERCADERIAS
*-- VERSION NAZA
**************************************
PROCEDURE XMER
ULPR=HORA_ULP(PROGRAM())
IF CHEQSEG()
   =OPMER()
   SELE MER
   =men_lin('Reindexando el Archivo')
   =FLOCK("MER") .OR. FLOK("MER")
   =DOTALK()
   =OPMERX()
   SELE MER
   PACK MEMO
   INDE ON ARTICULO          TAG ARTICULO
   INDE ON LEFT(ARTICULO,10) TAG ARTIRED
   INDE ON MERCA             TAG MERCA
   TX='CREA INDICE '
   =REOPMER()
   =UNTALK()
   =IAUD(TX)
ELSE
   =IAUDI()
ENDIF
RETURN
