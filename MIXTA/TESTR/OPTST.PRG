**************************************
*-- Programa: OPTST.PRG
*-- Fecha   : 06-29-94 02:55pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO ESTRUCTURAS
**************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
PARAMETER OTROALIAS
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG TSTTEX
ELSE
	=MEN_LIN(ABA+"Estructuras")
	SELE 1
	=GETDBF('MIXTA','TSTTEX','MIX')
ENDIF
IF OTROALIAS .AND. !USED("TST")
	=PRXAREA(.T.)
	=GETDBF('MIXTA','TSTTEX','TST',.F.,.T.,.T.)
ENDIF
RETURN IIF(TSTPOP,DEFPOMIX(TSTPOPR,TSTPOPC),.T.) .AND. MEN_LIN(BOTOM)
