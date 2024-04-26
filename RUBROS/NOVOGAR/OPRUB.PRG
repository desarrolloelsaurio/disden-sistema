*************************************
*-- Programa: OPRUB.PRG
*-- Fecha   : 01-21-93 04:53pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO RUBROS
*************************************
#DEFINE BOTOM  "  "+repl("°",78)                 && BOTOM
#IF "NAZA" $ CURDIR()
IF ESOPEN("Rubros",26,"RUB")
#ELSE
IF ESOPEN("Rubros",16,"RUB")
#ENDIF
	USE (PATHPRO+'\RUBROS') ORDER TAG RUBRO ALIAS RUB
ENDIF
RETURN IIF(RUBPOP,DEFPOGRL(RUBPOPR,RUBPOPC,"RUBPOP","RUB.RUBRO",30,'Elija el rubro'),.T.) .AND. MEN_LIN(BOTOM)
