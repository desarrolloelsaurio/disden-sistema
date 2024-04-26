********************************************************************************
*-- Programa: OPMAT.PRG
*-- Fecha   : 06/06/91
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE MATERIALES
********************************************************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#DEFINE ABA    "Abriendo Base de "               && ABA

IF ESOPEN(MADERS,1,'MIX')
	USE (PATHPRO+'\MIXTA') ORDER TAG MATTEX ALIAS MIX
ELSE
	SET ORDER TO TAG MATTEX
ENDIF
RETU IIF(MATPOP,DEFPOMIX(MATPOPR,MATPOPC),.T.) .AND. MEN_LIN(BOTOM)
