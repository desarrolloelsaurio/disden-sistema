****************************************
*-- Programa: OPCID.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE CID
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_REOP,O_EXCL
IF O_REOP
	=REOPXXX("CID")
	=REOPXXX("CIX")
ELSE
	IF O_EXCL
		=CLOSDBF("CID")
		=CLOSDBF("CIX")
	ENDIF
ENDIF
=MEN_LIN(ABA+"C.I.D.")
=IIF(USED("CIX"),.T.,GETDBF('CIDDAT',.F.,"CIX",PRXAREA(.T.),O_EXCL))
=IIF(USED("CID"),.T.,GETDBF('CID',.F.,"CID",PRXAREA(.T.),O_EXCL))
SELE CID
RETURN MEN_LIN(BOTOM)
