*******************************************
*-- Programa: OPLOT.PRG
FUNCTION OPLOT
IF USED("LOT")
	SELE LOT
ELSE
	=MEN_LIN(ABA+"Lotes")
   =PRXAREA(.T.)
	use (PATHVEN+"\LOTES") ALIAS LOT
ENDIF
RETURN MEN_LIN(BOTOM)

