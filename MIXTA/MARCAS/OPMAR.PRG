********************************************************************************
*-- Programa: OPMAR.PRG
*-- Fecha   : 11-21-91 11:21am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO MARCAS DE PRODUCTOS
*-- VERSION BALCALA
********************************************************************************
#DEFINE ABA    "Abriendo Base de "               && ABA
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM

IF ESOPEN("Marcas",1,"MIX")
	USE (PATH+'\MIXTA') order tag martex ALIAS mix
ELSE
	SET ORDER TO TAG MARTEX
ENDIF
RETURN IIF(MARPOP,DEFPOMIX(MARPOPR,MARPOPC),.T.) .AND. MEN_LIN(BOTOM)

