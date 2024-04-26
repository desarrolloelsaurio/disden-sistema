*****************************************
*-- Programa: OPRECI.PRG
*-- Fecha   : 21/10/95
*-- Version : G. RENER
*-- Notas   : ABRE ARCHIVO DE RECIBOS
*****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF !USED("RECI")
	=MEN_LIN(ABA+"Recibos")
	=prxarea(.t.)
	USE (pathcaj+'\RECIBOS') ALIAS RECI
ENDIF
IF !USED("REXI")
	=MEN_LIN(ABA+"Recibos")
	=prxarea(.t.)
	USE (pathcaj+'\RECIBOX') ALIAS REXI
ENDIF
SELE RECI
RETU MEN_LIN(BOTOM)
