**************************************
*-- Programa: OPSEC.PRG
*-- Fecha   : 06-29-94 02:55pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO Secci¢nS
**************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG SECTEX
ELSE
	=MEN_LIN(ABA+"Secci¢nes")
	SELE 1
	=GETDBF('MIXTA','SECTEX','MIX')
ENDIF
RETURN IIF(SECPOP,DEFPOMIX(SECPOPR,SECPOPC),.T.) .AND. MEN_LIN(BOTOM)
