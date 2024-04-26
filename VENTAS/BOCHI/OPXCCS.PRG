*******************************************
*-- Programa: OPCCS.PRG
FUNCTION OPXCCS
IF USED("CCS")
	SELE CCS
ELSE
	=MEN_LIN(ABA+"Cta Cte Stock")
   =PRXAREA(.T.)
	use (camino2+"\CCSTOCK") ALIAS CCS
ENDIF
RETURN MEN_LIN(BOTOM)

