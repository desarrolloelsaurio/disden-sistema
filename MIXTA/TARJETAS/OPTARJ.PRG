*****************************************
*-- Programa: OPTARJ.PRG
*-- Fecha   : 21/10/95
*-- Version : G. RENER
*-- Notas   : ABRE ARCHIVO DE TARJETAS
*****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF !USED("TJDAT")
	=MEN_LIN(ABA+"Datos de Tarjetas")
	=prxarea(.t.)
	USE (pathcaj+'\TARJEDAT') ALIAS TJDAT
ENDIF
IF !USED("TARJ")
	=MEN_LIN(ABA+"Datos de Tarjetas")
	=prxarea(.t.)
	USE (pathcaj+'\TARJETAS') ALIAS TARJ
ENDIF
SELE TARJ
RETU MEN_LIN(BOTOM)
