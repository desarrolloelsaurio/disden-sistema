********************************************************************************
*-- Programa: OPVAR.PRG
*-- Fecha   : 01-25-93 05:56pm
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO DE TIPO DE VARIEDAD
********************************************************************************
IF ESOPEN("Tipo de Variedad",1,"MIX")
	USE (PATH+'\MIXTA') ORDER TAG VARTEX ALIAS mix
ELSE
	SET ORDER TO TAG VARTEX
ENDIF
IF VARpop
	DEFI POPU VARpop FROM VARpopr,VARpopc PROMPT FIELD mix.texto1 MESS 'Elija el Tipo de Variedad ' SHAD COLOR SCHE 3 IN SCREEN
	ON SELE POPU VARpop DO resp1
ELSE
	RELE POPU VARpop
ENDIF
=MEN_LIN(BOTOM)
RETURN
