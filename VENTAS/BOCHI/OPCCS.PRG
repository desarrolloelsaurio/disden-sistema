*******************************************
*-- Programa: OPCCS.PRG
FUNCTION OPCCS
IF USED("CCS")
	SELE CCS
ELSE
	=MEN_LIN(ABA+"Cta Cte Stock")
   =PRXAREA(.T.)
	use (PATHVEN+"\CCSTOCK") ALIAS CCS
ENDIF
RETURN MEN_LIN(BOTOM)

