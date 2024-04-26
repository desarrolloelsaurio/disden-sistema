********************************************************************************
*-- Programa: lpropp.prg
*-- Fecha   : 09/12/91 12:42pm
*-- Version : G. REINER
*-- Notas   : DERIVA A OPERACIONES DE proentes
********************************************************************************
=HORA_ULP(PROGRAM())
fisc=fsc
DO CASE
CASE BAR()=1
   DO lprop5
CASE BAR()=2
   DO lprop1
CASE BAR()=3
   DO lprop2
CASE BAR()=4
   DO lprop3
ENDCASE
RETURN

*: EOF: LPROPP.PRG
