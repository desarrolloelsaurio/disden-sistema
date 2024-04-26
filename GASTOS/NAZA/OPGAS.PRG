************************************
*-- Programa: OPgas.PRG
*-- Fecha   : 06/12/91 01:50pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO gastos
************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE NUL    0                                 && NUL

IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG GASTEX
ELSE
	=MEN_LIN(ABA+"Conceptos de Imputaci¢n")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG GASTEX ALIAS MIX
ENDIF
RETURN IIF(GASPOP,DEFPOMIX(GASPOPR,GASPOPC),.T.) .AND. MEN_LIN(BOTOM)