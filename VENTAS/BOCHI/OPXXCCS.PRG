*******************************************
*-- Programa: OPCCS.PRG
FUNCTION OPXXCCS
IF USED("CCS")
	SELE CCS
ELSE
	=MEN_LIN(ABA+"Cta Cte Stock")
   =PRXAREA(.T.)
	use (camino3+"\CCSTOCK") ALIAS CCS
ENDIF
RETURN MEN_LIN(BOTOM)

