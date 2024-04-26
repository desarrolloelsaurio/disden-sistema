*******************************************
*-- Programa: OPTHO.PRG
*-- Fecha   : 10-11-92 01:01pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE TIPO DE HORA
*-- MODIF GOYO 26/10/95 13:28
*******************************************
IF USED("MIX")
	SELE MIX
	SET ORDER TO TAG THOTEX
ELSE
	=MEN_LIN(ABA+"Tipo de Hora")
	SELE 1
	USE (PATHPRO+'\MIXTA') ORDER TAG THOTEX ALIAS MIX
ENDIF
RETURN IIF(THOPOP,DEFPOMIX(THOPOPR,THOPOPC),.T.) .AND. MEN_LIN(BOTOM)
