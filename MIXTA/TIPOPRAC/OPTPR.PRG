*******************************************
*-- Programa: OPTPR.PRG
*-- Fecha   : 10-11-92 01:01pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE TIPO DE PRACTICA
*-- MODIF GOYO 04-28-93 02:51pm
*******************************************
IF USED("MIX")
	SELE 1
	SET ORDER TO TAG TPRTEX
ELSE
	=MEN_LIN(ABA+"Tipo de Pr ctica")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG TPRTEX ALIAS MIX
ENDIF
RETURN IIF(TPRPOP,DEFPOMIX(TPRPOPR,TPRPOPC),.T.) .AND. MEN_LIN(BOTOM)
