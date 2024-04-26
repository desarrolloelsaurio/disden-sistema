****************************************
*-- Programa: OPPER.PRG
*-- Fecha   : 06/07/91 10:58am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE PERSONAS
****************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

PARAMETER O_REOP,O_EXCL
=IIF(O_REOP,REOPXXX("PER"),.T.)
=IIF(O_REOP,CLOSDBF("PER"),.T.)
IF USED("PER")
	SELE PER
	RETURN MEN_LIN(BOTOM)
ENDIF
RETURN MEN_LIN(ABA) .AND. ;
GETDBF('PERSONAS',.F.,"PER",PRXAREA(.T.),O_EXCL) .AND. ;
MEN_LIN(BOTOM)
