************************************
*-- Programa: OPKARS.PRG
*-- Fecha   : 06/18/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO KARDEX PARA STOCK
*-- Modificaci¢n GOYO 03/08/92
************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
PARAMETER OP_REOP,OP_EXCL
IF OP_REOP
	=REOPXXX("KARS")
ENDIF
IF USED("KARS")
	IF OP_EXCL
		USE IN LARS
	ELSE
		SELE KARS
	  RETURN .T.
  ENDIF
ENDIF
=MEN_LIN(ABA+"Kardex")
=PRXAREA(.T.)
IF OP_EXCL
	USE (PATH+'\KARDESTO') ORDER TAG ARTICULO ALIAS KARS EXCL
ELSE
	USE (PATH+'\KARDESTO') ORDER TAG ARTICULO ALIAS KARS
ENDIF
RETURN MEN_LIN(BOTOM)
