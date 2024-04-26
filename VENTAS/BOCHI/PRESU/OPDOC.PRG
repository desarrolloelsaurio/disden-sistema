***********************************************
*-- Programa: OPDOC.PRG
*-- Fecha   : 11/02/91 13:31am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE DOCUMENTACION
*-- Modificaci¢n GOYO (area 22)
***********************************************
PARAMETER SHIT
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
=men_lin(ABA+IIF(_WINDOWS,'Documentación','Documentaci¢n'))
IF USED("DOC")
	SELE DOC
ELSE
	SELE 0
	USE (CAMINO+"\DOCUMENT") ALIAS DOC
ENDIF
**=GETDBF('document',.F.,'DOC',22)
RETURN MEN_LIN(BOTOM)
