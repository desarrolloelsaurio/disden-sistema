*******************************************
*-- Programa: OPLOT.PRG
FUNCTION OPXLOT
IF USED("LOT")
	SELE LOT
ELSE
	=MEN_LIN(ABA+"Lotes")
   =PRXAREA(.T.)
	use (camino2+"\LOTES") ALIAS LOT
ENDIF
RETURN MEN_LIN(BOTOM)

