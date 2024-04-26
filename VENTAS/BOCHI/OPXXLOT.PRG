*******************************************
*-- Programa: OPLOT.PRG
FUNCTION OPXXLOT
IF USED("LOT")
	SELE LOT
ELSE
	=MEN_LIN(ABA+"Lotes")
   =PRXAREA(.T.)
	use (camino3+"\LOTES") ALIAS LOT
ENDIF
RETURN MEN_LIN(BOTOM)

