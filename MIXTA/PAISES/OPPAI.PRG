********************************************************************************
*-- Programa: OPPAI.PRG
*-- Fecha   : 10-27-92 02:17am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO PAISES
*-- Modif. GOYO 10-25-92 05:45pm (men_lin)
********************************************************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG PAITEX
ELSE
	=MEN_LIN(ABA+"Pa¡ses")
	SELE 1
	=GETDBF('MIXTA','PAYTEX','MIX')
ENDIF
RETURN IIF(PAIPOP,DEFPOMIX(PAIPOPR,PAIPOPC),.T.) .AND. MEN_LIN(BOTOM)
