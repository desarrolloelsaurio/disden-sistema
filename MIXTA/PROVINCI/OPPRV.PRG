**************************************
*-- Programa: OPPRV.PRG
*-- Fecha   : 06-29-94 02:55pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO PROVINCIAS
**************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PARAMETER OTROALIAS
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG PRVTEX
ELSE
	=MEN_LIN(ABA+"Provincias")
	SELE 1
	=GETDBF('MIXTA','PRVTEX','MIX')
ENDIF
IF OTROALIAS .AND. !USED("PRV")
	=PRXAREA(.T.)
	=GETDBF('MIXTA','PRVTEX','PRV',.F.,.T.,.T.)
ENDIF
RETURN IIF(PRVPOP,DEFPOMIX(PRVPOPR,PRVPOPC),.T.) .AND. MEN_LIN(BOTOM)
