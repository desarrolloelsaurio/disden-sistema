********************************************************************************
*-- Programa: OPGRU.PRG
*-- Fecha   : 11-21-91 10:51am
*-- Version : G. REINER
*-- Notas   : ABRE ARCHIVO GRUPOS DE COMPRA
********************************************************************************
IF ESOPEN("Grupos",1,"MIX")
	USE (PATH+'\MIXTA') ORDER TAG GRUTEX ALIAS mix
ELSE
	SET ORDER TO TAG GRUTEX
ENDIF
IF grupop
	DEFI POPU MIXPOP FROM grupopr,grupopc PROMPT FIELD mix.texto1 MESS 'Elija la L¡nea' SHAD COLOR SCHE 3 IN SCREEN
	ON SELE POPU MIXPOP DO resp1
ENDIF
=MEN_LIN(BOTOM)
RETURN
