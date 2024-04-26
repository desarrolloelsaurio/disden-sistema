**********************************
*-- Programa: XMI1.PRG
*-- Fecha   : NOV. 1993
*-- Version : G. REINER
*-- Notas   : RESTAURA BASE MERCA
***********************************
ulpr=HORA_ULP(PROGRAM())
IF CHEQSEG()
   SELE mer
   =men_lin('Reindexando el Archivo de Mercader¡as')
   =FLOCK("MER") .or. FLOK("MER")
   =dotalk()
   =opMERX()
   INDE ON merca TAG MERCA
   INDE ON articulo TAG ARTICULO
   INDE ON MARCA TAG MARCA
   INDE ON MODELO TAG MODELO
   =reopMER()
   =untalk()
   =iaud('Mercader¡as')
ELSE
   =IAUDI()
ENDIF
RETURN men_lin(botom)
